/*
* SPDX-FileCopyrightText: 2023 Tholin
*
* Licensed under the Apache License, Version 2.0 (the "License");
* you may not use this file except in compliance with the License.
* You may obtain a copy of the License at
*
*      http://www.apache.org/licenses/LICENSE-2.0
*
* Unless required by applicable law or agreed to in writing, software
* distributed under the License is distributed on an "AS IS" BASIS,
* WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
* See the License for the specific language governing permissions and
* limitations under the License.
* SPDX-License-Identifier: Apache-2.0
*/

// This include is relative to $CARAVEL_PATH (see Makefile)
#include <defs.h>
#include <stub.c>

#define reg_mprj_wb (*(volatile uint32_t*)0x30800000)
#define reg_mprj_io (*(volatile uint32_t*)0x30400000)

void error_out() {
	reg_mprj_datah = (1 << 5);
	reg_mprj_wb = 0b10010011;
	while(1);
}

uint8_t test_step = 255;

void signal_progress() {
	test_step++;
	reg_mprj_datah = test_step;
}

#define clock() { reg_mprj_wb = 0b10011101; reg_mprj_wb = 0b10010101; }

#define d_in(data) reg_mprj_io = (data) & 0xFF

void check_cpu_outs(uint8_t dout, uint8_t addr, uint8_t Q, uint8_t TPA, uint8_t MRD, uint8_t MWR, uint8_t SC0, uint8_t SC1) {
	uint32_t cpu_outs = reg_mprj_io;
	if(dout != 255 && dout != (cpu_outs & 0xFF)) error_out();
	if(addr != ((cpu_outs >> 13) & 0xFF)) error_out();
	if(((cpu_outs >> 21) & 0b111111) != (Q | (MRD << 1) | (MWR << 2) | (TPA << 3) | (SC0 << 4) | (SC1 << 5))) error_out();
}

void test_long_fetch(uint8_t prev_lo_addr, uint16_t addr) {
	clock();
	check_cpu_outs(255, prev_lo_addr, 0, 0, 1, 1, 0, 0);
	clock();
	check_cpu_outs(255, addr >> 8, 0, 1, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, addr >> 8, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, addr & 0xFF, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, addr & 0xFF, 0, 0, 1, 1, 1, 0);
}

void test_read_cycle(uint8_t prev_lo_addr, uint16_t addr, uint8_t data) {
	check_cpu_outs(255, prev_lo_addr, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, addr >> 8, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, addr >> 8, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, addr & 0xFF, 0, 0, 0, 1, 1, 0);
	d_in(data);
	clock();
	check_cpu_outs(255, addr & 0xFF, 0, 0, 1, 1, 1, 0);
}

void ins_fetch() {
	reg_mprj_wb = 0b10011101;
	reg_mprj_wb = 0b10010101;
	reg_mprj_wb = 0b10011101;
	reg_mprj_wb = 0b10010101;
	reg_mprj_wb = 0b10011101;
	reg_mprj_wb = 0b10010101;
	reg_mprj_wb = 0b10011101;
	reg_mprj_wb = 0b10010101;
}

