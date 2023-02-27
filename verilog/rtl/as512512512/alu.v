`define OP_ADD 3'b000
`define OP_SUB 3'b001
`define OP_ADC 3'b010
`define OP_SBC 3'b011
`define OP_AND 3'b100
`define OP_OR  3'b101
`define OP_XOR 3'b110
//May make invert part of LD

module ALU512(
	input [511:0] in1,
	input [511:0] in2,
	input carry_in,

	output [511:0] res,
	
	input [4:0] op_size,
	input [4:0] op_offset1,
	input [4:0] op_offset2,
	
	input [2:0] operation,
	
	output carry,
	output zero
);

reg [31:0] op_mask_words_base;
always @(*) begin
	case(op_size)
		0:  op_mask_words_base = 32'b00000000_00000000_00000000_00000001;
		1:  op_mask_words_base = 32'b00000000_00000000_00000000_00000011;
		2:  op_mask_words_base = 32'b00000000_00000000_00000000_00000111;
		3:  op_mask_words_base = 32'b00000000_00000000_00000000_00001111;
		4:  op_mask_words_base = 32'b00000000_00000000_00000000_00011111;
		5:  op_mask_words_base = 32'b00000000_00000000_00000000_00111111;
		6:  op_mask_words_base = 32'b00000000_00000000_00000000_01111111;
		7:  op_mask_words_base = 32'b00000000_00000000_00000000_11111111;
		8:  op_mask_words_base = 32'b00000000_00000000_00000001_11111111;
		9:  op_mask_words_base = 32'b00000000_00000000_00000011_11111111;
		10: op_mask_words_base = 32'b00000000_00000000_00000111_11111111;
		11: op_mask_words_base = 32'b00000000_00000000_00001111_11111111;
		12: op_mask_words_base = 32'b00000000_00000000_00011111_11111111;
		13: op_mask_words_base = 32'b00000000_00000000_00111111_11111111;
		14: op_mask_words_base = 32'b00000000_00000000_01111111_11111111;
		15: op_mask_words_base = 32'b00000000_00000000_11111111_11111111;
		16: op_mask_words_base = 32'b00000000_00000001_11111111_11111111;
		17: op_mask_words_base = 32'b00000000_00000011_11111111_11111111;
		18: op_mask_words_base = 32'b00000000_00000111_11111111_11111111;
		19: op_mask_words_base = 32'b00000000_00001111_11111111_11111111;
		20: op_mask_words_base = 32'b00000000_00011111_11111111_11111111;
		21: op_mask_words_base = 32'b00000000_00111111_11111111_11111111;
		22: op_mask_words_base = 32'b00000000_01111111_11111111_11111111;
		23: op_mask_words_base = 32'b00000000_11111111_11111111_11111111;
		24: op_mask_words_base = 32'b00000001_11111111_11111111_11111111;
		25: op_mask_words_base = 32'b00000011_11111111_11111111_11111111;
		26: op_mask_words_base = 32'b00000111_11111111_11111111_11111111;
		27: op_mask_words_base = 32'b00001111_11111111_11111111_11111111;
		28: op_mask_words_base = 32'b00011111_11111111_11111111_11111111;
		29: op_mask_words_base = 32'b00111111_11111111_11111111_11111111;
		30: op_mask_words_base = 32'b01111111_11111111_11111111_11111111;
		31: op_mask_words_base = 32'b11111111_11111111_11111111_11111111;
	endcase
end
wire [31:0] op_mask_words1 = op_mask_words_base << op_offset1;
wire [31:0] op_mask_words2 = op_mask_words_base << op_offset2;

wire [511:0] op_mask_bits1 = {
	{16{op_mask_words1[31]}},
	{16{op_mask_words1[30]}},
	{16{op_mask_words1[29]}},
	{16{op_mask_words1[28]}},
	{16{op_mask_words1[27]}},
	{16{op_mask_words1[26]}},
	{16{op_mask_words1[25]}},
	{16{op_mask_words1[24]}},
	{16{op_mask_words1[23]}},
	{16{op_mask_words1[22]}},
	{16{op_mask_words1[21]}},
	{16{op_mask_words1[20]}},
	{16{op_mask_words1[19]}},
	{16{op_mask_words1[18]}},
	{16{op_mask_words1[17]}},
	{16{op_mask_words1[16]}},
	{16{op_mask_words1[15]}},
	{16{op_mask_words1[14]}},
	{16{op_mask_words1[13]}},
	{16{op_mask_words1[12]}},
	{16{op_mask_words1[11]}},
	{16{op_mask_words1[10]}},
	{16{op_mask_words1[ 9]}},
	{16{op_mask_words1[ 8]}},
	{16{op_mask_words1[ 7]}},
	{16{op_mask_words1[ 6]}},
	{16{op_mask_words1[ 5]}},
	{16{op_mask_words1[ 4]}},
	{16{op_mask_words1[ 3]}},
	{16{op_mask_words1[ 2]}},
	{16{op_mask_words1[ 1]}},
	{16{op_mask_words1[ 0]}},
};

wire [511:0] op_mask_bits2 = {
	{16{op_mask_words2[31]}},
	{16{op_mask_words2[30]}},
	{16{op_mask_words2[29]}},
	{16{op_mask_words2[28]}},
	{16{op_mask_words2[27]}},
	{16{op_mask_words2[26]}},
	{16{op_mask_words2[25]}},
	{16{op_mask_words2[24]}},
	{16{op_mask_words2[23]}},
	{16{op_mask_words2[22]}},
	{16{op_mask_words2[21]}},
	{16{op_mask_words2[20]}},
	{16{op_mask_words2[19]}},
	{16{op_mask_words2[18]}},
	{16{op_mask_words2[17]}},
	{16{op_mask_words2[16]}},
	{16{op_mask_words2[15]}},
	{16{op_mask_words2[14]}},
	{16{op_mask_words2[13]}},
	{16{op_mask_words2[12]}},
	{16{op_mask_words2[11]}},
	{16{op_mask_words2[10]}},
	{16{op_mask_words2[ 9]}},
	{16{op_mask_words2[ 8]}},
	{16{op_mask_words2[ 7]}},
	{16{op_mask_words2[ 6]}},
	{16{op_mask_words2[ 5]}},
	{16{op_mask_words2[ 4]}},
	{16{op_mask_words2[ 3]}},
	{16{op_mask_words2[ 2]}},
	{16{op_mask_words2[ 1]}},
	{16{op_mask_words2[ 0]}},
};

wire [511:0] op_mask_bits_out = {
	{16{op_mask_words_base[31]}},
	{16{op_mask_words_base[30]}},
	{16{op_mask_words_base[29]}},
	{16{op_mask_words_base[28]}},
	{16{op_mask_words_base[27]}},
	{16{op_mask_words_base[26]}},
	{16{op_mask_words_base[25]}},
	{16{op_mask_words_base[24]}},
	{16{op_mask_words_base[23]}},
	{16{op_mask_words_base[22]}},
	{16{op_mask_words_base[21]}},
	{16{op_mask_words_base[20]}},
	{16{op_mask_words_base[19]}},
	{16{op_mask_words_base[18]}},
	{16{op_mask_words_base[17]}},
	{16{op_mask_words_base[16]}},
	{16{op_mask_words_base[15]}},
	{16{op_mask_words_base[14]}},
	{16{op_mask_words_base[13]}},
	{16{op_mask_words_base[12]}},
	{16{op_mask_words_base[11]}},
	{16{op_mask_words_base[10]}},
	{16{op_mask_words_base[ 9]}},
	{16{op_mask_words_base[ 8]}},
	{16{op_mask_words_base[ 7]}},
	{16{op_mask_words_base[ 6]}},
	{16{op_mask_words_base[ 5]}},
	{16{op_mask_words_base[ 4]}},
	{16{op_mask_words_base[ 3]}},
	{16{op_mask_words_base[ 2]}},
	{16{op_mask_words_base[ 1]}},
	{16{op_mask_words_base[ 0]}},
};

wire [511:0] arg1 = (in1 & op_mask_bits) >> (op_offset1 << 4);
wire [511:0] arg2 = (in2 & op_mask_bits) >> (op_offset2 << 4);
wire [511:0] inv_arg2 = ((~in2) & op_mask_bits) >> (op_offset2 << 4);

wire [511:0] orig1 = in1 & (~op_mask_bits);

wire [512:0] add_res = arg1 + (operation == `OP_SUB ? inv_arg2 : arg2) + (operation == `OP_SUB) + ((operation == `OP_SBC || operation == `OP_ADC) & carry_in);
wire [511:0] and_res = arg1 & arg2;
wire [511:0] or_res = arg1 | arg2;
wire [511:0] xor_res = arg1 ^ arg2;

reg [511:0] ALU_res;
always @(*) begin
	case(operation)
		`OP_ADD: ALU_res = add_res;
		`OP_ADC: ALU_res = add_res;
		`OP_SUB: ALU_res = add_res;
		`OP_SBC: ALU_res = add_res;
		`OP_AND: ALU_res = and_res;
		`OP_OR:  ALU_res = or_res;
		`OP_XOR: ALU_res = xor_res;
	endcase
end
wire [511:0] ALU_res_masked = ALU_res & op_mask_bits_out;

assign carry = add_res[(op_size + 1) << 4];
assign zero = ALU_res_masked == 0;
assign res = orig1 | (ALU_res_masked << (op_offset1 << 4));

endmodule
