`default_nettype none
module tt2_tholin_multiplexed_counter(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	output [11:0] io_out
);
	wire s_A;
	wire s_B;
	wire s_C;
	wire s_D;
	wire s_E;
	wire s_F;
	wire s_G;
	wire s_SEL;

	assign io_out[0] = s_A;
	assign io_out[1] = s_B;
	assign io_out[2] = s_C;
	assign io_out[3] = s_D;
	assign io_out[4] = s_E;
	assign io_out[5] = s_F;
	assign io_out[6] = s_G;
	assign io_out[7] = s_SEL;
	
	reg prev_sel;
	reg [3:0] sel;
	assign io_out[11:8] = sel;
	
	always @(negedge clk) begin
		prev_sel <= s_SEL;
		if(rst) begin
			sel <= 4'b0001;
		end else if(s_SEL && !prev_sel) begin
			sel <= {sel[2:0], sel[3]};
		end
	end

	main_counter   CIRCUIT_1111 (.A(s_A),
							.B(s_B),
							.C(s_C),
							.CLK(clk),
							.D(s_D),
							.E(s_E),
							.F(s_F),
							.G(s_G),
							.RST(rst),
							.SEL(s_SEL));
endmodule
