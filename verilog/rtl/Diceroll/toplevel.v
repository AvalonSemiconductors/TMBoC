`default_nettype none

module tt2_tholin_diceroll(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	input io_in,
	output [7:0] io_out
);
	
	dice dice (
		.CLK(clk),
		.RST(rst),
		.ROLL(io_in),
		.LEDS(io_out)
	);

endmodule
