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
	reg_mprj_wb = 0b011;
	while(1);
}

#define mul_out ((reg_mprj_io >> 8) & 0xFF)

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
	
	reg_mprj_wb = 0b0000111;
	reg_mprj_wb = 0b0001111;
	reg_mprj_wb = 0b0000111;
	reg_mprj_wb = 0b0001111;
	reg_mprj_wb = 0b0000101;
	reg_mprj_datah = 0b011111;
	
	//0 * 0 = 0
	reg_mprj_io = 0;
	if(mul_out != 0) error_out();
	
	//1 * 1 = 1
	reg_mprj_io = 0b00010001;
	if(mul_out != 1) error_out();
	
	//3 * 3 = 9
	reg_mprj_io = 0b00110011;
	if(mul_out != 9) error_out();
	
	//10 * 4 = 40
	reg_mprj_io = 0b10100100;
	if(mul_out != 40) error_out();
	
	//8 * 9 = 72
	reg_mprj_io = 0b10001001;
	if(mul_out != 72) error_out();
	
	//15 * 15 = 225
	reg_mprj_io = 0b11111111;
	if(mul_out != 225) error_out();
	
	//15 * 0 = 0
	reg_mprj_io = 0b11110000;
	if(mul_out != 0) error_out();
	
	//0 * 15 = 0
	reg_mprj_io = 0b00001111;
	if(mul_out != 0) error_out();
	
	reg_mprj_datah = 0b011110;
	while(1);
}