void main() {
	reg_wb_enable = 1;
	reg_mprj_io_32 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_33 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_34 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_35 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_36 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
	
	reg_mprj_xfer = 1;
	while(reg_mprj_xfer == 1);
	
	reg_mprj_wb = 0b10010111;
	reg_mprj_wb = 0b10011111;
	reg_mprj_wb = 0b10010111;
	reg_mprj_wb = 0b10011111;
	reg_mprj_wb = 0b10010111;
	reg_mprj_wb = 0b10011111;
	reg_mprj_wb = 0b10010101;
	reg_mprj_datah = 0b011111;

	//Initial instruction fetch timing
	d_in(0xC4);
	test_long_fetch(0, 0);
	clock();
	
	//Subsequent instruction fetch timing
	clock();
	check_cpu_outs(255, 0, 0, 0, 1, 1, 0, 0);
	clock();
	check_cpu_outs(255, 1, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 1, 0, 0, 1, 1, 1, 0);
	clock();
	signal_progress();
	
	//LDI
	d_in(0xF8);
	ins_fetch();
	check_cpu_outs(255, 2, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 3, 0, 0, 0, 1, 1, 0);
	d_in(0x10);
	clock();
	check_cpu_outs(255, 3, 0, 0, 1, 1, 1, 0);
	
	//PLO R3
	d_in(0xA3);
	ins_fetch();
	check_cpu_outs(255, 4, 0, 0, 1, 1, 1, 0);
	
	//ADI 5
	d_in(0xFC);
	ins_fetch();
	clock();
	d_in(0x05);
	clock();
	clock();
	check_cpu_outs(255, 6, 0, 0, 1, 1, 1, 0);
	
	//PHI R3
	d_in(0xB3);
	ins_fetch();
	check_cpu_outs(255, 7, 0, 0, 1, 1, 1, 0);
	
	//PLO R5
	d_in(0xA5);
	ins_fetch();
	check_cpu_outs(255, 8, 0, 0, 1, 1, 1, 0);
	
	//PHI R5
	d_in(0xB5);
	ins_fetch();
	check_cpu_outs(255, 9, 0, 0, 1, 1, 1, 0);
	
	//INC R5
	d_in(0x15);
	ins_fetch();
	check_cpu_outs(255, 10, 0, 0, 1, 1, 1, 0);
	
	//LDN R3
	d_in(0x03);
	ins_fetch();
	test_read_cycle(11, 0x1510, 69);
	
	//STR R5
	d_in(0x55);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 1, 1, 0, 0);
	clock();
	check_cpu_outs(255, 0, 0, 1, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 0, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 12, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 12, 0, 0, 1, 1, 1, 0);
	clock();
	
	//Write cycle timing
	clock();
	check_cpu_outs(255, 0x15, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x15, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(69, 0x16, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 1, 1, 1, 0);
	
	//GHI R3
	d_in(0x93);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 1, 1, 0, 0);
	clock();
	check_cpu_outs(255, 0, 0, 1, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 0, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 13, 0, 0, 0, 1, 0, 0);
	clock();
	check_cpu_outs(255, 13, 0, 0, 1, 1, 1, 0);
	clock();
	
	//PLO R10
	d_in(0xAA);
	ins_fetch();
	check_cpu_outs(255, 14, 0, 0, 1, 1, 1, 0);
	
	//GLO R3
	d_in(0x83);
	ins_fetch();
	check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
	
	//PHI R10
	d_in(0xBA);
	ins_fetch();
	check_cpu_outs(255, 16, 0, 0, 1, 1, 1, 0);
	
	//STR R10
	d_in(0x5A);
	ins_fetch();
	check_cpu_outs(255, 17, 0, 0, 1, 1, 1, 0);
	
	//Write cycle timing
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x15, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0x10, 0x15, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x15, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//SEX R10
	d_in(0xEA);
	test_long_fetch(0x15, 18);
	clock();
	
	//IRX
	d_in(0x60);
	ins_fetch();
	
	//LDXA
	d_in(0x72);
	ins_fetch();
	test_read_cycle(20, 0x1016, 0x22);
	
	//STXD
	d_in(0x73);
	test_long_fetch(0x16, 21);
	clock();
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x17, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0x22, 0x17, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x17, 0, 0, 1, 1, 1, 0);
	
	//LDX
	d_in(0xF0);
	test_long_fetch(0x17, 22);
	clock();
	test_read_cycle(22, 0x1016, 0x24);
	
	//STR R10
	d_in(0x5A);
	test_long_fetch(0x16, 23);
	
	//Write cycle timing
	clock();
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0x24, 0x16, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//OR
	d_in(0xF1);
	test_long_fetch(0x16, 24);
	clock();
	test_read_cycle(24, 0x1016, 1);
	clock();
	//0x24 -> 0x25
	
	//SMI
	d_in(0xFF);
	test_long_fetch(0x16, 25);
	clock();
	clock();
	check_cpu_outs(255, 26, 0, 0, 0, 1, 1, 0);
	d_in(0x10);
	clock();
	check_cpu_outs(255, 26, 0, 0, 1, 1, 1, 0);
	clock();
	//0x25 -> 0x15
	
	//SHL
	d_in(0xFE);
	ins_fetch();
	check_cpu_outs(255, 27, 0, 0, 1, 1, 1, 0);
	//0x15 -> 0x2A
	
	//SD
	d_in(0xF5);
	ins_fetch();
	test_read_cycle(28, 0x1016, 255);
	clock();
	//0x2A -> 0xD5
	
	//STXD
	d_in(0x73);
	test_long_fetch(0x16, 29);
	clock();
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0xD5, 0x16, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x16, 0, 0, 1, 1, 1, 0);
	
	//ADI 255
	d_in(0xFC);
	test_long_fetch(0x16, 30);
	clock();
	clock();
	check_cpu_outs(255, 31, 0, 0, 0, 1, 1, 0);
	d_in(0xFF);
	clock();
	check_cpu_outs(255, 31, 0, 0, 1, 1, 1, 0);
	clock();
	//0xD5 -> 0xD4 and DF becomes 1
	
	//ADCI 5
	d_in(0x7C);
	ins_fetch();
	check_cpu_outs(255, 32, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 33, 0, 0, 0, 1, 1, 0);
	d_in(0x05);
	clock();
	check_cpu_outs(255, 33, 0, 0, 1, 1, 1, 0);
	clock();
	//0xD4 -> 0xDA and DF becomes 0
	
	//STXD
	d_in(0x73);
	ins_fetch();
	check_cpu_outs(255, 34, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x15, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0xDA, 0x15, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x15, 0, 0, 1, 1, 1, 0);
	
	//SHR
	d_in(0xF6);
	test_long_fetch(0x15, 35);
	clock();
	//0xDA -> 0x6D
	
	//SHR
	d_in(0xF6);
	ins_fetch();
	check_cpu_outs(255, 36, 0, 0, 1, 1, 1, 0);
	//0x6D -> 0x36 and DF becomes 1

	//RSHR
	d_in(0x76);
	ins_fetch();
	check_cpu_outs(255, 37, 0, 0, 1, 1, 1, 0);
	//0x36 -> 0x9B and DF becomes 0
	
	//STR R10
	d_in(0x5A);
	ins_fetch();
	check_cpu_outs(255, 38, 0, 0, 1, 1, 1, 0);
	
	//Write cycle timing
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x14, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0x9B, 0x14, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x14, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//SEP R5
	d_in(0xD5);
	test_long_fetch(0x14, 39);
	clock();
	
	//NOP
	d_in(0xC4);
	test_long_fetch(39, 0x1516);
	clock();
	
	//BR
	d_in(0x30);
	ins_fetch();
	check_cpu_outs(255, 23, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 24, 0, 0, 0, 1, 1, 0);
	d_in(66);
	clock();
	check_cpu_outs(255, 24, 0, 0, 1, 1, 1, 0);
	clock();
	
	//NOP
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 66, 0, 0, 1, 1, 1, 0);
	clock();
	
	//LBR
	d_in(0xC0);
	clock();
	clock();
	clock();
	check_cpu_outs(255, 67, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 68, 0, 0, 0, 1, 1, 0);
	d_in(8);
	clock();
	check_cpu_outs(255, 68, 0, 0, 1, 1, 1, 0);
	clock();
	
	clock();
	check_cpu_outs(255, 69, 0, 0, 0, 1, 1, 0);
	d_in(9);
	clock();
	check_cpu_outs(255, 69, 0, 0, 1, 1, 1, 0);
	clock();
	
	//NOP
	d_in(0xC4);
	test_long_fetch(69, 0x0809);
	clock();
	
	//BZ
	d_in(0x32);
	ins_fetch();
	check_cpu_outs(255, 10, 0, 0, 1, 1, 1, 0);
	
	//LDI 0
	d_in(0xF8);
	ins_fetch();
	check_cpu_outs(255, 12, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 13, 0, 0, 0, 1, 1, 0);
	d_in(0);
	clock();
	check_cpu_outs(255, 13, 0, 0, 1, 1, 1, 0);
	clock();
	
	//LBZ
	d_in(0xC2);
	clock();
	clock();
	clock();
	check_cpu_outs(255, 14, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 15, 0, 0, 0, 1, 1, 0);
	d_in(0x22);
	clock();
	check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
	clock();
	
	clock();
	check_cpu_outs(255, 16, 0, 0, 0, 1, 1, 0);
	d_in(0);
	clock();
	check_cpu_outs(255, 16, 0, 0, 1, 1, 1, 0);
	clock();
	
	//SMI 5
	d_in(0xFF);
	test_long_fetch(16, 0x2200);
	clock();
	clock();
	check_cpu_outs(255, 1, 0, 0, 0, 1, 1, 0);
	d_in(0x05);
	clock();
	check_cpu_outs(255, 1, 0, 0, 1, 1, 1, 0);
	clock();
	
	//BDF
	d_in(0x33);
	ins_fetch();
	check_cpu_outs(255, 2, 0, 0, 1, 1, 1, 0);
	
	//SMI 5
	d_in(0xFF);
	ins_fetch();
	check_cpu_outs(255, 4, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 5, 0, 0, 0, 1, 1, 0);
	d_in(0x05);
	clock();
	check_cpu_outs(255, 5, 0, 0, 1, 1, 1, 0);
	clock();
	
	//BDF
	d_in(0x33);
	ins_fetch();
	check_cpu_outs(255, 6, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 7, 0, 0, 0, 1, 1, 0);
	d_in(15);
	clock();
	check_cpu_outs(255, 7, 0, 0, 1, 1, 1, 0);
	clock();
	
	//B1
	reg_mprj_io = 0x34 | (1 << 9);
	ins_fetch();
	check_cpu_outs(255, 15, 0, 0, 1, 1, 1, 0);
	
	//BN3
	reg_mprj_io = 0x3E | (1 << 11);
	ins_fetch();
	check_cpu_outs(255, 17, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 18, 0, 0, 0, 1, 1, 0);
	d_in(100);
	clock();
	check_cpu_outs(255, 18, 0, 0, 1, 1, 1, 0);
	clock();
	
	//B2
	d_in(0x35);
	ins_fetch();
	check_cpu_outs(255, 100, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 101, 0, 0, 0, 1, 1, 0);
	d_in(200);
	clock();
	check_cpu_outs(255, 101, 0, 0, 1, 1, 1, 0);
	clock();
	
	//BN3
	d_in(0x3F);
	ins_fetch();
	check_cpu_outs(255, 200, 0, 0, 1, 1, 1, 0);
	
	//NOP
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 202, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//SKP
	d_in(0x38);
	ins_fetch();
	check_cpu_outs(255, 203, 0, 0, 1, 1, 1, 0);
	
	//ADI 1
	d_in(0xFC);
	ins_fetch();
	check_cpu_outs(255, 205, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 206, 0, 0, 0, 1, 1, 0);
	d_in(1);
	clock();
	check_cpu_outs(255, 206, 0, 0, 1, 1, 1, 0);
	clock();
	
	//LSDF
	d_in(0xCF);
	ins_fetch();
	check_cpu_outs(255, 207, 0, 0, 1, 1, 1, 0);
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 208, 0, 0, 1, 1, 1, 0);
	ins_fetch();
	check_cpu_outs(255, 209, 0, 0, 1, 1, 1, 0);
	
	//LDI 0
	d_in(0xF8);
	ins_fetch();
	check_cpu_outs(255, 210, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 211, 0, 0, 0, 1, 1, 0);
	d_in(0);
	clock();
	check_cpu_outs(255, 211, 0, 0, 1, 1, 1, 0);
	
	//LSZ
	d_in(0xCE);
	ins_fetch();
	check_cpu_outs(255, 212, 0, 0, 1, 1, 1, 0);
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 215, 0, 0, 1, 1, 1, 0);
	ins_fetch();
	check_cpu_outs(255, 216, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//SEQ
	d_in(0x7B);
	ins_fetch();
	check_cpu_outs(255, 217, 1, 0, 1, 1, 1, 0);
	
	//REQ
	d_in(0x7A);
	ins_fetch();
	check_cpu_outs(255, 218, 0, 0, 1, 1, 1, 0);
	
	//LDI 0x55
	d_in(0xF8);
	ins_fetch();
	check_cpu_outs(255, 219, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 220, 0, 0, 0, 1, 1, 0);
	d_in(0x55);
	clock();
	check_cpu_outs(255, 220, 0, 0, 1, 1, 1, 0);
	
	//PHI R1
	d_in(0xB1);
	ins_fetch();
	check_cpu_outs(255, 221, 0, 0, 1, 1, 1, 0);
	
	//PLO R1
	d_in(0xA1);
	ins_fetch();
	check_cpu_outs(255, 222, 0, 0, 1, 1, 1, 0);
	
	//LDI 0x11
	d_in(0xF8);
	ins_fetch();
	check_cpu_outs(255, 223, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 224, 0, 0, 0, 1, 1, 0);
	d_in(0x11);
	clock();
	check_cpu_outs(255, 224, 0, 0, 1, 1, 1, 0);
	
	//PHI R2
	d_in(0xB2);
	ins_fetch();
	check_cpu_outs(255, 225, 0, 0, 1, 1, 1, 0);
	
	//PLO R2
	d_in(0xA2);
	ins_fetch();
	check_cpu_outs(255, 226, 0, 0, 1, 1, 1, 0);
	
	//IDL
	d_in(0x00);
	ins_fetch();
	check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 0);
	ins_fetch();
	check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 0);
	signal_progress();
	
	//Send interrupt
	reg_mprj_io = 1 << 8;
	clock();
	clock();
	check_cpu_outs(255, 227, 0, 0, 1, 1, 1, 1);
	
	//STXD to test P and X
	d_in(0x73);
	test_long_fetch(227, 0x5555);
	clock();
	clock();
	check_cpu_outs(255, 0x11, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0x11, 0x11, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 0, 1, 1, 1, 0);
	
	//SAV
	d_in(0x78);
	test_long_fetch(0x11, 0x5556);
	clock();
	clock();
	check_cpu_outs(255, 0x11, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(0xA5, 0x10, 0, 0, 0, 0, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 1, 1, 1, 0);
	
	//LSIE
	d_in(0xCC);
	test_long_fetch(0x10, 0x5557);
	clock();
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 0x58, 0, 0, 1, 1, 1, 0);
	ins_fetch();
	check_cpu_outs(255, 0x59, 0, 0, 1, 1, 1, 0);
	
	//RET
	d_in(0x70);
	ins_fetch();
	check_cpu_outs(255, 0x5A, 0, 0, 1, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x11, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	d_in(0xA5);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 1, 1, 1, 0);
	clock();
	
	//LDX to test return from interrupt
	d_in(0xF0);
	test_long_fetch(0x10, 0x2200 + 228);
	clock();
	clock();
	check_cpu_outs(255, 0x10, 0, 1, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x10, 0, 0, 0, 1, 1, 0);
	clock();
	check_cpu_outs(255, 0x14, 0, 0, 0, 1, 1, 0);
	d_in(69);
	clock();
	check_cpu_outs(255, 0x14, 0, 0, 1, 1, 1, 0);
	
	//LSIE
	d_in(0xCC);
	test_long_fetch(0x14, 0x2200 + 229);
	clock();
	d_in(0xC4);
	ins_fetch();
	check_cpu_outs(255, 232, 0, 0, 1, 1, 1, 0);
	signal_progress();

	reg_mprj_wb = 0b10011111;
	reg_mprj_wb = 0b10010111;
	reg_mprj_wb = 0b10011111;
	reg_mprj_wb = 0b10010111;
	reg_mprj_datah = 0b011110;
	while(1);
}
