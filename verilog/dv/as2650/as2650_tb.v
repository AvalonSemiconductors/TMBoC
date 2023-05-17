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

module as2650_tb;
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

	assign mprj_io[8:5] = 4'b0111;
	
	reg design_rst;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = clock;
	
	//Design I/Os
	reg sense;
	assign mprj_io[0] = sense;
	wire [7:0] data_out = mprj_io[18:11];
	reg [7:0] data_in;
	wire [12:0] addr = mprj_io[31:19];
	wire RW = mprj_io[32];
	wire OPREQ = mprj_io[33];
	wire WRP = mprj_io[34];
	wire M_IO = mprj_io[35];
	wire D_C = mprj_io[36];
	wire flag = mprj_io[37];
	assign mprj_io[18:11] = RW || OPREQ == 0 ? 8'hzz : data_in;
	
	initial begin
		s_clock = 0;
		design_rst = 1;
		clk_rst = 1;
		sense = 0;
		data_in = 0;
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
	initial begin
		wait(gpio == 0);
		wait(gpio == 1);
		wait(gpio == 0);
		wait(gpio == 1);
		$display("Initialized, testing AS2650");
		$fflush();
		$dumpfile("as2650.vcd");
		$dumpvars(1, as2650_tb);
		$dumpvars(0, as2650_tb.uut.chip_core.mprj.wrapped_as2650);
		failures = 0;
		@(posedge cb);
		design_rst = 0;
		failures += addr != 0;
		failures += OPREQ != 0;
		data_in = 8'hC0;
		@(posedge cb);
		failures += RW != 0;
		failures += addr != 0;
		failures += M_IO != 1;
		failures += OPREQ != 1;
		failures += WRP != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		failures += WRP != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		failures += WRP != 0;
		@(posedge cb);
		failures += RW != 0;
		failures += addr != 1;
		failures += M_IO != 1;
		failures += OPREQ != 1;
		failures += WRP != 0;
		@(posedge cb);
		@(posedge cb);
		
		data_in = 8'h0C; //loda,r0
		@(posedge cb);
		failures += addr != 2;
		failures += OPREQ != 1;
		@(posedge cb);
		@(posedge cb);
		failures += addr != 3;
		failures += OPREQ != 1;
		data_in = 8'h03;
		@(posedge cb);
		failures += addr != 4;
		failures += RW != 0;
		failures += OPREQ != 1;
		data_in = 8'h01;
		@(posedge cb);
		failures += OPREQ != 1;
		failures += M_IO != 1;
		failures += WRP != 0;
		failures += RW != 0;
		failures += addr != 16'h0301;
		data_in = 8'h05;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		
		data_in = 8'h07; //lodi,r3 8
		@(posedge cb);
		failures += addr != 5;
		failures += OPREQ != 1;
		@(posedge cb);
		failures += OPREQ != 0;
		data_in = 8'h08;
		@(posedge cb);
		failures += OPREQ != 1;
		failures += M_IO != 1;
		failures += addr != 6;
		failures += RW != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		
		data_in = 8'h83; //addz,r3
		@(posedge cb);
		failures += addr != 7;
		failures += RW != 0;
		failures += OPREQ != 1;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		
		data_in = 8'hC2; //strz,r2
		@(posedge cb);
		failures += addr != 8;
		failures += OPREQ != 1;
		failures += RW != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		
		data_in = 8'hCA; //strr,r2
		@(posedge cb);
		failures += addr != 9;
		@(posedge cb);
		data_in = 8'h0A;
		@(posedge cb);
		failures += addr != 10;
		failures += OPREQ != 1;
		@(posedge cb);
		failures += addr != 22 || RW != 1 || OPREQ != 1 || WRP != 0 || data_out != 8'h0D;
		@(posedge cb);
		failures += addr != 22 || RW != 1 || OPREQ != 1 || WRP != 1 || data_out != 8'h0D;
		@(posedge cb);
		failures += RW != 0 || OPREQ != 0 || WRP != 0;
		
		data_in = 8'h9C; //bcfa,0
		@(posedge cb);
		failures += addr != 11;
		@(posedge cb);
		failures += OPREQ != 0;
		data_in = 8'h00;
		@(posedge cb);
		failures += addr != 12;
		@(posedge cb);
		failures += addr != 13;
		data_in = 8'hFF;
		@(posedge cb);
		failures += OPREQ != 0;
		
		data_in = 8'h76; //ppsu 0b01100000
		@(posedge cb);
		failures += addr != 255;
		@(posedge cb);
		failures += OPREQ != 0;
		@(posedge cb);
		data_in = 8'b01100000;
		failures += addr != 256;
		failures += flag != 0;
		@(posedge cb);
		failures += OPREQ != 0;
		failures += flag != 1;
		
		design_rst = 1;
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		
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
		.FILENAME("as2650.hex")
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
