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

module as1802_tb;
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

	assign mprj_io[8:5] = 4'b1001;
	
	reg design_rst;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = clock;
	
	//Design I/Os
	wire [7:0] data_out = mprj_io[18:11];
	reg [7:0] data_in;
	reg intr;
	assign mprj_io[19] = intr;
	reg [3:0] EF;
	assign mprj_io[23:20] = EF;
	wire [7:0] addr = mprj_io[31:24];
	wire Q = mprj_io[32];
	wire MRD = mprj_io[33];
	wire MWR = mprj_io[34];
	wire TPA = mprj_io[35];
	wire SC0 = mprj_io[36];
	wire SC1 = mprj_io[37];
	assign mprj_io[18:11] = MWR ? data_in : 8'hzz;
	
	initial begin
		s_clock = 0;
		design_rst = 1;
		clk_rst = 1;
		data_in = 0;
		intr = 0;
		EF = 7;
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
	task check_cpu_outs(input integer dout, input integer address, input integer Q_t, input integer TPA_t, input integer MRD_t, input integer MWR_t, input integer SC0_t, input integer SC1_t);
		begin
			failures += dout != 255 && data_out != dout;
			failures += addr != address;
			failures += Q != Q_t;
			failures += TPA != TPA_t;
			failures += MRD != MRD_t;
			failures += MWR != MWR_t;
			failures += SC0 != SC0_t;
			failures += SC1 != SC1_t;
		end
	endtask
	
	task test_long_fetch(input integer prev_lo_addr, input integer addr);
		begin
			@(posedge cb);
			check_cpu_outs(255, prev_lo_addr, 0, 0, 1, 1, 0, 0);
			@(posedge cb);
			check_cpu_outs(255, addr[15:8], 0, 1, 0, 1, 0, 0);
			@(posedge cb);
			check_cpu_outs(255, addr[15:8], 0, 0, 0, 1, 0, 0);
			@(posedge cb);
			check_cpu_outs(255, addr[7:0], 0, 0, 0, 1, 0, 0);
			@(posedge cb);
			check_cpu_outs(255, addr[7:0], 0, 0, 1, 1, 1, 0);
		end
	endtask
	
	task test_read_cycle(input integer prev_lo_addr, input integer addr, input integer data);
		begin
			check_cpu_outs(255, prev_lo_addr, 0, 0, 1, 1, 1, 0);
			@(posedge cb)
			check_cpu_outs(255, addr[15:8], 0, 1, 0, 1, 1, 0);
			@(posedge cb)
			check_cpu_outs(255, addr[15:8], 0, 0, 0, 1, 1, 0);
			@(posedge cb)
			check_cpu_outs(255, addr[7:0], 0, 0, 0, 1, 1, 0);
			data_in = data;
			@(posedge cb)
			check_cpu_outs(255, addr[7:0], 0, 0, 1, 1, 1, 0);
		end
	endtask
	
	initial begin
		wait(gpio == 0);
		wait(gpio == 1);
		wait(gpio == 0);
		wait(gpio == 1);
		$display("Initialized, testing AS1802");
		$fflush();
		$dumpfile("as1802.vcd");
		$dumpvars(1, as1802_tb);
		$dumpvars(0, as1802_tb.uut.chip_core.mprj.wrapped_as1802);
		failures = 0;
		@(posedge cb);
		design_rst = 0;
		
		//Initial instruction fetch timing
		data_in = 8'hC4;
		test_long_fetch(0, 0);
		@(posedge cb);
		
		//Subsequent instruction fetch timing
		@(posedge cb);
		check_cpu_outs(255, 0, 0, 0, 1, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 1, 0, 0, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 1, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//LDI
		data_in = 8'hF8;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 2, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 3, 0, 0, 0, 1, 1, 0);
		data_in = 8'h10;
		@(posedge cb);
		check_cpu_outs(255, 3, 0, 0, 1, 1, 1, 0);
		
		//PLO R3
		data_in = 8'hA3;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 4, 0, 0, 1, 1, 1, 0);
		
		//ADI 5
		data_in = 8'hFC;
		repeat(4) @(posedge cb);
		@(posedge cb);
		data_in = 8'h05;
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 6, 0, 0, 1, 1, 1, 0);
		
		//PHI R3
		data_in = 8'hB3;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 7, 0, 0, 1, 1, 1, 0);
		
		//PLO R5
		data_in = 8'hA5;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 8, 0, 0, 1, 1, 1, 0);
		
		//PHI R5
		data_in = 8'hB5;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 9, 0, 0, 1, 1, 1, 0);
		
		//INC R5
		data_in = 8'h15;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 10, 0, 0, 1, 1, 1, 0);
		
		//LDN R3
		data_in = 8'h03;
		repeat(4) @(posedge cb);
		test_read_cycle(11, 16'h1510, 69);
		
		//STR R5
		data_in = 8'h55;
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 1, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 0, 0, 1, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 0, 0, 0, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 12, 0, 0, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 12, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//Write cycle timing
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(69, 8'h16, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 1, 1, 1, 0);
		
		//GHI R3
		data_in = 8'h93;
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 1, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 0, 0, 1, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 0, 0, 0, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 13, 0, 0, 0, 1, 0, 0);
		@(posedge cb);
		check_cpu_outs(255, 13, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//PLO R10
		data_in = 8'hAA;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 14, 0, 0, 1, 1, 1, 0);
		
		//GLO R3
		data_in = 8'h83;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
		
		//PHI R10
		data_in = 8'hBA;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 16, 0, 0, 1, 1, 1, 0);
		
		//STR R10
		data_in = 8'h5A;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 17, 0, 0, 1, 1, 1, 0);
		
		//Write cycle timing
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'h10, 8'h15, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 0, 1, 1, 1, 0);
		
		//SEX R10
		data_in = 8'hEA;
		test_long_fetch(8'h15, 18);
		@(posedge cb);
		
		//IRX
		data_in = 8'h60;
		repeat(4) @(posedge cb);
		
		//LDXA
		data_in = 8'h72;
		repeat(4) @(posedge cb);
		test_read_cycle(20, 16'h1016, 8'h22);
		
		//STXD
		data_in = 8'h73;
		test_long_fetch(8'h16, 21);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h17, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'h22, 8'h17, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h17, 0, 0, 1, 1, 1, 0);
		
		//LDX
		data_in = 8'hF0;
		test_long_fetch(8'h17, 22);
		@(posedge cb);
		test_read_cycle(22, 16'h1016, 8'h24);
		
		//STR R10
		data_in = 8'h5A;
		test_long_fetch(8'h16, 23);
		
		//Write cycle timing
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'h24, 8'h16, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 1, 1, 1, 0);
		
		//OR
		data_in = 8'hF1;
		test_long_fetch(8'h16, 24);
		@(posedge cb);
		test_read_cycle(24, 16'h1016, 1);
		@(posedge cb);
		//8'h24 -> 8'h25
		
		//SMI
		data_in = 8'hFF;
		test_long_fetch(8'h16, 25);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 26, 0, 0, 0, 1, 1, 0);
		data_in = 8'h10;
		@(posedge cb);
		check_cpu_outs(255, 26, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		//8'h25 -> 8'h15
		
		//SHL
		data_in = 8'hFE;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 27, 0, 0, 1, 1, 1, 0);
		//8'h15 -> 8'h2A
		
		//SD
		data_in = 8'hF5;
		repeat(4) @(posedge cb);
		test_read_cycle(28, 16'h1016, 255);
		@(posedge cb);
		//8'h2A -> 8'hD5
		
		//STXD
		data_in = 8'h73;
		test_long_fetch(8'h16, 29);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'hD5, 8'h16, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h16, 0, 0, 1, 1, 1, 0);
		
		//ADI 255
		data_in = 8'hFC;
		test_long_fetch(8'h16, 30);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 31, 0, 0, 0, 1, 1, 0);
		data_in = 8'hFF;
		@(posedge cb);
		check_cpu_outs(255, 31, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		//8'hD5 -> 8'hD4 and DF becomes 1
		
		//ADCI 5
		data_in = 8'h7C;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 32, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 33, 0, 0, 0, 1, 1, 0);
		data_in = 8'h05;
		@(posedge cb);
		check_cpu_outs(255, 33, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		//8'hD4 -> 8'hDA and DF becomes 0
		
		//STXD
		data_in = 8'h73;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 34, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'hDA, 8'h15, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h15, 0, 0, 1, 1, 1, 0);
		
		//SHR
		data_in = 8'hF6;
		test_long_fetch(8'h15, 35);
		@(posedge cb);
		//8'hDA -> 8'h6D
		
		//SHR
		data_in = 8'hF6;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 36, 0, 0, 1, 1, 1, 0);
		//8'h6D -> 8'h36 and DF becomes 1

		//RSHR
		data_in = 8'h76;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 37, 0, 0, 1, 1, 1, 0);
		//8'h36 -> 8'h9B and DF becomes 0
		
		//STR R10
		data_in = 8'h5A;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 38, 0, 0, 1, 1, 1, 0);
		
		//Write cycle timing
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h14, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'h9B, 8'h14, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h14, 0, 0, 1, 1, 1, 0);
		
		//SEP R5
		data_in = 8'hD5;
		test_long_fetch(8'h14, 39);
		@(posedge cb);
		
		//NOP
		data_in = 8'hC4;
		test_long_fetch(39, 16'h1516);
		@(posedge cb);
		
		//BR
		data_in = 8'h30;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 23, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 24, 0, 0, 0, 1, 1, 0);
		data_in = 66;
		@(posedge cb);
		check_cpu_outs(255, 24, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//NOP
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 66, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//LBR
		data_in = 8'hC0;
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 67, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 68, 0, 0, 0, 1, 1, 0);
		data_in = 8;
		@(posedge cb);
		check_cpu_outs(255, 68, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		@(posedge cb);
		check_cpu_outs(255, 69, 0, 0, 0, 1, 1, 0);
		data_in = 9;
		@(posedge cb);
		check_cpu_outs(255, 69, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//NOP
		data_in = 8'hC4;
		test_long_fetch(69, 16'h0809);
		@(posedge cb);
		
		//BZ
		data_in = 8'h32;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 10, 0, 0, 1, 1, 1, 0);
		
		//LDI 0
		data_in = 8'hF8;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 12, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 13, 0, 0, 0, 1, 1, 0);
		data_in = 0;
		@(posedge cb);
		check_cpu_outs(255, 13, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//LBZ
		data_in = 8'hC2;
		@(posedge cb);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 14, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 15, 0, 0, 0, 1, 1, 0);
		data_in = 8'h22;
		@(posedge cb);
		check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		@(posedge cb);
		check_cpu_outs(255, 16, 0, 0, 0, 1, 1, 0);
		data_in = 0;
		@(posedge cb);
		check_cpu_outs(255, 16, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//SMI 5
		data_in = 8'hFF;
		test_long_fetch(16, 16'h2200);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 1, 0, 0, 0, 1, 1, 0);
		data_in = 8'h05;
		@(posedge cb);
		check_cpu_outs(255, 1, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//BDF
		data_in = 8'h33;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 2, 0, 0, 1, 1, 1, 0);
		
		//SMI 5
		data_in = 8'hFF;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 4, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 5, 0, 0, 0, 1, 1, 0);
		data_in = 8'h05;
		@(posedge cb);
		check_cpu_outs(255, 5, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//BDF
		data_in = 8'h33;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 6, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 7, 0, 0, 0, 1, 1, 0);
		data_in = 15;
		@(posedge cb);
		check_cpu_outs(255, 7, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//B1
		EF[0] = 1;
		data_in = 8'h34;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
		
		//BN3
		EF[2] = 1;
		data_in = 8'h3E;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 17, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 18, 0, 0, 0, 1, 1, 0);
		data_in = 100;
		@(posedge cb);
		check_cpu_outs(255, 18, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//B2
		EF[1] = 0;
		data_in = 8'h35;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 100, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 101, 0, 0, 0, 1, 1, 0);
		data_in = 200;
		@(posedge cb);
		check_cpu_outs(255, 101, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//BN3
		data_in = 8'h3F;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 200, 0, 0, 1, 1, 1, 0);
		
		//NOP
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 202, 0, 0, 1, 1, 1, 0);
		
		//SKP
		data_in = 8'h38;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 203, 0, 0, 1, 1, 1, 0);
		
		//ADI 1
		data_in = 8'hFC;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 205, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 206, 0, 0, 0, 1, 1, 0);
		data_in = 1;
		@(posedge cb);
		check_cpu_outs(255, 206, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//LSDF
		data_in = 8'hCF;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 207, 0, 0, 1, 1, 1, 0);
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 208, 0, 0, 1, 1, 1, 0);
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 209, 0, 0, 1, 1, 1, 0);
		
		//LDI 0
		data_in = 8'hF8;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 210, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 211, 0, 0, 0, 1, 1, 0);
		data_in = 0;
		@(posedge cb);
		check_cpu_outs(255, 211, 0, 0, 1, 1, 1, 0);
		
		//LSZ
		data_in = 8'hCE;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 212, 0, 0, 1, 1, 1, 0);
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 215, 0, 0, 1, 1, 1, 0);
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 216, 0, 0, 1, 1, 1, 0);
		
		//SEQ
		data_in = 8'h7B;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 217, 1, 0, 1, 1, 1, 0);
		
		//REQ
		data_in = 8'h7A;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 218, 0, 0, 1, 1, 1, 0);
		
		//LDI 8'h55
		data_in = 8'hF8;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 219, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 220, 0, 0, 0, 1, 1, 0);
		data_in = 8'h55;
		@(posedge cb);
		check_cpu_outs(255, 220, 0, 0, 1, 1, 1, 0);
		
		//PHI R1
		data_in = 8'hB1;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 221, 0, 0, 1, 1, 1, 0);
		
		//PLO R1
		data_in = 8'hA1;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 222, 0, 0, 1, 1, 1, 0);
		
		//LDI 8'h11
		data_in = 8'hF8;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 223, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 224, 0, 0, 0, 1, 1, 0);
		data_in = 8'h11;
		@(posedge cb);
		check_cpu_outs(255, 224, 0, 0, 1, 1, 1, 0);
		
		//PHI R2
		data_in = 8'hB2;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 225, 0, 0, 1, 1, 1, 0);
		
		//PLO R2
		data_in = 8'hA2;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 226, 0, 0, 1, 1, 1, 0);
		
		//IDL
		data_in = 8'h00;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 0);
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 0);
		
		//Send interrupt
		intr <= 1;
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 1);
		
		//STXD to test P and X
		data_in = 8'h73;
		test_long_fetch(227, 16'h5555);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'h11, 8'h11, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 0, 1, 1, 1, 0);
		
		//SAV
		intr <= 0;
		data_in = 8'h78;
		test_long_fetch(8'h11, 16'h5556);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(8'hA5, 8'h10, 0, 0, 0, 0, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 1, 1, 1, 0);
		
		//LSIE
		data_in = 8'hCC;
		test_long_fetch(8'h10, 16'h5557);
		@(posedge cb);
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 8'h58, 0, 0, 1, 1, 1, 0);
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 8'h59, 0, 0, 1, 1, 1, 0);
		
		//RET
		data_in = 8'h70;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 8'h5A, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h11, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		data_in = 8'hA5;
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 1, 1, 1, 0);
		@(posedge cb);
		
		//LDX to test return from interrupt
		data_in = 8'hF0;
		test_long_fetch(8'h10, 16'h2200 + 228);
		@(posedge cb);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 1, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h10, 0, 0, 0, 1, 1, 0);
		@(posedge cb);
		check_cpu_outs(255, 8'h14, 0, 0, 0, 1, 1, 0);
		data_in = 69;
		@(posedge cb);
		check_cpu_outs(255, 8'h14, 0, 0, 1, 1, 1, 0);
		
		//LSIE
		data_in = 8'hCC;
		test_long_fetch(8'h14, 16'h2200 + 229);
		@(posedge cb);
		data_in = 8'hC4;
		repeat(4) @(posedge cb);
		check_cpu_outs(255, 232, 0, 0, 1, 1, 1, 0);
		
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
		.FILENAME("as1802.hex")
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
