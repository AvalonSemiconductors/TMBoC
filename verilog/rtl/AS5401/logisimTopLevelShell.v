`default_nettype none
module tholin_avalonsemi_5401(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	input [9:0] io_in,
	output [26:0] io_out,
	output io_oeb
);
	wire [3:0] din = io_in[3:0];
	wire [3:0] insin = io_in[7:4];
	wire EF0 = io_in[8];
	wire EF1 = io_in[9];

	reg WRITE_flag;
	reg I_flag;
	reg MAR_flag;
	reg JMP_flag;
	
	reg [7:0] out_buff;
	reg [3:0] clock_state;
	
	wire [3:0] cpu_din = clock_state == 4'b0010 ? insin : (I_flag ? insin : din);
	
	wire s_D0 = cpu_din[0];
	wire s_D1 = cpu_din[1];
	wire s_D2 = cpu_din[2];
	wire s_D3 = cpu_din[3];
	
	wire s_O_D0_RR0;
	wire s_O_D1_RR1;
	wire s_O_D2_RR2;
	wire s_O_D3_RR3;
	wire s_O_4_MAR;
	wire s_O_5_WRITE;
	wire s_O_6_JMP;
	wire s_O_7_I;
	
	assign io_out[3:0] = {s_O_D3_RR3, s_O_D2_RR2, s_O_D1_RR1, s_O_D0_RR0};
	assign io_out[9:4] = 0;
	assign io_out[17:10] = out_buff;
	assign io_out[21:18] = clock_state;
	assign io_out[22] = WRITE_flag;
	assign io_out[23] = I_flag;
	assign io_out[24] = MAR_flag;
	assign io_out[25] = JMP_flag;
	assign io_out[26] = 1;
	
	wire oeb = ~(WRITE_flag || JMP_flag);
	assign io_oeb = oeb;
	
	always @(posedge clk) begin
		if(rst) begin
			clock_state <= 1;
			I_flag <= 0;
			MAR_flag <= 0;
			JMP_flag <= 0;
		end else begin
				clock_state <= {clock_state[2:0], clock_state[3]};
				if(clock_state == 4'b0001) begin
					WRITE_flag <= 0;
					MAR_flag <= 0;
					JMP_flag <= 0;
				end
		end
	end
	
	always @(negedge clk) begin
		if(clock_state == 4'b0100) begin
			out_buff <= {s_O_7_I, s_O_6_JMP, s_O_5_WRITE, s_O_4_MAR, s_O_D3_RR3, s_O_D2_RR2, s_O_D1_RR1, s_O_D0_RR0};
		end
		if(clock_state == 4'b0001) begin
			WRITE_flag <= s_O_5_WRITE;
			I_flag <= s_O_7_I;
			MAR_flag <= s_O_4_MAR;
			JMP_flag <= s_O_6_JMP;
		end
	end
	
	CPU   CIRCUIT_1957 (.CLK(clk),
						.D0(s_D0),
						.D1(s_D1),
						.D2(s_D2),
						.D3(s_D3),
						.EF0(EF0),
						.EF1(EF1),
						.O_4_MAR(s_O_4_MAR),
						.O_5_WRITE(s_O_5_WRITE),
						.O_6_JMP(s_O_6_JMP),
						.O_7_I(s_O_7_I),
						.O_D0_RR0(s_O_D0_RR0),
						.O_D1_RR1(s_O_D1_RR1),
						.O_D2_RR2(s_O_D2_RR2),
						.O_D3_RR3(s_O_D3_RR3),
						.RST(rst));
endmodule
