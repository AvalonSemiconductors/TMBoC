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
#define reg_mprj_counter (*(volatile uint32_t*)0x30200000)

#define error_out { reg_mprj_datah = (1 << 5); reg_mprj_wb = 0b01100111; while(1); }
#define clock { reg_mprj_wb = 0b01101101; reg_mprj_wb = 0b01100101; }
#define sample_out ((reg_mprj_io >> 6) & 0b111111)
#define led0 ((reg_mprj_io >> 12) & 1)
#define led1 ((reg_mprj_io >> 13) & 1)

void write_to_addr(uint8_t addr, uint8_t val) {
	reg_mprj_io = 2 | (addr << 2);
	for(uint16_t i = 0; i < 1024; i++) clock
	reg_mprj_io = 3 | (val << 2);
	for(uint16_t i = 0; i < 1024; i++) clock
	reg_mprj_io = 1 | (val << 2);
	for(uint16_t i = 0; i < 512; i++) clock
	reg_mprj_io = 0;
	for(uint16_t i = 0; i < 512; i++) clock
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
	
	reg_mprj_wb = 0b01100011;
	reg_mprj_counter = 0;
	while(reg_mprj_counter < 64);
	reg_mprj_wb = 0b01100101;
	reg_mprj_datah = 0b011111;
	
	/*write_to_addr(4, 0);
	write_to_addr(5, 0);
	write_to_addr(6, 1);
	write_to_addr(15, 2);
	if(sample_out != 0b010000) error_out*/
		
	write_to_addr(1, 0b0010);
	write_to_addr(2, 0b0111);
	write_to_addr(3, 1);
	write_to_addr(15, 1);
	
	uint8_t curr_state;
	//for(uint8_t i = 0; i < 5; i++) {
		//curr_state = ((sample_out >> 4) & 1);
		reg_mprj_counter = 0;
		reg_mprj_wb = 0b01100001;
		while(reg_mprj_counter < 7 * 256);
		if(((sample_out >> 4) & 1) == curr_state) error_out
		//while(reg_mprj_counter < 14 * 256);
		//reg_mprj_wb = 0b01100101;
	//}

	reg_mprj_wb = 0b01100111;
	reg_mprj_wb = 0b01101111;
	reg_mprj_wb = 0b01100111;
	reg_mprj_wb = 0b01101111;
	reg_mprj_datah = 0b011110;
	while(1);
}
