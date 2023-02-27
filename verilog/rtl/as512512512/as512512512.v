`default_nettype none
`REG_COUNT 16
`REG_PC 15

module as512512512(
	input [15:0] data_in,
	output reg [15:0] data_out,
	
	output reg LEN1,
	output reg LEN2,
	
	output reg RW,
	output reg OPREQ,
	
	output TX,
	input RX,
	
	output SDO,
	input SDI,
	output SCLK,
	output CE,
	input EF,
	
	input clk,
	input rst
);

reg [511:0] regs [`REG_COUNT-1:0];

reg [511:0] data_buff;

reg [31:0] instr_reg;
reg [2:0] cycle;

reg [15:0] last_addr_hi;
reg [31:0] mem_addr;
reg [2:0] mem_cycle;
reg [6:0] transaction_size;
reg [5:0] transaction_ptr;
reg lda;
reg mem_write;

wire [15:0] data_buff_sel = data_buff >> (transaction_ptr * 16);

wire [31:0] PC_val = regs[`REG_PC][31:0];

always @(posedge clk) begin
	if(mem_cycle != 0) begin
		if(mem_cycle == 1) begin
			data_out <= mem_addr[31:16];
			last_addr_hi <= mem_addr[31:16];
			LEN2 <= 1;
			RW <= 0;
			mem_cycle <= 2;
		end else if(mem_cycle == 2) begin
			data_out <= mem_addr[15:0];
			LEN2 <= 0;
			LEN1 <= 1;
			RW <= 0;
			mem_cycle <= 3;
		end else if(mem_cycle == 3) begin
			LEN2 <= 0;
			mem_cycle <= 4;
		end else if(mem_cycle == 4) begin
			if(transaction_size == 0) begin
				mem_cycle <= 0;
				if(!lda) begin
					instr_latch <= data_buff[31:0];
				end
			end else begin
				mem_cycle <= mem_addr[31:15] == last_addr_hi ? 2 : 1;
			end
			transaction_ptr <= transaction_ptr + 1;
			transaction_size <= transaction_size - 1;
			if(mem_write) begin
				data_out <= data_buff_sel;
				RW <= 1;
			end else begin
				data_buff <= data_buff | (data_in << (transaction_ptr * 16));
			end
			mem_addr <= mem_addr + 1;
		end
	end
end

always @(posedge clk) begin
	if(rst) begin
		RW <= 0;
		OPREQ <= 0;
		LEN1 <= 0;
		LEN2 <= 0;
		cycle <= 0;
		mem_cycle <= 0;
		din_buff <= 0;
		last_addr_hi <= 16'hFFFF;
		mem_write <= 0;
	end else begin
		if(mem_cycle == 0) begin
			mem_write <= 0;
			if(cycle == 0) begin
				mem_addr <= PC_val;
				mem_cycle <= last_addr_hi == PC_val[31:16] ? 2 : 1;
				transaction_size <= 2;
				transaction_ptr <= 0;
				data_buff <= 0;
				cycle <= 1;
				lda <= 0;
			end else if(cycle == 1) begin
				lda <= 1;
				
			end
		end
	end
end

endmodule
