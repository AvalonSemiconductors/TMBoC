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

module vga_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	wire checkbit;

	assign checkbit = mprj_io[37];

	// External clock is used by default.  Make this artificially fast for the
	// simulation.  Normally this would be a slow clock and the digital PLL
	// would be the fast clock.

	always #45 design_clk <= (design_clk === 1'b0);
	assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;

	assign mprj_io[8:5] = 4'b1101;
	
	reg design_rst;
	reg design_clk;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = design_clk;
	
	reg pattern_sel;
	assign mprj_io[11] = pattern_sel;
	
	wire [7:0] pixel = mprj_io[19:12];
	wire pixel0 = pixel[0];
	wire hsync = mprj_io[20];
	wire vsync = mprj_io[21];
	
	initial begin
		design_rst = 1;
		design_clk = 0;
		pattern_sel <= 1;
	end
	
	integer test;
	initial begin
		//$dumpfile("vga.vcd");
		//$dumpvars(0, vga_tb);
		test = 16000;

		while(test > 2)  begin
			repeat (200) @(posedge clock);
			$fflush();
			test -= 1;
		end
		if(test == 2) begin
			$display("%c[1;31m",27);
			`ifdef GL
				$display ("Monitor: Timeout, Test (GL) Failed");
			`else
				$display ("Monitor: Timeout, Test (RTL) Failed");
			`endif
			$display("%c[0m",27);
			$finish;
		end
		test = 16384;
	end
	
	integer failures;
	integer vcounter,hcounter;
	integer fhandle;
	initial begin
		wait(checkbit == 0);
		wait(checkbit == 1);
		wait(checkbit == 0);
		wait(checkbit == 1);
		$display("Initialized, testing VGA");
		$fflush();
		$dumpfile("vga.vcd");
		$dumpvars(1, vga_tb);
		$dumpvars(0, vga_tb.uut.mprj.wrapped_vgatest);
		failures = 0;
		//Tests here
		
		fhandle = $fopen("frame.bin", "w");
		$fwrite(fhandle, "    ");
		$fflush();
		$fclose(fhandle);
		design_rst <= 0;
		hcounter = 0;
		pattern_sel <= 1;
		repeat(401) begin
			@(posedge design_clk);
			failures += hsync != 1;
			failures += vsync != 1;
			vcounter = 0;
			repeat(756) begin
				@(posedge design_clk);
				vcounter = vcounter + 1;
				if(vcounter <= 720 && hcounter < 400) begin
					fhandle = $fopen("frame.bin", "a+b");
					$fwrite(fhandle, "%u", pixel);
					$fflush();
					$fclose(fhandle);
				end
			end
			failures += hsync != 0;
			failures += vsync != 1;
			repeat(72) @(posedge design_clk);
			failures += hsync != 1;
			failures += vsync != 1;
			repeat(107) @(posedge design_clk);
			
			hcounter = hcounter + 1;
		end
		repeat(936) @(posedge design_clk);
		failures += vsync != 0;
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		failures += vsync != 1;
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		repeat(936) @(posedge design_clk);
		failures += vsync != 1;
		
		$display("Second frame");
		pattern_sel <= 0;
		
		fhandle = $fopen("frame2.bin", "w");
		$fwrite(fhandle, "    ");
		$fflush();
		$fclose(fhandle);
		design_rst <= 0;
		hcounter = 0;
		repeat(401) begin
			@(posedge design_clk);
			failures += hsync != 1;
			failures += vsync != 1;
			vcounter = 0;
			repeat(756) begin
				@(posedge design_clk);
				vcounter = vcounter + 1;
				if(vcounter < 720 && hcounter < 400) begin
					fhandle = $fopen("frame2.bin", "a+b");
					$fwrite(fhandle, "%u", pixel);
					$fflush();
					$fclose(fhandle);
				end
			end
			failures += hsync != 0;
			failures += vsync != 1;
			repeat(72) @(posedge design_clk);
			failures += hsync != 1;
			failures += vsync != 1;
			repeat(107) @(posedge design_clk);
			
			hcounter = hcounter + 1;
		end
		
		design_rst <= 1;
		@(posedge design_clk);
		
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
		.clock    (design_clk),
		.gpio     (gpio),
		.mprj_io  (mprj_io),
		.flash_csb(flash_csb),
		.flash_clk(flash_clk),
		.flash_io0(flash_io0),
		.flash_io1(flash_io1),
		.resetb	  (RSTB)
	);

	spiflash #(
		.FILENAME("vga.hex")
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
