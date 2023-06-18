`define OP_ADD 4'b0000
`define OP_SUB 4'b0001
`define OP_ADC 4'b0010
`define OP_SBC 4'b0011
`define OP_AND 4'b0100
`define OP_OR  4'b0101
`define OP_XOR 4'b0110
`define OP_LD  4'b0111
`define OP_MUL 4'b1000
`define OP_RSH 4'b1001
`define OP_LSH 4'b1010
`define OP_ASR 4'b1011
`define OP_LSC 4'b1100
`define OP_RSC 4'b1101
`define OP_EXT 4'b1110

`define WORD_SIZE 512
`define BLOCK_COUNT 32
`define OP_SIZE 5

`define HAS_MUL

module ALU512(
	input [`WORD_SIZE-1:0] in1,
	input [`WORD_SIZE-1:0] in2,
	input carry_in,

	output [`WORD_SIZE-1:0] res,
	
	input [`OP_SIZE-1:0] op_size,
	input [`OP_SIZE-1:0] op_offset1,
	input [`OP_SIZE-1:0] op_offset2,

	input [`OP_SIZE-1:0] out_size,
	input sign_extend,
	
	input [3:0] operation,
	
	output carry,
	output zero,
	
	output [`WORD_SIZE-1:0] in1_shifted,
	output [`WORD_SIZE-1:0] in2_shifted,
	
	input clk,
	input rst,
	input start,
	output reg ready
);

wire [`BLOCK_COUNT-1:0] op_mask_words_base;
alu_mask_rom_32 alu_mask_rom_32_1(op_size, op_mask_words_base);
wire [`BLOCK_COUNT-1:0] op_mask_words1 = op_mask_words_base << op_offset1;
wire [`BLOCK_COUNT-1:0] op_mask_words2 = op_mask_words_base << op_offset2;

wire [`BLOCK_COUNT-1:0] op_mask_output_base;
alu_mask_rom_32 alu_mask_rom_32_2(op_size, op_mask_output_base);
wire [`BLOCK_COUNT-1:0] op_mask_output = op_mask_output_base << op_offset1;

wire [`OP_SIZE+4:0] op_size_bits = (op_size + 1) << 4;
wire [`OP_SIZE+4:0] op_size_bitsn1 = op_size_bits - 1;

wire [`WORD_SIZE-1:0] op_mask_bits1;
genvar i;
generate
	for(i = 0; i < `BLOCK_COUNT; i = i + 1) begin
		assign op_mask_bits1[(i+1)*16-1:i*16] = {16{op_mask_words1[i]}};
	end
endgenerate

wire [`WORD_SIZE-1:0] op_mask_bits2;
generate
	for(i = 0; i < `BLOCK_COUNT; i = i + 1) begin
		assign op_mask_bits2[(i+1)*16-1:i*16] = {16{op_mask_words2[i]}};
	end
endgenerate

wire [`WORD_SIZE-1:0] op_mask_bits_out;
generate
	for(i = 0; i < `BLOCK_COUNT; i = i + 1) begin
		assign op_mask_bits_out[(i+1)*16-1:i*16] = {16{op_mask_output[i]}};
	end
endgenerate

wire [`OP_SIZE+3:0] shift_by1 = op_offset1 << 4;
wire [`OP_SIZE+3:0] shift_by2 = op_offset2 << 4;

wire [`WORD_SIZE-1:0] arg1 = (in1 & op_mask_bits1) >> shift_by1;
wire [`WORD_SIZE-1:0] arg2 = (in2 & op_mask_bits2) >> shift_by2;
wire in_sign = arg2[op_size_bitsn1];
wire [`WORD_SIZE-1:0] inv_arg2 = ((~in2) & op_mask_bits2) >> shift_by2;

assign in1_shifted = arg1;
assign in2_shifted = arg2;

wire [`WORD_SIZE-1:0] orig1 = in1 & (~op_mask_bits_out);

wire add_carry = (operation == `OP_SUB) + ((operation == `OP_SBC | operation == `OP_ADC) & carry_in);
wire [`WORD_SIZE:0] add_res = arg1 + ((operation == `OP_SUB || operation == `OP_SBC) ? inv_arg2 : arg2) + add_carry;
wire [`WORD_SIZE-1:0] and_res = arg1 & arg2;
wire [`WORD_SIZE-1:0] or_res = arg1 | arg2;
wire [`WORD_SIZE-1:0] xor_res = arg1 ^ arg2;
wire [`WORD_SIZE-1:0] rsh_res = arg2 >> 1;
wire [`WORD_SIZE-1:0] lsh_res = arg2 << 1;

`ifdef HAS_MUL
reg [`WORD_SIZE-1:0] mul_res;
`endif

reg [`WORD_SIZE-1:0] ALU_res;
always @(*) begin
	case(operation)
		`OP_ADD: ALU_res = add_res;
		`OP_ADC: ALU_res = add_res;
		`OP_SUB: ALU_res = add_res;
		`OP_SBC: ALU_res = add_res;
		`OP_AND: ALU_res = and_res;
		`OP_OR:  ALU_res = or_res;
		`OP_XOR: ALU_res = xor_res;
		`OP_LD:  ALU_res = arg2;
`ifdef HAS_MUL
		`OP_MUL: ALU_res = mul_res;
`endif
		`OP_RSH: ALU_res = rsh_res;
		`OP_LSH: ALU_res = lsh_res;
		`OP_ASR: ALU_res = rsh_res | (arg2 & (1 << op_size_bitsn1));
		`OP_LSC: ALU_res = lsh_res | carry_in;
		`OP_RSC: ALU_res = rsh_res | (carry_in << op_size_bitsn1);
		`OP_EXT: ALU_res = {`WORD_SIZE{in_sign}};
	endcase
end


`ifdef HAS_MUL
reg [`WORD_SIZE-1:0] muli_1;
reg [`WORD_SIZE-1:0] muli_2;

always @(posedge clk) begin
	if(rst) begin
		ready <= 1;
	end else begin
		if(start && operation == `OP_MUL) begin
			ready <= 0;
			muli_1 <= arg1;
			muli_2 <= arg2;
			mul_res <= 0;
		end else begin
			if(!ready) begin
				muli_1 <= {1'b0, muli_1[`WORD_SIZE-1:1]};
				if(muli_1[0]) begin
					mul_res = mul_res + muli_2;
				end
				muli_2 <= {muli_2[`WORD_SIZE-2:0], 1'b0};
				ready = muli_1 == 0 || muli_2 == 0;
			end
		end
	end
end
`endif

wire [`WORD_SIZE-1:0] ALU_res_shifted = ALU_res << shift_by1;
wire [`WORD_SIZE-1:0] ALU_res_masked = ALU_res_shifted & op_mask_bits_out;

//TODO: Sign extend

assign carry = operation == `OP_ADD || operation == `OP_ADC || operation == `OP_SUB || operation == `OP_SBC ? add_res[op_size_bits] : ((operation == `OP_RSH || operation == `OP_RSC) ? arg2[0] : ((operation == `OP_LSH || operation == `OP_LSC) ? arg2[op_size_bitsn1] : carry_in));
assign zero = ALU_res_masked == 0;
assign res = orig1 | ALU_res_masked;

endmodule
