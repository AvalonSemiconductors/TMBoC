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

module as512512512_tb;
	reg clock;
	reg RSTB;
	reg CSB;
	reg power1, power2;
	reg power3, power4;

	wire gpio;
	wire [37:0] mprj_io;
	wire checkbit;

	assign checkbit = mprj_io[37];
	
	always #12.5 clock <= (clock === 1'b0);
	assign mprj_io[3] = (CSB == 1'b1) ? 1'b1 : 1'bz;

	assign mprj_io[8:5] = 4'b1100;
	
	reg design_rst;
	assign mprj_io[9] = design_rst;
	assign mprj_io[10] = clock;
	
	wire IO0 = mprj_io[0];
	wire IO1 = mprj_io[1];
	wire IO2 = mprj_io[2];
	wire IO3 = mprj_io[3];
	wire IO4 = mprj_io[4];
	
	reg [15:0] data_in;
	reg RX;
	reg SDI;
	reg EF;
	reg [15:0] memory_val;
	reg memory_enabled;
	
	wire [15:0] data_out = mprj_io[26:11];
	wire LEN1 = mprj_io[27];
	wire LEN2 = mprj_io[28];
	wire RW = mprj_io[29];
	wire OPREQ = mprj_io[30];
	assign mprj_io[26:11] = RW || LEN1 || LEN2 ? 16'bzzzzzzzz_zzzzzzzz : (memory_enabled ? memory_val : data_in);
	wire TX = mprj_io[31];
	assign mprj_io[32] = RX;
	wire SDO = mprj_io[33];
	assign mprj_io[34] = SDI;
	wire SCLK = mprj_io[35];
	wire CE = mprj_io[36];
	assign mprj_io[37] = EF;
	wire M0 = mprj_io[0];
	
	reg [31:0] full_addr;

	initial begin
		clock = 0;
		design_rst = 1;
		data_in = 0;
		RX = 1;
		SDI = 0;
		EF = 1'bz;
		full_addr = 0;
		memory_enabled = 0;
	end
	
	always @(negedge clock) begin
		if(!design_rst && (LEN1 || LEN2)) begin
			if(LEN1) full_addr[15:0] <= data_out;
			if(LEN2) full_addr[31:16] <= data_out;
		end
	end

	integer test;
	initial begin
		//$dumpfile("as512512512.vcd");
		//$dumpvars(0, as512512512_tb);
		test = 1200;

		while(test > 2)  begin
			repeat (50) @(posedge clock);
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
		test = 2048;
	end

	`define COPY 128
	`define IMMEDIATE 32
	`define LOAD 256
	`define STORE 320
	`define W_DISPLACEMENT 8
	`define LONG_DISPLACEMENT 16
	
	`define ADD 64
	`define SUB 65
	`define ADC 66
	`define SBC 67
	`define AND 68
	`define OR  69
	`define XOR 70
	`define MUL 72
	`define RSH 73
	`define LSH 74
	`define ASR 75
	`define LSC 76
	`define RSC 77
	`define DO_SAVE 16

	`define BRANCH 384
	`define PC_REL 64
	`define IF_CARRY 1
	`define IF_NO_CARRY 2
	`define IF_ZERO 3
	`define IF_NO_ZERO 4
	`define IF_EF 5
	`define IF_NO_EF 6
	
	//Misc. ops
	`define NOP 0
	`define STMR 1
	`define LTMR 2
	`define SPS 3
	`define LPS 4
	`define SEL 5
	`define DSEL 6
	`define LBD 7
	`define LSD 8
	`define SPI 9
	`define UTX 10
	`define URX 11
	`define STX 12
	`define SRX 13

	reg [31:0] ROM_val;
	always @(*) begin
		case(full_addr[10:1])
			default: ROM_val = 0;
			
			//NOP x2
			0: ROM_val = 0;
			1: ROM_val = 0;
			//ldi64 r2.0 0x2798A7CD96AB0001
			2: ROM_val = (2 << 14) + (3 << 9) + `COPY + `IMMEDIATE;
			3: ROM_val = 32'h2798A7CD;
			4: ROM_val = 32'h96AB0001;
			//cpy48 r4.10 r2.1
			5: ROM_val = `COPY + (2 << 9) + (2 << 23) + (4 << 14) + (1 << 27) + (10 << 18);
			//ldi32 r3.12 0x10000000
			6: ROM_val = `COPY + `IMMEDIATE + (3 << 14) + (1 << 9) + (12 << 18);
			7: ROM_val = 32'h80000000;
			//str64 r2.0 r3.12+8 
			8: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (3 << 9) + (2 << 14) + (3 << 23) + (12 << 27);
			9: ROM_val = 32'h0000008;
			//ld128 r7.0 r0.0+4
			10: ROM_val = `LOAD + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (7 << 9) + (7 << 14);
			11: ROM_val = 32'h0000004;
			//str96 r7.1 r3.12
			12: ROM_val = `STORE + (5 << 9) + (7 << 14) + (1 << 18) + (3 << 23) + (12 << 27);
			
			//adi32 r4.10 0x03A01001
			13: ROM_val = `ADD + `DO_SAVE + `IMMEDIATE + (1 << 9) + (4 << 14) + (10 << 18);
			14: ROM_val = 32'h03A01001;
			//ldi512 r1.0 0xf9de5489a084309a_0b6f521fc7e0d6fbdda67b7f32b2a61e30eaac67a63d502f_ecf78a0d4b558a0a9b5cfb992ce68cc4e9fdaba8ba6b93232a9189cb4a776121
			15: ROM_val = `COPY + `IMMEDIATE + (31 << 9) + (1 << 14);
			16: ROM_val = 32'hf9de5489;
			17: ROM_val = 32'ha084309a;
			18: ROM_val = 32'h0b6f521f;
			19: ROM_val = 32'hc7e0d6fb;
			20: ROM_val = 32'hdda67b7f;
			21: ROM_val = 32'h32b2a61e;
			22: ROM_val = 32'h30eaac67;
			23: ROM_val = 32'ha63d502f;
			24: ROM_val = 32'hecf78a0d;
			25: ROM_val = 32'h4b558a0a;
			26: ROM_val = 32'h9b5cfb99;
			27: ROM_val = 32'h2ce68cc4;
			28: ROM_val = 32'he9fdaba8;
			29: ROM_val = 32'hba6b9323;
			30: ROM_val = 32'h2a9189cb;
			31: ROM_val = 32'h4a776121;
			//sub48 r1.0 r4.10
			32: ROM_val = `ADD + `DO_SAVE + (2 << 9) + (1 << 14) + (4 << 23) + (10 << 27);
			//xor256 r1.16 r1.0
			33: ROM_val = `XOR + `DO_SAVE + (15 << 9) + (1 << 14) + (16 << 18) + (1 << 23);
			//ani64 r1.28 0xAAAAAAAAAAAAAAAA
			34: ROM_val = `AND + `IMMEDIATE + `DO_SAVE + (3 << 9) + (1 << 14) + (28 << 18);
			35: ROM_val = 32'hAAAAAAAA;
			36: ROM_val = 32'hAAAAAAAA;
			//ori64 r1.24 0x10012345000078FF
			37: ROM_val = `OR + `IMMEDIATE + `DO_SAVE + (3 << 9) + (1 << 14) + (24 << 18);
			38: ROM_val = 32'h10012345;
			39: ROM_val = 32'h000078FF;
			//str512 r1.0 r3.12
			40: ROM_val = `STORE + (31 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			//xor512 r1.0 r1.0
			41: ROM_val = `XOR + `DO_SAVE + (31 << 9) + (1 << 14) + (1 << 23);
			//ldi32 r1.0 0xFFFFFFFF
			42: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			43: ROM_val = 32'hFFFFFFFF;
			//add32 r1.0 r3.12
			44: ROM_val = `ADD + `DO_SAVE + (1 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			//adc16 r1.2 r1.2
			45: ROM_val = `ADC + `DO_SAVE + (0 << 9) + (1 << 14) + (2 << 18) + (1 << 23) + (2 << 27);
			//sub16 r1.3 r1.2
			46: ROM_val = `SUB + `DO_SAVE + (0 << 9) + (1 << 14) + (3 << 18) + (1 << 23) + (2 << 27);
			//ldi32 r1.4 0xABCD1234
			47: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14) + (4 << 18);
			48: ROM_val = 32'hABCD1234;
			//sbc32 r1.4 r3.12
			49: ROM_val = `SBC + `DO_SAVE + (1 << 9) + (1 << 14) + (4 << 18) + (3 << 23) + (12 << 27);
			//sbi32 r1.4 0x00000210
			50: ROM_val = `SUB + `IMMEDIATE + `DO_SAVE + (1 << 9) + (1 << 14) + (4 << 18);
			51: ROM_val = 32'h00000210;
			//str96 r1.0 r3.12+0
			52: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (5 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			53: ROM_val = 32'h00000000;
			//ldi32 r10.5 0x00000100
			54: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (10 << 14) + (5 << 18);
			55: ROM_val = 32'h00000100;
			//jal r0.0 r10.5+8
			56: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (10 << 23) + (5 << 27);
			57: ROM_val = 32'h00000008;
			//ldi32 r11.4 0x01010101
			58: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (11 << 14) + (4 << 18);
			59: ROM_val = 32'h01010101;
			//jal r0.0 r15.0
			60: ROM_val = `BRANCH + (15 << 23);
			//ldi32 r11.0 0x2312ABAB
			132: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (11 << 14);
			133: ROM_val = 32'h2312ABAB;
			//jalr r0.0 r0.0+16
			134: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL;
			135: ROM_val = 32'h00000010;
			//ldi32 r11.2 0x33123312
			144: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (11 << 14) + (2 << 18);
			145: ROM_val = 32'h33123312;
			//ldi32 r14.0 116
			146: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (14 << 14);
			147: ROM_val = 116;
			//jal r15.0 r14.0
			148: ROM_val = `BRANCH + (15 << 14) + (14 << 23);
			//str96 r11.0 r3.12
			149: ROM_val = `STORE + (5 << 9) + (11 << 14) + (3 << 23) + (12 << 27);
			//add16 r0.0 r0.0
			150: ROM_val = `ADD;
			//jlc r0.0 r0.0+0
			151: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_CARRY;
			152: ROM_val = 0;
			//jlzr r0.0 r0.0+16
			153: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL + `IF_ZERO;
			154: ROM_val = 32'h00000010;
			//ldi64 r15.8 0x8201A4CD0011ABCD
			163: ROM_val = `COPY + `IMMEDIATE + (3 << 9) + (15 << 14) + (8 << 18);
			164: ROM_val = 32'h8201A4CD;
			165: ROM_val = 32'h0011ABCD;
			//jlnz r0.0 r0.0+0
			166: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_NO_ZERO;
			167: ROM_val = 0;
			//jle r0.0 r0.0+0
			168: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_EF;
			169: ROM_val = 0;
			//jlnc r0.0 r0.0+16
			170: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL + `IF_NO_CARRY;
			171: ROM_val = 32'h00000010;
			//ldi32 r1.0 0xFFFFFFFF
			180: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			181: ROM_val = 32'hFFFFFFFF;
			//add16 (no save) r1.0 r1.0
			182: ROM_val = `ADD + (1 << 14) + (1 << 23);
			//jlnc r0.0 r0.0+0
			183: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_NO_CARRY;
			184: ROM_val = 0;
			//jlc r0.0 r0.0+16
			185: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL + `IF_CARRY;
			186: ROM_val = 32'h00000010;
			//jlnz r0.0 r0.0+16
			195: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL + `IF_NO_ZERO;
			196: ROM_val = 32'h00000010;
			//jlz r0.0 r0.0+0
			205: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_ZERO;
			206: ROM_val = 0;
			//jlne r0.0 r0.0+0
			207: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT  + `LONG_DISPLACEMENT + `IF_NO_EF;
			208: ROM_val = 0;
			//jle r0.0 r0.0+16
			209: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + `PC_REL + `IF_EF;
			210: ROM_val = 32'h00000010;
			//str64 r15.8 r3.12
			219: ROM_val = `STORE + (3 << 9) + (15 << 14) + (8 << 18) + (3 << 23) + (12 << 27);
			//stmr
			220: ROM_val = `STMR;
			//str32 r1.0 r3.12
			221: ROM_val = `STORE + (1 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			//xor32 r1.0 r1.0
			222: ROM_val = `XOR + `DO_SAVE + (1 << 9) + (1 << 14) + (1 << 23);
			//ltrm
			223: ROM_val = `LTMR;
			//stmr
			224: ROM_val = `STMR;
			//str32 r1.0 r3.12+2
			225: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			226: ROM_val = 32'h00000002;
			//sub16 r1.0 r1.0
			227: ROM_val = `SUB + `DO_SAVE + (1 << 14) + (1 << 23);
			//add16 r1.0 r1.0
			228: ROM_val = `ADD + (1 << 14) + (1 << 23);
			//sps
			229: ROM_val = `SPS;
			//str32 r1.0 r3.12+4
			230: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			231: ROM_val = 32'h00000004;
			//xri32 r1.0 3
			232: ROM_val = `XOR + `DO_SAVE + `IMMEDIATE + (1 << 9) + (1 << 14);
			233: ROM_val = 32'h00000003;
			//lps
			234: ROM_val = `LPS;
			//sps
			235: ROM_val = `SPS;
			//str32 r1.0 r3.12+4
			236: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 9) + (1 << 14) + (3 << 23) + (12 << 27);
			237: ROM_val = 32'h00000004;
			//sel
			238: ROM_val = `SEL;
			//dsel
			239: ROM_val = `DSEL;
			//jal r0.0 r0.0+768
			240: ROM_val = `BRANCH + `IMMEDIATE + `W_DISPLACEMENT + `LONG_DISPLACEMENT;
			241: ROM_val = 768;
			//ldi32 r1.0 15
			384: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			385: ROM_val = 32'h0000000F;
			//lbd
			386: ROM_val = `LBD;
			//ldi32 r1.0 0x65 ; 'e'
			387: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			388: ROM_val = 32'h00000065;
			//utx
			389: ROM_val = `UTX;
			//ldi32 r2.0 784
			390: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (2 << 14);
			391: ROM_val = 784;
			//sps
			392: ROM_val = `SPS;
			//ani32 r1.0 32
			393: ROM_val = `AND + `IMMEDIATE + (1 << 9) + (1 << 14);
			394: ROM_val = 32;
			//jlnz r0.0 r2.0
			395: ROM_val = `BRANCH + (2 << 23) + `IF_NO_ZERO;
			//nop
			396: ROM_val = 0;
			//nop
			397: ROM_val = 0;
			//sel
			398: ROM_val = `SEL;
			//dsel
			399: ROM_val = `DSEL;
			//ldi32 r2.0 804
			400: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (2 << 14);
			401: ROM_val = 804;
			//sps
			402: ROM_val = `SPS;
			//ani32 r1.0 16
			403: ROM_val = `AND + `IMMEDIATE + (1 << 9) + (1 << 14);
			404: ROM_val = 16;
			//jlz r0.0 r2.0
			405: ROM_val = `BRANCH + (2 << 23) + `IF_ZERO;
			//sel
			406: ROM_val = `SEL;
			//dsel
			407: ROM_val = `DSEL;
			//urx
			408: ROM_val = `URX;
			//str16 r1.0 r3.12+6
			409: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 14) + (3 << 23) + (12 << 27);
			410: ROM_val = 32'h00000006;
			//ldi32 r1.0 15
			411: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			412: ROM_val = 32'h0000000F;
			//lsd
			413: ROM_val = `LSD;
			//ldi32 r1.0 0x53
			414: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (1 << 14);
			415: ROM_val = 32'h00000053;
			//stx
			416: ROM_val = `STX;
			//ldi32 r2.0 838
			417: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (2 << 14);
			418: ROM_val = 838;
			//sps
			419: ROM_val = `SPS;
			//ani32 r1.0 64
			420: ROM_val = `AND + `IMMEDIATE + (1 << 9) + (1 << 14);
			421: ROM_val = 64;
			//jlnz r0.0 r2.0
			422: ROM_val = `BRANCH + (2 << 23) + `IF_NO_ZERO;
			//sel
			423: ROM_val = `SEL;
			//dsel
			424: ROM_val = `DSEL;
			//srx
			425: ROM_val = `SRX;
			//str16 r1.0 r3.12+7
			426: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 14) + (3 << 23) + (12 << 27);
			427: ROM_val = 32'h00000007;
			//ldi64 r2.0 0x0000006400000005
			428: ROM_val = `COPY + `IMMEDIATE + (3 << 9) + (2 << 14);
			429: ROM_val = 100;
			430: ROM_val = 5;
			//mul32 r2.0 r2.2
			431: ROM_val = `MUL + `DO_SAVE + (1 << 9) + (2 << 14) + (2 << 23) + (2 << 27);
			//str16 r2.0 r3.12+8
			432: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (2 << 14) + (3 << 23) + (12 << 27);
			433: ROM_val = 32'h00000008;
			//ldi64 r6.0 0x7615AF0C99990000
			434: ROM_val = `COPY + `IMMEDIATE + (3 << 9) + (6 << 14);
			435: ROM_val = 32'h7615AF0C;
			436: ROM_val = 32'h99990000;
			//rsh48 r6.1 r6.1
			437: ROM_val = `RSH + `DO_SAVE + (2 << 9) + (6 << 14) + (1 << 18) + (6 << 23) + (1 << 27);
			//rsh48 r6.1 r6.1
			438: ROM_val = `RSH + `DO_SAVE + (2 << 9) + (6 << 14) + (1 << 18) + (6 << 23) + (1 << 27);
			//rsh48 r6.1 r6.1
			439: ROM_val = `RSH + `DO_SAVE + (2 << 9) + (6 << 14) + (1 << 18) + (6 << 23) + (1 << 27);
			//lsh32 r6.2 r6.2
			440: ROM_val = `LSH + `DO_SAVE + (1 << 9) + (6 << 14) + (2 << 18) + (6 << 23) + (2 << 27);
			//str48 r6.1 r3.12+9
			441: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (2 << 9) + (6 << 14) + (1 << 18) + (3 << 23) + (12 << 27);
			442: ROM_val = 32'h00000009;
			//ldi32 r6.0 0x80000000
			443: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (6 << 14);
			444: ROM_val = 32'h80000000;
			//asr32 r6.0 r6.0
			445: ROM_val = `ASR + `DO_SAVE + (1 << 9) + (6 << 14) + (6 << 23);
			//lsc32 r6.0 r6.0
			446: ROM_val = `LSC + `DO_SAVE + (1 << 9) + (6 << 14) + (6 << 23);
			//lsc32 r6.0 r6.0
			447: ROM_val = `LSC + `DO_SAVE + (1 << 9) + (6 << 14) + (6 << 23);
			//lsc32 r6.0 r6.0
			448: ROM_val = `LSC + `DO_SAVE + (1 << 9) + (6 << 14) + (6 << 23);
			//str32 r6.0 r3.12+12
			449: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 9) + (6 << 14) + (3 << 23) + (12 << 27);
			450: ROM_val = 32'h0000000C;
			//ldi32 r12.0 0x00000005
			451: ROM_val = `COPY + `IMMEDIATE + (1 << 9) + (12 << 14);
			452: ROM_val = 32'h00000005;
			//rsc32 r12.0 r12.0
			453: ROM_val = `RSC + `DO_SAVE + (1 << 9) + (12 << 14) + (12 << 23);
			//rsc32 r12.0 r12.0
			454: ROM_val = `RSC + `DO_SAVE + (1 << 9) + (12 << 14) + (12 << 23);
			//rsc32 r12.0 r12.0
			455: ROM_val = `RSC + `DO_SAVE + (1 << 9) + (12 << 14) + (12 << 23);
			//rsc32 r12.0 r12.0
			456: ROM_val = `RSC + `DO_SAVE + (1 << 9) + (12 << 14) + (12 << 23);
			//str32 r12.0 r3.12+14
			457: ROM_val = `STORE + `W_DISPLACEMENT + `LONG_DISPLACEMENT + (1 << 9) + (12 << 14) + (3 << 23) + (12 << 27);
			458: ROM_val = 32'h0000000E;
		endcase
	end
	
	reg [15:0] RAM [511:0];
	
	always @(*) begin
		memory_val = full_addr[31] ? RAM[full_addr[8:0]] : (full_addr[0] ? ROM_val[15:0] : ROM_val[31:16]);
	end
	
	always @(posedge clock) begin
		if(memory_enabled && OPREQ && RW && full_addr[31]) begin
			RAM[full_addr[8:0]] <= data_out;
		end
	end
	
	integer failures;
	integer test_step; //For gtkwave
	initial begin
		test_step = 0;
		wait(checkbit == 0);
		wait(checkbit == 1);
		wait(checkbit == 0);
		wait(checkbit == 1);
		wait(LEN1 == 0);
		$display("Initialized, testing AS512512512");
		$fflush();
		$dumpfile("as512512512.vcd");
		$dumpvars(1, as512512512_tb);
		$dumpvars(0, as512512512_tb.uut.chip_core.mprj.wrapped_as512512512);
		failures = 0;
		//Tests here
		data_in <= 0;
		design_rst <= 0;
		
		//First instr fetch (NOP)
		@(posedge clock);
		@(posedge clock);
		@(posedge clock);
		failures += data_out != 0;
		failures += LEN2 != 1;
		failures += LEN1 != 0;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += data_out != 0;
		failures += LEN2 != 0;
		failures += LEN1 != 1;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 1;
		failures += RW != 0;
		failures += full_addr != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += data_out != 1;
		failures += LEN2 != 0;
		failures += LEN1 != 1;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 1;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += full_addr != 1;
		
		test_step = 1;
		@(posedge clock);
		@(posedge clock);
		failures += data_out != 2;
		failures += LEN2 != 0;
		failures += LEN1 != 1;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 1;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += data_out != 3;
		failures += LEN2 != 0;
		failures += LEN1 != 1;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 1;
		failures += RW != 0;
		@(posedge clock);
		failures += LEN2 != 0;
		failures += LEN1 != 0;
		failures += OPREQ != 0;
		failures += RW != 0;
		@(posedge clock);
		if(failures == 0) $display("PASSED: Instruction fetches");
		test_step = 2;
		
		memory_enabled = 1;
		@(posedge clock);
		repeat(6) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[8] != 16'h2798;
		failures += RAM[9] != 16'hA7CD;
		failures += RAM[10] != 16'h96AB;
		failures += RAM[11] != 16'h0001;
		if(failures == 0) $display("PASSED: Load/Store");
		test_step = 3;
		
		repeat(7) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[ 0] != 16'h0028;
		failures += RAM[ 1] != 16'h8A80;
		failures += RAM[ 2] != 16'hAA80;
		failures += RAM[ 3] != 16'hAA80;
		failures += RAM[ 4] != 16'h9033;
		failures += RAM[ 5] != 16'hABC7;
		failures += RAM[ 6] != 16'hEB06;
		failures += RAM[ 7] != 16'h7AFF;
		failures += RAM[ 8] != 16'h345B;
		failures += RAM[ 9] != 16'hD0D7;
		failures += RAM[10] != 16'h88D9;
		failures += RAM[11] != 16'h353D;
		failures += RAM[12] != 16'h1A7B;
		failures += RAM[31] != 16'h07CD;
		
		repeat(9) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[0] != 16'h2BCD;
		failures += RAM[1] != 16'h1023;
		failures += RAM[2] != 16'hFFFF;
		failures += RAM[3] != 16'h0001;
		failures += RAM[4] != 16'h7FFF;
		failures += RAM[5] != 16'hFFFF;
		if(failures == 0) $display("PASSED: Arithmatic & Logic");
		test_step = 4;

		repeat(10) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[0] != 16'h0101;
		failures += RAM[1] != 16'h0101;
		failures += RAM[2] != 16'h3312;
		failures += RAM[3] != 16'h3312;
		failures += RAM[4] != 16'h2312;
		failures += RAM[5] != 16'hABAB;
		if(failures == 0) $display("PASSED: Unconditional branches");
		test_step = 5;

		EF = 0;
		repeat(9) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		EF = 1;
		repeat(7) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		EF = 0;

		failures += RAM[0] != 16'h8201;
		failures += RAM[1] != 16'hA4CD;
		failures += RAM[2] != 16'h0011;
		failures += RAM[3] != 16'hABCD;
		if(failures == 0) $display("PASSED: Conditional branches");
		test_step = 6;
		
		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[0] != 16'h0000;
		failures += RAM[1] != 16'h0401;
		
		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[2] != 16'h0000;
		failures += RAM[3] != 16'h0007;
		
		repeat(5) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[4] != 16'b0000;
		failures += RAM[5] != 16'b1010;
		
		EF = 1;
		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		EF = 0;
		
		failures += RAM[4] != 16'b0000;
		failures += RAM[5] != 16'b1101;
		
		failures += CE != 1;
		@(posedge clock);
		while(M0 != 1) @(posedge clock);
		failures += CE != 0;
		@(posedge clock);
		while(M0 != 1) @(posedge clock);
		failures += CE != 1;
		
		@(posedge clock);
		while(M0 != 1) @(posedge clock);
		if(failures == 0) $display("PASSED: Misc. instructions");
		test_step = 7;

		repeat(4) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 0;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 0;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 0;
		repeat(16) @(posedge clock);
		failures += TX != 0;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 0;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		repeat(16) @(posedge clock);
		failures += TX != 1;
		while(CE == 1) @(posedge clock);
		while(M0 != 1) @(posedge clock);
		@(posedge clock);
		while(M0 != 1) @(posedge clock);
		failures += CE != 1;
		
		RX = 0;
		repeat(16) @(posedge clock);
		RX = 1;
		repeat(16) @(posedge clock);
		repeat(16) @(posedge clock);
		RX = 0;
		repeat(16) @(posedge clock);
		repeat(16) @(posedge clock);
		RX = 1;
		repeat(16) @(posedge clock);
		RX = 0;
		repeat(16) @(posedge clock);
		RX = 1;
		repeat(16) @(posedge clock);
		RX = 0;
		repeat(16) @(posedge clock);
		RX = 1;
		while(CE == 1) @(posedge clock);
		while(M0 != 1) @(posedge clock);
		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += CE != 1;
		failures += RAM[6] != 16'h0053;
		if(failures == 0) $display("PASSED: UART");
		test_step = 8;
		
		repeat(4) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end

		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 0;
		SDI = 1;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 1;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 0;
		SDI = 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 1;
		SDI = 1;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 0;
		SDI = 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 0;
		SDI = 1;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 1;
		SDI = 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		repeat(16) @(posedge clock);
		failures += SCLK != 1;
		failures += SDO != 1;
		repeat(16) @(posedge clock);
		failures += SCLK != 0;
		while(CE == 1) @(posedge clock);
		while(M0 != 1) @(posedge clock);

		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[7] != 16'h00D4;
		if(failures == 0) $display("PASSED: SPI");
		test_step = 9;
		
		repeat(3) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[8] != 16'h01F4;
		if(failures == 0) $display("PASSED: Multiplication");
		test_step = 10;
		
		repeat(6) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[ 9] != 16'h1D85;
		failures += RAM[10] != 16'h6BC2;
		failures += RAM[11] != 16'h9333;
		
		repeat(6) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[12] != 16'h0000;
		failures += RAM[13] != 16'h0003;
		
		repeat(6) begin
			@(posedge clock);
			while(M0 != 1) @(posedge clock);
		end
		
		failures += RAM[14] != 16'hA000;
		failures += RAM[15] != 16'h0000;
		
		if(failures == 0) $display("PASSED: Bitshifts");
		test_step = 11;

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
		.FILENAME("as512512512.hex")
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
