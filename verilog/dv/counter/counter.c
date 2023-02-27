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

void error_out() {
	reg_mprj_datah = (1 << 5);
	reg_mprj_wb = 0b01010011;
	while(1);
}

#define clock() { reg_mprj_wb = 0b01011101; reg_mprj_wb = 0b01010101; }
#define disp_val (reg_mprj_io & 0x7F)
#define disp_sel ((reg_mprj_io >> 8) & 0b1111)
#define sel ((reg_mprj_io >> 7) & 1)

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
	
	reg_mprj_wb = 0b01010111;
	reg_mprj_wb = 0b01011111;
	reg_mprj_wb = 0b01010111;
	reg_mprj_wb = 0b01011111;
	reg_mprj_wb = 0b01010101;
	reg_mprj_datah = 0b011111;
	
	clock();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0001) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0010) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0100) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b1000) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0001) error_out();
	reg_mprj_counter = 0;
	reg_mprj_wb = 0b01010001;
	while(reg_mprj_counter < 5 * 1024 + 24);
	reg_mprj_wb = 0b01010101;
	while(!(disp_sel == 0b0001 && sel == 1)) clock();
	
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0001) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b1101101) error_out();
	if(disp_sel != 0b0010) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b0100) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 0) error_out();
	clock();
	clock();
	clock();
	clock();
	if(sel != 1) error_out();
	if(disp_val != 0b0111111) error_out();
	if(disp_sel != 0b1000) error_out();

	reg_mprj_wb = 0b01010111;
	reg_mprj_wb = 0b01011111;
	reg_mprj_wb = 0b01010111;
	reg_mprj_wb = 0b01011111;
	reg_mprj_datah = 0b011110;
	while(1);
}
