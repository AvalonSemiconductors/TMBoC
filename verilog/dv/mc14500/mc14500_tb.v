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

module mc14500_tb;
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

	assign mprj_io[8:5] = 4'b0100;
	
	reg design_rst;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = clock;
	
	//Design I/Os
	reg [3:0] instr;
	assign mprj_io[14:11] = instr;
	wire data_out = mprj_io[15];
	reg data_in;
	wire WRITE = mprj_io[17];
	assign mprj_io[15] = WRITE ? 1'bz : data_in;
	wire RR = mprj_io[18];
	wire JMP = mprj_io[19];
	wire RTN = mprj_io[20];
	wire FLAG_O = mprj_io[21];
	wire FLAG_F = mprj_io[22];
	
	initial begin
		s_clock = 0;
		design_rst = 1;
		instr = 0;
		data_in = 0;
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
	
	`define NOPO 0
	`define LD 1
	`define LDC 2
	`define AND 3
	`define ANDC 4
	`define OR 5
	`define ORC 6
	`define XNOR 7
	`define STO 8
	`define STOC 9
	`define IEN 10
	`define OEN 11
	`define JMP 12
	`define RTN 13
	`define SKZ 14
	`define NOPF 15
	
	integer failures;
	initial begin
		wait(gpio == 0);
		wait(gpio == 1);
		wait(gpio == 0);
		wait(gpio == 1);
		$display("Initialized, testing MC14500");
		$fflush();
		$dumpfile("mc14500.vcd");
		$dumpvars(1, mc14500_tb);
		$dumpvars(0, mc14500_tb.uut.chip_core.mprj.wrapped_MC14500);
		failures = 0;
		instr = `NOPO;
		design_rst = 0;
		wait(FLAG_O == 1);
		@(posedge cb);
		failures += FLAG_F != 0;
		instr = `NOPF;
		@(posedge cb);
		failures += FLAG_F != 1;
		failures += FLAG_O != 0;
		data_in = 1;
		instr = `IEN;
		@(posedge cb);
		instr = `OEN;
		@(posedge cb);
		data_in = 1;
		instr = `LD;
		@(posedge cb);
		failures += RR != 1;
		data_in = 0;
		@(posedge cb);
		failures += RR != 0;
		instr = `LDC;
		@(posedge cb);
		failures += RR != 1;
		data_in = 1;
		@(posedge cb);
		failures += RR != 0;
		instr = `OR;
		@(posedge cb);
		failures += RR != 1;
		data_in = 0;
		@(posedge cb);
		failures += RR != 1;
		data_in = 0;
		@(posedge cb);
		@(posedge cb);
		failures += RR != 1;
		instr = `LD;
		@(posedge cb);
		failures += RR != 0;
		instr = `OR;
		data_in = 0;
		@(posedge cb);
		failures += RR != 0;
		instr = `ORC;
		data_in = 1;
		@(posedge cb);
		failures += RR != 0;
		data_in = 0;
		@(posedge cb);
		failures += RR != 1;
		@(posedge cb);
		failures += RR != 1;
		instr = `AND;
		data_in = 1;
		@(posedge cb);
		@(posedge cb);
		failures += RR != 1;
		instr = `ANDC;
		data_in = 0;
		@(posedge cb);
		@(posedge cb);
		failures += RR != 1;
		data_in = 1;
		@(posedge cb);
		failures += RR != 0;
		instr = `OR;
		@(posedge cb);
		failures += RR != 1;
		instr = `AND;
		data_in = 0;
		@(posedge cb);
		@(posedge cb);
		failures += RR != 0;
		instr = `OR;
		data_in = 1;
		@(posedge cb);
		failures += RR != 1;
		instr = `AND;
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		failures += RR != 1;
		instr = `XNOR; //RR = RR == Data
		data_in = 1;
		@(posedge cb);
		failures += RR != 1;
		data_in = 0;
		@(posedge cb);
		failures += RR != 0;
		@(posedge cb);
		failures += RR != 1;
		failures += WRITE != 0;
		instr = `STO;
		@(posedge ca);
		#2;
		failures += WRITE != 1;
		failures += data_out != 1;
		@(posedge cb);
		instr = `AND;
		@(posedge cb);
		failures += WRITE != 0;
		failures += RR != 0;
		instr = `STO;
		@(posedge ca);
		#2;
		failures += WRITE != 1;
		failures += data_out != 0;
		@(posedge cb);
		failures += WRITE != 0;
		instr = `STOC;
		@(posedge ca);
		#2;
		failures += WRITE != 1;
		failures += data_out != 1;
		@(posedge cb);
		failures += WRITE != 0;
		instr = `OR;
		data_in = 1;
		@(posedge cb);
		failures += WRITE != 0;
		failures += RR != 1;
		instr = `STOC;
		@(posedge ca);
		#2;
		failures += WRITE != 1;
		failures += data_out != 0;
		@(posedge cb);
		failures += WRITE != 0;
		instr = `JMP;
		failures += JMP != 0;
		@(posedge cb);
		failures += JMP != 1;
		instr = `RTN;
		failures += RTN != 0;
		@(posedge cb);
		failures += JMP != 0;
		failures += RTN != 1;
		instr = `SKZ;
		failures += RR != 1;
		@(posedge cb);
		instr = `NOPF;
		@(posedge cb);
		failures += FLAG_F != 1;
		instr = `XNOR;
		data_in = 0;
		@(posedge cb);
		failures += RR != 0;
		instr = `SKZ;
		@(posedge cb);
		instr = `NOPF;
		@(posedge cb);
		failures += FLAG_F != 0;
		instr = `LDC;
		data_in = 0;
		@(posedge cb);
		failures += RR != 1;
		instr = `IEN;
		@(posedge cb);
		instr = `OEN;
		@(posedge cb);
		instr = `STO;
		@(posedge ca);
		#2;
		failures += WRITE != 0;
		@(posedge cb);
		instr = `STOC;
		@(posedge ca);
		#2;
		failures += WRITE != 0;
		@(posedge cb);
		failures += WRITE != 0;
		failures += RR != 1;
		instr = `LD;
		data_in = 1;
		@(posedge cb);
		failures += RR != 0;
		
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
		.FILENAME("mc14500.hex")
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
