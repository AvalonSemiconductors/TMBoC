`default_nettype none

module as1802(
	input rst,
	input clk,
	input intr,
	
	input [7:0] data_in,
	output [7:0] data_out,
	
	output [7:0] address,
	
	output Q,
	output MRD,
	output MWR,
	
	input [3:0] EF,
	
	output TPA,
	output SC0,
	output SC1
);

reg [15:0] regs [15:0];
reg [7:0] D;
reg DF;
reg [7:0] B;
reg [7:0] instr_latch;
reg [3:0] X;
reg [3:0] P;
reg [7:0] T;
reg [3:0] EF_l;
reg Q_l;
reg tpa_l;
reg mrd_l;
reg mwr_l;
reg idle;
reg IE;
reg [1:0] S;
reg will_interrupt;
assign TPA = tpa_l;
assign MRD = mrd_l;
assign MWR = mwr_l;
assign Q = Q_l;
assign SC0 = S[0];
assign SC1 = S[1];

reg [7:0] last_hi_addr;
reg [15:0] addr_buff;
reg [7:0] addr_out_buff;
assign address = addr_out_buff;
assign data_out = B;

reg lda;
reg mem_write;
reg [2:0] mem_cycle;
reg [3:0] instr_cycle;

wire [3:0] op_high = instr_latch[7:4];
wire [3:0] ireg_addr = instr_latch[3:0];
wire [15:0] sel_reg = regs[ireg_addr];
wire cond_inv = instr_latch[3]; //Invert condition on branch instr.

reg branch_condition;
always @(*) begin
	case(instr_latch[2:0])
		0: branch_condition <= 1;
		1: branch_condition <= Q_l;
		2: branch_condition <= D == 0;
		3: branch_condition <= DF;
		4: branch_condition <= EF_l[0];
		5: branch_condition <= EF_l[1];
		6: branch_condition <= EF_l[2];
		7: branch_condition <= EF_l[3];
	endcase
end
wire should_branch = branch_condition ^ cond_inv;

reg longbranch_condition;
always @(*) begin
	case(instr_latch[3:0])
		0: longbranch_condition <= 1;
		1: longbranch_condition <= Q_l;
		2: longbranch_condition <= D == 0;
		3: longbranch_condition <= DF;
		4: longbranch_condition <= 0;
		5: longbranch_condition <= ~Q_l;
		6: longbranch_condition <= D != 0;
		7: longbranch_condition <= ~DF;
		
		8: longbranch_condition <= 1;
		9: longbranch_condition <= ~Q_l;
		10: longbranch_condition <= D != 0;
		11: longbranch_condition <= ~DF;
		12: longbranch_condition <= IE;
		13: longbranch_condition <= Q_l;
		14: longbranch_condition <= D == 0;
		15: longbranch_condition <= DF;
	endcase
end
wire is_skip = (instr_latch[3:0] >= 5 && instr_latch[3:0] <= 8) || (instr_latch[3:2] == 2'b11);

`ifdef SIM
wire [15:0] r0 = regs[0];
wire [15:0] r1 = regs[1];
wire [15:0] r2 = regs[2];
wire [15:0] r3 = regs[3];
wire [15:0] r4 = regs[4];
wire [15:0] r5 = regs[5];
wire [15:0] r6 = regs[6];
wire [15:0] r7 = regs[7];
wire [15:0] r8 = regs[8];
wire [15:0] r9 = regs[9];
wire [15:0] r10 = regs[10];
wire [15:0] r11 = regs[11];
wire [15:0] r12 = regs[12];
wire [15:0] r13 = regs[13];
wire [15:0] r14 = regs[14];
wire [15:0] r15 = regs[15];

