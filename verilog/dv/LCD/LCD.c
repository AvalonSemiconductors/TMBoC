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

#define signal_progress { test_step++; reg_mprj_datah = test_step; }
#define error_out { reg_mprj_datah = (1 << 5); reg_mprj_wb = 0b00110011; while(1); }
#define clock { reg_mprj_wb = 0b00111101; reg_mprj_wb = 0b00110101; }
#define disp_val (reg_mprj_io & 0xFF)

uint8_t test_lcd_data(uint8_t RS, uint8_t dout) {
	clock
	uint32_t a = disp_val;
	if((a & 1) != RS) return 1;
	if(((a >> 1) & 1) != 0) return 1;
	if(((a >> 2) & 0b1111) != dout) return 1;
	clock
	a = disp_val;
	if((a & 1) != RS) return 1;
	if(((a >> 1) & 1) == 0) return 1;
	if(((a >> 2) & 0b1111) != dout) return 1;
	if(((a >> 7) & 1) != (dout & 1)) return 1;
	return 0;
}

uint8_t test_lcd_string(char *str, uint8_t len) {
	for(uint8_t i = 0; i < len; i++) {
		uint8_t c = (uint8_t)str[i];
		if(test_lcd_data(1, c >> 4)) return 1;
		if(test_lcd_data(1, c & 15)) return 1;
	}
	return 0;
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
	
	reg_mprj_wb = 0b00110111;
	reg_mprj_wb = 0b00111111;
	reg_mprj_wb = 0b00110111;
	reg_mprj_wb = 0b00111111;
	reg_mprj_wb = 0b00110101;
	reg_mprj_datah = 0b011111;
	reg_mprj_io = 0b101 << 8;
	uint8_t test_step = 255;
	clock

	if(test_lcd_data(0, 0b0011)) error_out
	if(test_lcd_data(0, 0b0010)) error_out
	if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1111)) error_out
	if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b0001)) error_out
	if(((disp_val >> 6) & 1) != 0) error_out

	clock
	clock
	clock
	clock
	if(test_lcd_string("Hi, I'm Tholin :3", 17)) error_out
	if(((disp_val >> 6) & 1) != 0) error_out
	signal_progress

	for(uint8_t i = 0; i < 11; i++) {
		if(test_lcd_data(0, 0b1101)) error_out
		if(test_lcd_data(0, 0b0100)) error_out
	}
	if(test_lcd_string("www.tholin.dev   ", 17)) error_out
	if(test_lcd_data(1, 0b0011)) error_out
	if(test_lcd_data(1, 0)) error_out
	if(test_lcd_data(1, 0b0011)) error_out
	if(test_lcd_data(1, 1)) error_out
	if(((disp_val >> 6) & 1) != 0) error_out
	signal_progress

	if(test_lcd_data(0, 0b0011)) error_out
	
	for(uint16_t i = 0; i < 308; i++) clock

	if(test_lcd_data(0, 0b0010)) error_out
	if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1111)) error_out
	if(test_lcd_data(0, 0b1100)) error_out
	if(test_lcd_data(0, 0b0111)) error_out

	if(test_lcd_string("Avali", 5)) error_out
	if(((disp_val >> 6) & 1) != 1) error_out
	signal_progress

	for(uint8_t i = 0; i < 28; i++) if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1001)) error_out
	if(((disp_val >> 7) & 1) != 1) error_out
	if(test_lcd_data(0, 0b1000)) error_out
	if(test_lcd_data(0, 0b1001)) error_out
	if(((disp_val >> 7) & 1) != 1) error_out
	if(test_lcd_data(0, 0b1000)) error_out

	if(test_lcd_string("Software Dev", 12)) error_out
	for(uint8_t i = 0; i < 28; i++) if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1100)) error_out
	if(test_lcd_data(0, 0b0100)) error_out
	if(test_lcd_data(0, 0b1100)) error_out
	if(test_lcd_data(0, 0b0100)) error_out
	signal_progress

	if(test_lcd_string("Hardware Dev", 12)) error_out
	if(((disp_val >> 6) & 1) != 1) error_out
	for(uint8_t i = 0; i < 28; i++) if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1001)) error_out
	if(test_lcd_data(0, 0b0110)) error_out
	if(test_lcd_data(0, 0b1001)) error_out
	if(test_lcd_data(0, 0b0110)) error_out
	signal_progress

	if(test_lcd_string("VRC World Maker", 15)) error_out
	if(((disp_val >> 6) & 1) != 1) error_out
	for(uint8_t i = 0; i < 66; i++) if(test_lcd_data(0, 0b0011)) error_out
	signal_progress

	if(test_lcd_data(0, 0b0011)) error_out
	if(test_lcd_data(0, 0b0010)) error_out
	if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b1111)) error_out
	if(test_lcd_data(0, 0b0000)) error_out
	if(test_lcd_data(0, 0b0001)) error_out

	reg_mprj_wb = 0b00110111;
	reg_mprj_wb = 0b00111111;
	reg_mprj_wb = 0b00110111;
	reg_mprj_wb = 0b00111111;
	reg_mprj_datah = 0b011110;
	while(1);
}
