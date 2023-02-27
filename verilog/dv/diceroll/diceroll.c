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
	reg_mprj_wb = 0b00100011;
	while(1);
}

uint8_t test_step = 255;

void signal_progress() {
	test_step++;
	reg_mprj_datah = test_step;
}

#define clock() { reg_mprj_wb = 0b00101101; reg_mprj_wb = 0b00100101; }
#define disp_val ((reg_mprj_io >> 1) & 0xFF)

const uint8_t digits[] = {
	0b0111111,
	0b0000110,
	0b1011011,
	0b1001111,
	0b1100110,
	0b1101101,
	0b1111100,
	0b0000111
};

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
	
	reg_mprj_wb = 0b00100111;
	reg_mprj_wb = 0b00101111;
	reg_mprj_wb = 0b00100111;
	reg_mprj_wb = 0b00101111;
	reg_mprj_wb = 0b00100101;
	reg_mprj_datah = 0b011111;
	clock();
	clock();
	if(disp_val != digits[1] + 128) error_out();
	reg_mprj_io = 1;
	clock();
	clock();
	clock();
	clock();
	reg_mprj_io = 0;
	clock();
	clock();
	clock();
	clock();
	if((disp_val & 128) != 0) error_out();
	reg_mprj_wb = 0b00100001;
	while((disp_val & 128) == 0);
	reg_mprj_wb = 0b00100101;
	if(disp_val != digits[5] + 128) error_out();

	reg_mprj_io = 1;
	clock();
	clock();
	clock();
	clock();
	reg_mprj_io = 0;
	clock();
	clock();
	clock();
	clock();
	if((disp_val & 128) != 0) error_out();
	reg_mprj_wb = 0b00100001;
	uint8_t prev = disp_val;
	uint8_t hits = 0;
	uint8_t counter = 0;
	while((disp_val & 128) == 0) {
		if(counter == 24) continue;
		if(disp_val == prev) {
			hits++;
		}else counter++;
		prev = disp_val;
	}
	if(hits > 1) error_out();
	reg_mprj_wb = 0b00100101;
	//if(disp_val != digits[1] + 128) error_out
	
	reg_mprj_wb = 0b00100111;
	reg_mprj_wb = 0b00101111;
	reg_mprj_wb = 0b00100111;
	reg_mprj_wb = 0b00101111;
	reg_mprj_datah = 0b011110;
	while(1);
}
