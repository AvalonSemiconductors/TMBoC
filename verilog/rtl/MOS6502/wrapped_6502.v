`default_nettype none

module wrapped_6502(
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

wire WE;

assign io_out[26] = WE;
assign io_oeb = ~WE;
assign io_out[9:8] = 2'b00;

MOS6502 MOS6502(
	.clk(clk),
	.reset(rst),
	.DI(io_in[7:0]),
	.DO(io_out[7:0]),
	.IRQ(io_in[8]),
	.NMI(io_in[9]),
	.RDY(1'b1),
	.AB(io_out[25:10]),
	.WE(WE)
);

endmodule
