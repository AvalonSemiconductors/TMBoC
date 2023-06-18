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

module io_reset_test_tb;
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
	
	initial begin
		s_clock = 0;
		clk_rst = 1;
		#100;
		clk_rst = 0;
	end
	
	integer timeout;
	initial begin
		timeout = 1200;

		while(timeout > 2)  begin
			repeat (64) @(posedge clock);
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
	
	wire [7:0] TEST = mprj_io[37:30];
	initial begin
		$dumpfile("io_reset_test.vcd");
		$dumpvars(1, io_reset_test_tb);
		wait(gpio == 0);
		wait(gpio == 1);
		wait(gpio == 0);
		wait(gpio == 1);
		$display("Initialized, testing mgmt IO reset behavior");
		$fflush();
		RSTB <= 1'b0;
		repeat(256) @(posedge cb);
		RSTB <= 1'b1;
		wait(gpio == 0);
		wait(gpio == 1);
		
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
		.FILENAME("io_reset_test.hex")
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
