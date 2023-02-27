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

uint8_t test_step = 255;

void signal_progress() {
		test_step++;
		reg_mprj_datah = test_step;
}

void error_out() {
	reg_mprj_datah = (1 << 5) | test_step;
	reg_mprj_wb = 0b01000011;
	while(1);
}

#define clock() { reg_mprj_wb = 0b01001101; reg_mprj_wb = 0b01000101; }

#define DOUT ((reg_mprj_io >> 4) & 1)
#define WRITE ((reg_mprj_io >> 6) & 1)
#define RR ((reg_mprj_io >> 7) & 1)
#define JMP ((reg_mprj_io >> 8) & 1)
#define RTN ((reg_mprj_io >> 9) & 1)
#define FLAG_O ((reg_mprj_io >> 10) & 1)
#define FLAG_F ((reg_mprj_io >> 11) & 1)

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
	
	reg_mprj_wb = 0b01001111;
	reg_mprj_wb = 0b01000111;
	reg_mprj_wb = 0b01001111;
	reg_mprj_wb = 0b01000111;
	reg_mprj_wb = 0b01001111;
	reg_mprj_wb = 0b01000101;
	reg_mprj_datah = 0b011111;

	reg_mprj_io = 0b11010; //IEN 1
	clock();
	reg_mprj_io = 0b11011; //OEN 1
	clock();
	
	reg_mprj_io = 0; //NOPO
	clock();
	if(FLAG_O != 1) error_out();
	if(FLAG_F != 0) error_out();
	reg_mprj_io = 0b1111; //NOPF
	clock();
	if(FLAG_O != 0) error_out();
	if(FLAG_F != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b00001; //LD 0
	clock();
	if(RR != 0) error_out();
	reg_mprj_io = 0b10001; //LD 1
	clock();
	if(RR != 1) error_out();
		
	reg_mprj_io = 0b00010; //LDC 0
	clock();
	if(RR != 1) error_out();
	reg_mprj_io = 0b10010; //LDC 1
	clock();
	if(RR != 0) error_out();
	signal_progress();
	
	reg_mprj_io = 0b10001; //LD 1
	clock();
	reg_mprj_io = 0b10011; //AND 1
	clock();
	if(RR != 1) error_out();
	reg_mprj_io = 0b10100; //ANDC 1
	clock();
	if(RR != 0) error_out();
	
	reg_mprj_io = 0b10101; //OR 1
	clock();
	if(RR != 1) error_out();
	reg_mprj_io = 0b10010; //LDC 1
	clock();
	reg_mprj_io = 0b10110; //ORC 1
	clock();
	if(RR != 0) error_out();
	reg_mprj_io = 0b00110; //ORC 0
	clock();
	if(RR != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b10111; //XNOR 1
	clock();
	if(RR != 1) error_out();
	reg_mprj_io = 0b00111; //XNOR 0
	clock();
	if(RR != 0) error_out();
	reg_mprj_io = 0b00111; //XNOR 0
	clock();
	if(RR != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b1000; //STO
	reg_mprj_wb = 0b01001101;
	if(WRITE != 1) error_out();
	if(DOUT != 1) error_out();
	reg_mprj_wb = 0b01000101;
	reg_mprj_io = 0b1001; //STOC
	reg_mprj_wb = 0b01001101;
	if(WRITE != 1) error_out();
	if(DOUT != 0) error_out();
	reg_mprj_wb = 0b01000101;
	signal_progress();
	
	reg_mprj_io = 0b1100; //JMP
	clock();
	if(JMP != 1) error_out();
	reg_mprj_io = 0b1101; //RTN
	clock();
	if(RTN != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b00001; //LD 0
	clock();
	reg_mprj_io = 0b1110; //SKZ
	clock();
	reg_mprj_io = 0b1100; //JMP (but should be skipped)
	clock();
	if(JMP != 0) error_out();
	
	reg_mprj_io = 0b10001; //LD 1
	clock();
	reg_mprj_io = 0b1110; //SKZ
	clock();
	reg_mprj_io = 0b00001; //LD 0
	clock();
	reg_mprj_io = 0b1000; //STO
	reg_mprj_wb = 0b01001101;
	if(WRITE != 1) error_out();
	if(DOUT != 0) error_out();
	reg_mprj_wb = 0b01000101;
	signal_progress();
	
	reg_mprj_io = 0b01010; //IEN 0
	clock();
	reg_mprj_io = 0b10001; //LD 1
	clock();
	if(RR != 0) error_out();
	
	reg_mprj_io = 0b00111; //XNOR 0
	clock();
	if(RR != 1) error_out();
	reg_mprj_io = 0b01011; //OEN 0
	clock();
	reg_mprj_io = 0b1000; //STO
	clock();
	if(WRITE != 0) error_out();
	signal_progress();
	
	reg_mprj_wb = 0b01001111;
	reg_mprj_wb = 0b01000111;
	reg_mprj_wb = 0b01001111;
	reg_mprj_wb = 0b01000111;
	reg_mprj_datah = 0b011110;
	while(1);
}
