module posit_unit(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input clk,
	input rst,
	
	input [2:0] io_in,
	output [3:0] io_out
);

wire CE = io_in[0];
wire SCLK = io_in[1];
wire DIN = io_in[2];
reg last_SCLK;

reg DOUT;
assign io_out[3] = DOUT;
assign io_out[2:0] = 3'b000;

reg [4:0] counter;

reg mode;
reg [15:0] in_reg;
reg [15:0] out_reg;
reg [7:0] cmd;

reg [15:0] posit1;
reg [15:0] posit2;
reg [15:0] posit_res;
wire [1:0] op = cmd[7:6];

always @(posedge clk) begin
	if(rst) begin
		counter <= 0;
		mode <= 0;
		out_reg <= 0;
		last_SCLK <= 0;
	end else begin
		if(CE) begin
			last_SCLK <= SCLK;
			if(SCLK && !last_SCLK) begin
				in_reg <= {in_reg[14:0], DIN};
				DOUT <= out_reg[15];
				out_reg <= {out_reg[14:0], 1'b0};
				counter <= counter + 1;
			end
			if(counter == 8 && mode == 0) begin
				if(in_reg[7:0] != 0) begin
					cmd <= in_reg[7:0];
				end
				counter <= 0;
				mode <= in_reg[1];
			end
			if(counter == 16 && mode == 1 && cmd[0] == 0) begin
				posit1 <= in_reg;
				counter <= 0;
				mode <= 0;
			end
			if(counter == 16 && mode == 1 && cmd[0] == 1) begin
				posit2 <= in_reg;
				counter <= 0;
				mode <= 0;
			end
		end else begin
			counter <= 0;
			mode <= 0;
			out_reg <= posit_res;
		end
	end
end

wire [15:0] posit_add_res;
posit_add posit_add(
	.in1(posit1),
	.in2(posit2),
	.start(1'b1),
	.out(posit_add_res)
);

wire [15:0] posit_mul_res;
posit_mult posit_mult(
	.in1(posit1),
	.in2(posit2),
	.start(1'b1),
	.out(posit_mul_res)
);

wire [15:0] posit_div_res;
posit_div posit_div(
	.in1(posit1),
	.in2(posit2),
	.start(1'b1),
	.out(posit_div_res)
);

always @(*) begin
	case(op)
		0: posit_res = posit_add_res;
		1: posit_res = posit_mul_res;
		2: posit_res = posit_div_res;
		3: posit_res = 0;
	endcase
end

endmodule
