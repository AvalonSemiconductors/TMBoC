// SPDX-FileCopyrightText: 2023 Tholin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`timescale 1 ns / 1 ps

module lcd_tb;
	reg s_clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	wire checkbit;
	
	always #12.5 s_clock <= (s_clock === 1'b0);
	
	wire s0,s1;
	wire ca,cb;
	reg clk_rst;
	assign #1 s0 = ~clk_rst & ((~s1 & s_clock) | (s0 & ~s_clock) | (s0 & ~s1));
	assign #1 s1 = ~clk_rst & ((s1 & s_clock) | (s0 & ~s_clock) | (s0 & s1));
	assign #1 ca = ~s1 & s0;
	assign #1 cb = s1 & ~s0;
	wire clock = ca;
	
	assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;

	assign mprj_io[8:5] = 4'b0011;
	
	reg design_rst;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = clock;
	
	//Design I/Os
	wire RS = mprj_io[11];
	wire E = mprj_io[12];
	wire [3:0] D = mprj_io[16:13];
	wire LED0 = mprj_io[17];
	wire LED1 = mprj_io[18];
	reg [2:0] EF;
	assign mprj_io[21:19] = EF;
	
	initial begin
		s_clock = 0;
		design_rst = 1;
		EF = 0;
		clk_rst = 1;
		#100;
		clk_rst = 0;
	end
	
	integer timeout;
	initial begin
		timeout = 1200;

		while(timeout > 2)  begin
			repeat (50) @(posedge clock);
			$fflush();
			timeout -= 1;
		end
		if(timeout == 2) begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display ("Monitor: Timeout, Test (GL) Failed");
			`else
				$display ("Monitor: Timeout, Test (RTL) Failed");
			`endif
			$display("%c[0m",27);
			$finish;
		end
		timeout = 2048;
	end
	
	integer failures;
	task test_lcd_data (input integer t_RS, input integer t_dout);
		begin
			@(posedge cb);
			failures += RS != t_RS;
			failures += E != 0;
			failures += D != t_dout;
			@(posedge cb);
		end
	endtask
	
	reg [32*8-1:0] test_string;
	integer curr_c;
	task test_lcd_string (input integer len);
		begin
			$display("%s", test_string);
			repeat(len) begin
				curr_c = test_string >> ((len-1)*8);
				curr_c = curr_c[7:0];
				
				test_lcd_data(1, curr_c[7:4]);
				test_lcd_data(1, curr_c[3:0]);
				
				test_string = test_string << 8;
			end
		end
	endtask
	
	initial begin
		wait(gpio == 0);
		wait(gpio == 1);
		wait(gpio == 0);
		wait(gpio == 1);
		$display("Initialized, testing LCD Namebadge");
		$fflush();
		$dumpfile("lcd.vcd");
		$dumpvars(1, lcd_tb);
		$dumpvars(0, lcd_tb.uut.chip_core.mprj.tt2_tholin_namebadge);
		failures = 0;
		@(posedge cb);
		design_rst = 0;
		@(posedge cb);
		test_lcd_data(0, 4'b0011);
		test_lcd_data(0, 4'b0010);
		test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b1111);
		test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b0001);
		failures += LED0 != 0;
		
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		test_string = "Hi, I'm Tholin :3";
		test_lcd_string(17);
		failures += LED0 != 0;
		
		repeat(11) begin
			test_lcd_data(0, 4'b1101);
			test_lcd_data(0, 4'b0100);
		end
		EF = 3;
		test_string = "www.tholin.dev   ";
		test_lcd_string(17);
		test_lcd_data(1, 4'b0011);
		test_lcd_data(1, 4'b0000);
		test_lcd_data(1, 4'b0011);
		test_lcd_data(1, 4'b0001);
		failures += LED0 != 0;
		test_lcd_data(0, 4'b0011);
		
		repeat(308) @(posedge cb);
		
		test_lcd_data(0, 4'b0010);
		test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b1111);
		test_lcd_data(0, 4'b1100);
		test_lcd_data(0, 4'b0111);
		
		test_string = "Avali";
		test_lcd_string(5);
		failures += LED0 != 1;
		
		repeat(28) test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b1001);
		failures += LED1 != 1;
		test_lcd_data(0, 4'b1000);
		test_lcd_data(0, 4'b1001);
		failures += LED1 != 1;
		test_lcd_data(0, 4'b1000);
		
		test_string = "Software Dev";
		test_lcd_string(12);
		
		repeat(28) test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b1100);
		test_lcd_data(0, 4'b0100);
		test_lcd_data(0, 4'b1100);
		test_lcd_data(0, 4'b0100);
		
		test_string = "Hardware Dev";
		test_lcd_string(12);
		
		repeat(28) test_lcd_data(0, 4'b0000);
		failures += LED0 != 1;
		test_lcd_data(0, 4'b1001);
		test_lcd_data(0, 4'b0110);
		test_lcd_data(0, 4'b1001);
		test_lcd_data(0, 4'b0110);
		
		test_string = "VRC World Maker";
		test_lcd_string(15);
		failures += LED0 != 1;
		repeat(66) test_lcd_data(0, 4'b0011);
		
		test_lcd_data(0, 4'b0011);
		test_lcd_data(0, 4'b0010);
		test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b1111);
		test_lcd_data(0, 4'b0000);
		test_lcd_data(0, 4'b0001);
		
		if(failures == 0) begin
			$display("%c[1;32m",27);
			`ifdef GL
				$display ("Monitor: Test (GL) Passed");
			`else
				$display ("Monitor: Test (RTL) Passed");
			`endif
			$display("%c[0m",27);
		end else begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display ("Monitor: Test (GL) Failed");
			`else
				$display ("Monitor: Test (RTL) Failed");
			`endif
			$display("%c[0m",27);
		end
		$finish;
	end

	initial begin
		RSTB <= 1'b0;
		CSB  <= 1'b1;		// Force CSB high
		#2000;
		RSTB <= 1'b1;	    	// Release reset
		#3_000_000;
		CSB = 1'b0;		// CSB can be released
	end

	initial begin		// Power-up sequence
		power1 <= 1'b0;
		power2 <= 1'b0;
		power3 <= 1'b0;
		power4 <= 1'b0;
		#100;
		power1 <= 1'b1;
		#100;
		power2 <= 1'b1;
		#100;
		power3 <= 1'b1;
		#100;
		power4 <= 1'b1;
	end

	wire flash_csb;
	wire flash_clk;
	wire flash_io0;
	wire flash_io1;

	wire VDD3V3 = power1;
	wire VDD1V8 = power2;
	wire USER_VDD3V3 = power3;
	wire USER_VDD1V8 = power4;
	wire VSS = 1'b0;

	caravel uut (
		.vddio	  (VDD3V3),
		.vddio_2  (VDD3V3),
		.vssio	  (VSS),
		.vssio_2  (VSS),
		.vdda	  (VDD3V3),
		.vssa	  (VSS),
		.vccd	  (VDD1V8),
		.vssd	  (VSS),
		.vdda1    (VDD3V3),
		.vdda1_2  (VDD3V3),
		.vdda2    (VDD3V3),
		.vssa1	  (VSS),
		.vssa1_2  (VSS),
		.vssa2	  (VSS),
		.vccd1	  (VDD1V8),
		.vccd2	  (VDD1V8),
		.vssd1	  (VSS),
		.vssd2	  (VSS),
		.clock    (clock),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("lcd.hex")
	) spiflash (
		.csb(flash_csb),
		.clk(flash_clk),
		.io0(flash_io0),
		.io1(flash_io1),
		.io2(),			// not used
		.io3()			// not used
	);

endmodule
`default_nettype wire
