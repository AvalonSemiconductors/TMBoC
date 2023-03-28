`default_nettype none
`define REG_COUNT 16
`define REG_IDX 3
`define WORD_SIZE 512
`define BLOCK_COUNT 32
`define OP_SIZE 5
`define DISP_SIZE `OP_SIZE

module as512512512(
	input [15:0] data_in,
	output reg [15:0] data_out,
	
	output reg LEN1,
	output reg LEN2,
	
	output reg RW,
	output reg OPREQ,
	
	output TX,
	input RX,
	
	output SDO,
	input SDI,
	output SCLK,
	output reg CE,
	input EF,
	
	input clk,
	input rst,
	
	output reg M0
);

reg [31:0] PC;
reg [`WORD_SIZE-1:0] regs [`REG_COUNT-1:1];
reg zero_flag;
reg carry_flag;

reg [31:0] timer;

`ifdef SIM
wire [`WORD_SIZE-1:0] r0 = 0;
wire [`WORD_SIZE-1:0] r1 = regs[1];
wire [`WORD_SIZE-1:0] r2 = regs[2];
wire [`WORD_SIZE-1:0] r3 = regs[3];
wire [`WORD_SIZE-1:0] r4 = regs[4];
wire [`WORD_SIZE-1:0] r5 = regs[5];
wire [`WORD_SIZE-1:0] r6 = regs[6];
wire [`WORD_SIZE-1:0] r7 = regs[7];
wire [`WORD_SIZE-1:0] r8 = regs[8];
wire [`WORD_SIZE-1:0] r9 = regs[9];
wire [`WORD_SIZE-1:0] r10 = regs[10];
wire [`WORD_SIZE-1:0] r11 = regs[11];
wire [`WORD_SIZE-1:0] r12 = regs[12];
wire [`WORD_SIZE-1:0] r13 = regs[13];
wire [`WORD_SIZE-1:0] r14 = regs[14];
wire [`WORD_SIZE-1:0] r15 = regs[15];
`endif

reg [`WORD_SIZE-1:0] data_buff;
wire [`WORD_SIZE-1:0] data_buff_next = {data_buff[`WORD_SIZE-17:0], data_in};

reg [31:0] instr_latch;
reg [2:0] cycle;

reg [15:0] last_addr_hi;
reg [31:0] mem_addr;
reg [2:0] mem_cycle;
reg [5:0] transaction_size;
reg lda;
reg mem_write;

wire [31:0] next_mem_addr = mem_write ? mem_addr - 1 : mem_addr + 1;

wire [31:0] PC_p1 = PC + 1;

//Opcode format
//dddddRRRRdddddRR_RRSSSSSooooooooo
wire [8:0] opcode     = instr_latch[8:0];
wire [`OP_SIZE-1:0] op_size    = instr_latch[9+`OP_SIZE:9];
wire [`REG_IDX:0] ri1 = instr_latch[14+`REG_IDX:14];
wire [`DISP_SIZE-1:0] rdisp1     = instr_latch[18+`DISP_SIZE:18];
wire [`REG_IDX:0] ri2 = instr_latch[23+`REG_IDX:23];
wire [`DISP_SIZE-1:0] rdisp2     = instr_latch[27+`DISP_SIZE:27];
wire immediate = opcode[5];

//CPY instruction params
wire is_cpy = opcode[8:7] == 2'b01;
wire [`OP_SIZE-1:0] cpy_dst_size = opcode[`OP_SIZE-1:0];
wire cpy_signed = opcode[6] & is_cpy;

//LD/STR instruction params
wire is_loadstore = opcode[8:7] == 2'b10;
wire is_ld = is_loadstore && !opcode[6];
wire is_str = is_loadstore && opcode[6];
wire ld_displacement_size = opcode[4];
wire ld_use_displacement = opcode[3] && is_loadstore;

//Branch instruction params
wire is_branch = opcode[8:7] == 2'b11;
wire [2:0] branch_condition = opcode[2:0];
wire branch_pc_rel = opcode[6];

//Misc instruction
wire is_misc = opcode[8:4] == 5'b00000;
wire [3:0] misc_op = opcode[3:0];

//Arith instruction params
wire is_arith = opcode[6] && opcode[8:7] == 2'b00;
wire [3:0] arith_op = opcode[3:0];
wire arith_do_save = opcode[4];

reg imm_rdy;

//ALU ins
wire [`OP_SIZE-1:0] ALU_op_size = (is_loadstore && cycle == 1) || is_branch ? 1 : op_size;
wire ALU_use_immediate = ((immediate && !is_ld && !is_branch) || (is_ld && cycle == 2)) && !(is_str && cycle == 1);
wire [3:0] ALU_op = is_cpy || is_loadstore || is_branch ? 4'b0111 : arith_op;
wire [`DISP_SIZE-1:0] ALU_disp2 = ((is_ld || is_branch) && cycle == 2) ? 0 : rdisp2;
wire [`WORD_SIZE-1:0] alu_ri1 = ri1 == 0 ? 0 : regs[ri1];
wire [`WORD_SIZE-1:0] alu_ri2 = (is_branch && cycle == 2) ? {{480{1'b0}}, PC} : (ALU_use_immediate ? data_buff : (ri2 == 0 ? 0 : regs[ri2]));

//ALU outs
wire [`WORD_SIZE-1:0] alu_res;
wire [`WORD_SIZE-1:0] alu_ri1_shifted;
wire [`WORD_SIZE-1:0] alu_ri2_shifted;
wire ALU_ready;

//ALU flag outs
wire carry_new;
wire zero_new;

ALU512 ALU512(
	.in1(alu_ri1),
	.in2(alu_ri2),
	.carry_in(carry_flag),
	.res(alu_res),
	.op_size(ALU_op_size),
	.op_offset1(rdisp1),
	.op_offset2(ALU_disp2),
	.out_size(is_cpy ? cpy_dst_size : op_size),
	.sign_extend(cpy_signed),
	.operation(ALU_op),
	
	.carry(carry_new),
	.zero(zero_new),
	
	.in1_shifted(alu_ri1_shifted),
	.in2_shifted(alu_ri2_shifted),
	
	.clk(clk),
	.rst(rst),
	.start(ALU_op == 4'b1000 && cycle == 1 && is_arith),
	.ready(ALU_ready)
);

reg should_branch;
always @(*) begin
	case(branch_condition)
		default: should_branch <= 0;

		0: should_branch <= 1;
		1: should_branch <= carry_flag;
		2: should_branch <= ~carry_flag;
		3: should_branch <= zero_flag;
		4: should_branch <= ~zero_flag;
		5: should_branch <= EF;
		6: should_branch <= ~EF;
	endcase
end

//UART

reg [15:0] baud_div;
reg spi_start;
reg uart_tx_start;
wire [7:0] uart_receive_byte;
wire uart_busy;
wire uart_has_byte;

as512512512_uart uart(
	.divisor(baud_div),
	.din(regs[1][7:0]),
	.dout(uart_receive_byte),
	.TX(TX),
	.RX(RX),
	.start(is_misc && misc_op == 10 && cycle == 0),
	.busy(uart_busy),
	.has_byte(uart_has_byte),
	.clr_hb(is_misc && misc_op == 11 && cycle == 0),
	.clk(clk),
	.rst(rst)
);

//SPI

reg [7:0] spi_div;
wire [7:0] spi_receive_byte;
wire spi_busy;

as512512512_spi spi(
	.divisor(spi_div),
	.din(regs[1][7:0]),
	.dout(spi_receive_byte),
	.SCLK(SCLK),
	.DO(SDO),
	.DI(SDI),
	.cka(1'b0),
	.start(is_misc && misc_op == 12 && cycle == 0),
	.busy(spi_busy),
	.clk(clk),
	.rst(rst)
);

wire [2:0] mem_fetch_cycle_start = last_addr_hi == PC[31:16] ? 2 : 1;
wire [5:0] immediate_length = is_loadstore || is_branch ? (ld_displacement_size ? 1 : 0) : op_size;
wire [31:0] loadstore_address_base = alu_ri2_shifted + (ld_use_displacement ? data_buff[31:0] : 0);
wire [31:0] store_address_adjusted = loadstore_address_base + op_size;

reg [31:0] next_pc;

always @(posedge clk) begin
	spi_start <= 0;
	uart_tx_start <= 0;
	if(rst) begin
		RW <= 0;
		OPREQ <= 0;
		LEN1 <= 0;
		LEN2 <= 0;
		cycle <= 0;
		mem_cycle <= 0;
		last_addr_hi <= 16'hFFFF;
		mem_write <= 0;
		M0 <= 0;
		CE <= 1;
		zero_flag <= 0;
		carry_flag <= 0;
		timer <= 0;
		PC <= 0;
	end else begin
		M0 <= 0;
		timer <= timer + 1;
		
		/*
		* Memory cycles handled here!
		*/
		if(mem_cycle != 0) begin
			case(mem_cycle)
				1: begin
					data_out <= mem_addr[31:16];
					last_addr_hi <= mem_addr[31:16];
					LEN2 <= 1;
					RW <= 0;
					OPREQ <= 0;
					mem_cycle <= 2;
				end
				
				2: begin
					data_out <= mem_addr[15:0];
					LEN2 <= 0;
					LEN1 <= 1;
					RW <= 0;
					OPREQ <= 0;
					mem_cycle <= 3;
				end
				
				3: begin
					LEN1 <= 0;
					OPREQ <= 1;
					RW <= mem_write;
					if(mem_write) begin
						data_out <= data_buff[15:0];
						data_buff <= {16'h0000, data_buff[`WORD_SIZE-1:16]};
					end
					mem_cycle <= 4;
				end
				
				4: begin
					OPREQ <= 0;
					RW <= 0;
					if(transaction_size == 0) begin
						mem_cycle <= 0;
						imm_rdy <= (immediate || ld_use_displacement) && lda;
						if(!lda) begin
							instr_latch <= data_buff_next;
						end
					end else begin
						mem_cycle <= next_mem_addr[31:15] == last_addr_hi ? 2 : 1;
					end
					mem_addr <= next_mem_addr;
					
					if(((immediate || ld_use_displacement) && !imm_rdy) || !lda) PC <= PC_p1;
					
					transaction_size <= transaction_size - 1;
					if(!mem_write) begin
						data_buff <= data_buff_next;
					end
				end
			endcase
		end else begin
			RW <= 0;
			OPREQ <= 0;
			mem_write <= 0;
			
			/*
			* Instruction execute happening here!
			*/
			if(cycle == 0) begin
				M0 <= 1;
				mem_addr <= PC;
				mem_cycle <= mem_fetch_cycle_start;
				transaction_size <= 1;
				data_buff <= 0;
				cycle <= 1;
				lda <= 0;
				imm_rdy <= 0;
			end else begin
				lda <= 1;
				if((immediate || ld_use_displacement) && !imm_rdy) begin
					transaction_size <= immediate_length;
					mem_cycle <= mem_fetch_cycle_start;
					mem_addr <= PC;
					data_buff <= 0;
				end else begin
					if(is_cpy) begin
						//CPY instruction (register/register transfer)
						if(ri1 != 0) begin
							regs[ri1] <= alu_res;
						end
						cycle <= 0;
					end else if(is_arith) begin
						if(ALU_op != 4'b1000 || cycle == 4) begin
							//Any arithmatic or logical instruction
							if(ri1 != 0 && arith_do_save) begin
								regs[ri1] <= alu_res;
							end
							zero_flag <= zero_new;
							carry_flag <= carry_new;
							cycle <= 0;
						end else if(ALU_op == 4'b1000) begin
							if(cycle == 1) begin
								cycle <= 2;
							end else begin
								cycle <= ALU_ready ? 4 : 3;
							end
						end
					end else if(is_ld) begin
						//Memory load
						if(cycle == 1) begin
							transaction_size <= op_size;
							mem_addr <= loadstore_address_base;
							mem_cycle <= 1;
							data_buff <= 0;
							cycle <= 2;
						end else begin
							if(ri1 != 0) begin
								regs[ri1] <= alu_res;
							end
							cycle <= 0;
						end
					end else if(is_str) begin
						if(cycle == 1) begin
							//Memory store
							transaction_size <= op_size;
							mem_addr <= store_address_adjusted;
							cycle <= 2;
						end else begin
							mem_write <= 1;
							data_buff <= alu_ri1_shifted;
							mem_cycle <= 1;
							cycle <= 0;
						end
					end else if(is_branch) begin
						if(cycle == 1) begin
							next_pc <= alu_ri2_shifted[31:0] + (data_buff[31:0] & {32{immediate}}) + (PC & {32{branch_pc_rel}});
							cycle <= should_branch ? 2 : 0;
						end else begin
							if(ri1 != 0) begin
								regs[ri1] <= alu_res;
							end
							PC <= next_pc;
							cycle <= 0;
						end
					end else if(is_misc) begin
						cycle <= 0;
						case(misc_op)
							default: cycle <= 0;
							0: cycle <= 0;
							1: regs[1][31:0] <= timer;
							2: timer <= regs[1][31:0];
							3: regs[1][31:0] <= {25'b0, spi_busy, uart_busy, uart_has_byte, CE, EF, zero_flag, carry_flag};
							4: begin
								carry_flag <= regs[1][0];
								zero_flag <= regs[1][1];
							end
							5: CE <= 0;
							6: CE <= 1;
							7: baud_div <= regs[1][15:0];
							8: spi_div <= regs[1][7:0];
							9: spi_start <= 1;
							10: cycle <= 0;
							11: regs[1][15:0] <= {8'h00, uart_receive_byte};
							12: cycle <= 0;
							13: regs[1][15:0] <= {8'h00, spi_receive_byte};
						endcase
					end
				end
			end
		end
	end
end

endmodule