wire [15:0] PC = regs[P];
wire [15:0] SP = regs[X];
`endif

always @(posedge clk) begin
	EF_l <= ~EF;
	if(rst) begin
		regs[0] <= 0;
		X <= 0;
		P <= 0;
		tpa_l <= 0;
		mrd_l <= 1;
		mwr_l <= 1;
		idle <= 0;
		IE <= 1;
		Q_l <= 0;
		DF <= 0;
		T <= 0;
		last_hi_addr <= 8'hFF;
		addr_out_buff <= 0;
		instr_cycle <= 0;
		will_interrupt <= 0;
	end else begin
		if(mem_cycle != 0) begin
			mem_cycle <= mem_cycle + 1;
			if(mem_cycle == 1) begin
				mrd_l <= 0;
				if(last_hi_addr == addr_buff[15:8]) begin
					addr_out_buff <= addr_buff[7:0];
					mem_cycle <= mem_write ? 4 : 5;
				end else begin
					addr_out_buff <= addr_buff[15:8];
					last_hi_addr <= addr_buff[15:8];
					#2;
					tpa_l <= 1;
				end
			end else if(mem_cycle == 2) begin
				tpa_l <= 0;
			end else if(mem_cycle == 3) begin
				addr_out_buff <= addr_buff[7:0];
				if(!mem_write) begin
					mem_cycle <= 5;
				end
			end else if(mem_cycle == 4) begin
				mwr_l <= ~mem_write;
			end else if(mem_cycle == 5) begin
				mrd_l <= 1;
				if(!mem_write) begin
					if(instr_cycle == 1) begin
						S <= 2'b01;
						instr_latch <= data_in;
					end else if(lda) begin
						D <= data_in;
					end else begin
						B <= data_in;
					end
				end
				mem_cycle <= 0;
				#2;
				mwr_l <= 1;
			end
		end else begin
			if(instr_cycle == 0) begin
				if(will_interrupt) begin
					will_interrupt <= 0;
					if(IE) begin
						idle <= 0;
						S <= 2'b11;
						IE <= 0;
						T <= {X, P};
						P <= 1;
						X <= 2;
					end
				end else if(intr && IE) begin
					will_interrupt <= 1;
				end else if(!idle) begin
					S <= 2'b00;
					addr_buff <= regs[P];
					regs[P] <= regs[P] + 1;
					mem_cycle <= 1;
					mem_write <= 0;
					lda <= 0;
					instr_cycle <= 1;
				end
			end else begin
				if(op_high == 0) begin
					if(instr_latch[3:0] == 0) begin //IDL
						idle <= 1;
						instr_cycle <= 0;
					end else begin //LDN [reg]
						addr_buff <= sel_reg;
						mem_write <= 0;
						mem_cycle <= 1;
						lda <= 1;
						instr_cycle <= 0;
					end
				end else if(op_high == 1) begin //INC [reg]
					regs[ireg_addr] <= sel_reg + 1;
					instr_cycle <= 0;
				end else if(op_high == 2) begin //DEC [reg]
					regs[ireg_addr] <= sel_reg - 1;
					instr_cycle <= 0;
				end else if(op_high == 3) begin //Branch instrs
					if(instr_cycle == 1) begin
						if(should_branch) begin
							addr_buff <= regs[P];
							regs[P] <= regs[P] + 1;
							mem_write <= 0;
							mem_cycle <= 1;
							lda <= 0;
							instr_cycle <= 2;
						end else begin
							regs[P] <= regs[P] + 1;
							instr_cycle <= 0;
						end
					end else begin
						//New low-order address now in B
						regs[P][7:0] <= B;
						instr_cycle <= 0;
					end
				end else if(op_high == 4) begin //LDA [reg]
					addr_buff <= sel_reg;
					regs[ireg_addr] <= sel_reg + 1;
					mem_write <= 0;
					mem_cycle <= 1;
					lda <= 1;
					instr_cycle <= 0;
				end else if(op_high == 5) begin //STR [reg]
					B <= D;
					addr_buff <= sel_reg;
					mem_write <= 1;
					mem_cycle <= 1;
					instr_cycle <= 0;
				end else if(op_high == 6) begin //IO instrs
					if(instr_latch[3:0] == 0) begin //IRX
						regs[X] <= regs[X] + 1;
					end else if(instr_latch[3:0] == 8) begin
					
					end else begin
						if(instr_latch[3]) begin //INP
							D <= 0;
						end else begin //OUT
						
						end
					end
					instr_cycle <= 0;
				end else if(op_high == 7) begin //Various
					if(instr_cycle == 1 && (instr_latch[3:0] == 0 || instr_latch[3:0] == 1 || instr_latch[3:0] == 4 || instr_latch[3:0] == 5 || instr_latch[3:0] == 7 || instr_latch[3:0] == 12 || instr_latch[3:0] == 13 || instr_latch[3:0] == 15)) begin
						addr_buff <= instr_latch[3] ? regs[P] : regs[X];
						regs[P] <= instr_latch[3] ? regs[P] + 1 : regs[P];
						mem_write <= 0;
						mem_cycle <= 1;
						lda <= 0;
						instr_cycle <= 2;
					end else begin
						instr_cycle <= 0;
						case(instr_latch[3:0])
							0: begin
								//RET
								X <= B[7:4];
								P <= B[3:0];
								regs[X] <= regs[X] + 1;
								IE <= 1;
							end
							1: begin
								//DIS
								X <= B[7:4];
								P <= B[3:0];
								regs[X] <= regs[X] + 1;
								IE <= 0;
							end
							2: begin
								//LDXA
								addr_buff <= regs[X];
								regs[X] <= regs[X] + 1;
								mem_write <= 0;
								mem_cycle <= 1;
								lda <= 1;
							end
							3: begin
								//STXD
								addr_buff <= regs[X];
								regs[X] <= regs[X] - 1;
								mem_write <= 1;
								B <= D;
								mem_cycle <= 1;
							end
							4: begin
								//ADC
								{DF, D} <= D + DF + B;
							end
							5: begin
								//SDB
								{DF, D} <= B - D - (~DF);
							end
							6: begin
								//RSHR
								DF <= D[0];
								D <= {DF, D[7:1]};
							end
							7: begin
								//SMB
								{DF, D} <= D - B - (~DF);
							end
							8: begin
								//SAV
								addr_buff <= regs[X];
								B <= T;
								mem_write <= 1;
								mem_cycle <= 1;
							end
							9: begin
								//MARK
								T <= {X, P};
								addr_buff <= regs[2];
								B <= {X, P};
								mem_write <= 1;
								mem_cycle <= 1;
								X <= P;
								regs[2] <= regs[2] - 1;
							end
							10: begin
								//REQ
								Q_l <= 0;
							end
							11: begin
								//SEQ
								Q_l <= 1;
							end
							12: begin
								//ADCI
								{DF, D} <= D + DF + B;
							end
							13: begin
								//SDBI
								D <= B + ~D + DF;
								DF <= ~(B < D);
							end
							14: begin
								//RSHL
								DF <= D[7];
								D <= {D[6:0], DF};
							end
							15: begin
								//SMBI
								D <= D + ~B + DF;
								DF <= ~(D < B);
							end
						endcase
					end
				end else if(op_high == 8) begin //GLO [reg]
					D <= sel_reg[7:0];
					instr_cycle <= 0;
				end else if(op_high == 9) begin //GHI [reg]
					D <= sel_reg[15:8];
					instr_cycle <= 0;
				end else if(op_high == 10) begin //PLO [reg]
					regs[ireg_addr][7:0] <= D;
					instr_cycle <= 0;
				end else if(op_high == 11) begin //PHI [reg]
					regs[ireg_addr][15:8] <= D;
					instr_cycle <= 0;
				end else if(op_high == 12) begin //skips & long branch (& NOP)
					if(instr_latch[3:0] == 4) begin
						instr_cycle <= 0; //NOP
					end else begin
						if(is_skip) begin
							if(longbranch_condition) begin
								regs[P] <= regs[P] + 2;
							end
							instr_cycle <= 0;
						end else begin
							if(instr_cycle == 1) begin
								if(!longbranch_condition) begin
									regs[P] <= regs[P] + 2;
									instr_cycle <= 0;
								end else begin
									addr_buff <= regs[P];
									regs[P] <= regs[P] + 1;
									mem_write <= 0;
									mem_cycle <= 1;
									lda <= 0;
									instr_cycle <= 2;
								end
							end else if(instr_cycle == 2) begin
								addr_buff <= regs[P];
								mem_write <= 0;
								regs[P][15:8] <= B;
								mem_cycle <= 1;
								instr_cycle <= 3;
							end else begin
								regs[P][7:0] <= B;
								instr_cycle <= 0;
							end
						end
					end
				end else if(op_high == 13) begin //SEP [reg]
					P <= ireg_addr;
					instr_cycle <= 0;
				end else if(op_high == 14) begin //SEX [reg]
					X <= ireg_addr;
					instr_cycle <= 0;
				end else if(op_high == 15) begin //Various
					if(instr_latch[3:0] == 0 || instr_latch[3:0] == 8) begin
						addr_buff <= instr_latch[3] ? regs[P] : regs[X];
						regs[P] <= instr_latch[3] ? regs[P] + 1 : regs[P];
						mem_write <= 0;
						lda <= 1;
						mem_cycle <= 1;
						instr_cycle <= 0;
					end else begin
						if(instr_cycle == 1 && instr_latch[3:0] != 6 && instr_latch[3:0] != 14) begin
							instr_cycle <= 2;
							mem_write <= 0;
							lda <= 0;
							mem_cycle <= 1;
							if(instr_latch[3]) begin
								addr_buff <= regs[P];
								regs[P] <= regs[P] + 1;
							end else begin
								addr_buff <= regs[X];
							end
						end else begin
							instr_cycle <= 0;
							case(instr_latch[2:0])
								1: begin
									//OR,ORI
									D <= D | B;
								end
								2: begin
									//AND,ANI
									D <= D & B;
								end
								3: begin
									//XOR,XRI
									D <= D ^ B;
								end
								4: begin
									//ADD,ADI
									{DF, D} <= D + B;
								end
								5: begin
									//SD,SDI
									D <= B + ~D + 1;
									DF <= ~(B < D);
								end
								6: begin
									if(instr_latch[3]) begin
										//SHL
										DF <= D[7];
										D <= {D[6:0], 1'b0};
									end else begin
										//SHR
										DF <= D[0];
										D <= {1'b0, D[7:1]};
									end
								end
								7: begin
									//SM,SMI
									D <= D + ~B + 1;
									DF <= ~(D < B);
								end
							endcase
						end
					end
				end
			end
		end
	end
end

endmodule
