`default_nettype none

module wrapped_as512512512(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,

	input [26:0] io_in,
	output [27:0] io_out,
	output io_oeb
);

wire RW;
wire LEN1,LEN2;

assign io_out[16] = LEN1;
assign io_out[17] = LEN2;
assign io_out[18] = RW;
assign io_oeb = ~(RW | LEN1 | LEN2);

as512512512 as512512512(
	.clk(clk),
	.rst(rst),
	.data_in(io_in[15:0]),
	.data_out(io_out[15:0]),
	.LEN1(LEN1),
	.LEN2(LEN2),
	.RW(RW),
	.OPREQ(io_out[19]),
	.TX(io_out[20]),
	.RX(io_in[21]),
	.SDO(io_out[22]),
	.SDI(io_in[23]),
	.SCLK(io_out[24]),
	.CE(io_out[25]),
	.EF(io_in[26]),
	.M0(io_out[27])
);

endmodule
