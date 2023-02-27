`default_nettype none

module wrapped_MC14500(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	input [4:0] io_in,
	output [8:0] io_out,
	output io_oeb
);

wire [3:0] I = io_in[3:0];
wire DIN = io_in[4];

wire DOUT;
assign io_out[0] = DOUT;

wire X1;
wire WRITE;
wire RR;
wire JMP;
wire RTN;
wire FLAG_O;
wire FLAG_F;
assign io_out[1] = X1;
assign io_out[2] = WRITE;
assign io_out[3] = RR;
assign io_out[4] = JMP;
assign io_out[5] = RTN;
assign io_out[6] = FLAG_O;
assign io_out[7] = FLAG_F;

mc14500 mc14500(
	.X2(clk),
	.RST(rst),
	.DATA_in(DIN),
	.I(I),
	
	.X1(X1),
	.DATA_out(DOUT),
	.WRITE(WRITE),
	.RR(RR),
	.JMP(JMP),
	.RTN(RTN),
	.FLAG_O(FLAG_O),
	.FLAG_F(FLAG_F),
	
	.oeb(io_oeb)
);

endmodule

`default_nettype wire
