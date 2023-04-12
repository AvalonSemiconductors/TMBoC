`default_nettype none

module wrapped_vgatest(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	input io_in,
	output [9:0] io_out
);

vgatest vgatest(
	.pixel(io_out[7:0]),
	.hsync(io_out[8]),
	.vsync(io_out[9]),
	.pattern_sel(io_in),
	.clk(clk),
	.rst(rst)
);

endmodule
