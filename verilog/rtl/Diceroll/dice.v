module dice(input CLK, input RST, input ROLL, output [7:0] LEDS);
	reg[2:0] bcd;
	reg[6:0] segments;
	always @(*) begin
		case(bcd)
			0: segments = 7'b0111111;
			1: segments = 7'b0000110;
			2: segments = 7'b1011011;
			3: segments = 7'b1001111;
			4: segments = 7'b1100110;
			5: segments = 7'b1101101;
			6: segments = 7'b1111100;
			7: segments = 7'b0000111;
		endcase
	end
	assign LEDS[6:0] = segments[6:0];
	reg rolling;
	reg [15:0] lfsr;
	reg [15:0] counter;
	reg [7:0] clkdiv;
	reg [15:0] r_counter;
	reg dp;
	assign LEDS[7] = dp;
	wire [15:0] random = lfsr + r_counter;
	
	always @(posedge CLK) begin
		if(RST) begin
			rolling <= 0;
			lfsr[15:8] <= 0;
			lfsr[7:0] <= 8'b11011010;
			counter <= 0;
			clkdiv <= 8'b10100000;
			bcd <= 1;
			dp <= 1;
			r_counter <= 0;
		end else begin
			lfsr <= {lfsr[0], lfsr[15], lfsr[14] ^ lfsr[0], lfsr[13] ^ lfsr[0], lfsr[12] ,lfsr[11] ^ lfsr[0], lfsr[10:1]};
			r_counter <= r_counter + 1;
			
			if(ROLL) begin
				clkdiv = 2;
				counter = 0;
				dp = 0;
			end
			if(clkdiv != 8'b10100000) begin
				counter <= counter + 1;
				if(counter == clkdiv) begin
					counter <= 0;
					clkdiv <= clkdiv + 1;
					if(random[2:0] > 5) begin
						bcd[2:0] <= random[2:0] - 4;
					end else begin
						bcd[2:0] <= random[2:0] + 1;
					end
				end
			end else begin
				dp = 1;
			end
		end
	end
endmodule
