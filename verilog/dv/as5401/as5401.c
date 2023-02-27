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
	test_step; reg_mprj_wb = 0b00010011;
	while(1);
}

#define clock() { reg_mprj_wb = 0b00011101; reg_mprj_wb = 0b00010101; }

#define get_cpu_outs() { uint32_t a = reg_mprj_io; data_out = a & 0b1111; data_byte = (a >> 10) & 0xFF; clock_state = (a >> 18) & 0b1111; f_write = (a >> 22) & 1; f_i = (a >> 23) & 1; f_mar = (a >> 24) & 1; f_jmp = (a >> 25) & 1; }

void main() {
	uint8_t data_out, data_byte, clock_state, f_write, f_i, f_mar, f_jmp;
	
	reg_wb_enable = 1;
	reg_mprj_io_32 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_33 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_34 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_35 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_36 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
	
	reg_mprj_xfer = 1;
	while(reg_mprj_xfer == 1);
	
	reg_mprj_datah = 0b011111;
	reg_mprj_wb = 0b00010111;
	reg_mprj_wb = 0b00011111;
	reg_mprj_wb = 0b00010111;
	reg_mprj_wb = 0b00011111;
	reg_mprj_wb = 0b00010111;
	reg_mprj_wb = 0b00010101;
	
	reg_mprj_io = 0b00100000; //SEI
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(f_i != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b00000000; //LD
	clock();
	reg_mprj_io = 0b01010000; //5
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(f_i == 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b00110000; //LML
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if((data_byte & 0b1111) != 5 || f_mar != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b11110000; //LMH
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(data_byte != 0x55 || f_mar != 1) error_out();
	signal_progress();
	
	reg_mprj_io = 0b10000011; //ADD 3
	clock();
	clock();
	clock();
	clock();
	signal_progress();
	
	reg_mprj_io = 0b00010000; //STR
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(data_out != 0b1000 || f_write != 1) error_out();
	signal_progress();
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(clock_state != 0b0001) error_out();
	clock();
	get_cpu_outs();
	if(clock_state != 0b0010) error_out();
	clock();
	get_cpu_outs();
	if(clock_state != 0b0100) error_out();
	clock();
	get_cpu_outs();
	if(clock_state != 0b1000) error_out();
	clock();
	get_cpu_outs();
	if(clock_state != 0b0001) error_out();
	signal_progress();
	
	reg_mprj_io = 0b01110000; //LDR
	clock();
	clock();
	clock();
	clock();
	reg_mprj_io = 0b01110000; //LDR
	clock();
	clock();
	clock();
	clock();
	reg_mprj_io = 0b01110000; //LDR
	clock();
	clock();
	clock();
	clock();
	reg_mprj_io = 0b01000000; //JMP
	clock();
	clock();
	clock();
	clock();
	get_cpu_outs();
	if(data_out != 0b1000 || data_byte != 0b10001000 || f_jmp != 1) error_out();
	signal_progress();
	clock();
	clock();
	clock();
	clock();
	clock();
	clock();
	clock();
	clock();

	reg_mprj_wb = 0b00010111;
	reg_mprj_wb = 0b00011111;
	reg_mprj_wb = 0b00010111;
	reg_mprj_wb = 0b00011111;
	reg_mprj_datah = 0b011110;
	while(1);
}
