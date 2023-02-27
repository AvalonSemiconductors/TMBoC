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

#define clock() { reg_mprj_wb = 0b10111101; reg_mprj_wb = 0b10110101; }

void cmd(uint8_t cmd) {
	for(uint8_t i = 0; i < 8; i++) {
		uint8_t bit = ((cmd >> (7 - i)) & 1) << 2;
		reg_mprj_io = 0b01 | bit;
		reg_mprj_io = 0b11 | bit;
		reg_mprj_io = 0b01 | bit;
	}
}

uint16_t data(uint16_t data) {
	uint16_t dout = 0;
	for(uint8_t i = 0; i < 16; i++) {
		uint8_t bit = (uint8_t)(((data >> (15 - i)) & 1) << 2);
		reg_mprj_io = 0b01 | bit;
		reg_mprj_io = 0b11 | bit;
		reg_mprj_io = 0b01 | bit;
		dout <<= 1;
		dout |= (reg_mprj_io >> 3) & 1;
	}
	reg_mprj_io = 0b00;
	reg_mprj_io = 0b10;
	reg_mprj_io = 0b00;
	return dout;
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
	
	reg_mprj_wb = 0b10110111;
	reg_mprj_wb = 0b10111111;
	reg_mprj_wb = 0b10110111;
	reg_mprj_wb = 0b10111111;
	reg_mprj_wb = 0b10110111;
	reg_mprj_wb = 0b10111111;
	reg_mprj_wb = 0b10110001;
	reg_mprj_datah = 0b011111;

	cmd(0b00000010);
	data(0x5733);
	cmd(0b00000011);
	data(0x4723);
	
	uint16_t res = data(0);
	if(res != 0x57A5) error_out();
	signal_progress();
	
	cmd(0b01000010);
	data(0x3327);
	cmd(0b01000011);
	data(0x1709);
	
	res = data(0);
	if(res != 0x10B7) error_out();
	signal_progress();
	
	cmd(0b10000010);
	data(0x5733);
	cmd(0b10000011);
	data(0x4723);
	
	res = data(0);
	if(res != 0x5009) error_out();
	signal_progress();
	
	reg_mprj_wb = 0b10110011;
	reg_mprj_datah = 0b011110;
	while(1);
}
