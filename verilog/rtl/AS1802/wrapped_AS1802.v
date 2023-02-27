`default_nettype none

module wrapped_as1802(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input wire clk,
	input wire rst,

	input wire [12:0] io_in,
	output wire [26:0] io_out,
	output wire io_oeb
);

wire MWR;

assign io_out[23] = MWR;
assign io_oeb = MWR;

as1802 as1802(
	.rst(rst),
	.clk(clk),
	.data_in(io_in[7:0]),
	.data_out(io_out[7:0]),
	.intr(io_in[8]),
	.EF(io_in[12:9]),
	.address(io_out[20:13]),
	.Q(io_out[21]),
	.MRD(io_out[22]),
	.MWR(MWR),
	.TPA(io_out[24]),
	.SC0(io_out[25]),
	.SC1(io_out[26])
);
endmodule
