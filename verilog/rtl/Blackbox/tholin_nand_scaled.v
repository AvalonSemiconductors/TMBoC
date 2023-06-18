`default_nettype none

module tholin_nand_scaled(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input A,
	input B,
	output Y
);

assign Y = ~(A & B);

endmodule
