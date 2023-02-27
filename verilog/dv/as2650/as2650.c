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
	reg_mprj_wb = 0b01110011;
	while(1);
}

uint8_t test_step = 255;

void signal_progress() {
	test_step++;
	reg_mprj_datah = test_step;
}

#define clock() { reg_mprj_wb = 0b01111101; reg_mprj_wb = 0b01110101; }

#define addr ((reg_mprj_io >> 8) & 0x1FFF)
#define r_w ((reg_mprj_io >> 21) & 1)
#define opreq ((reg_mprj_io >> 22) & 1)
#define wrp ((reg_mprj_io >> 23) & 1)
#define m_io ((reg_mprj_io >> 24) & 1)
#define d_c ((reg_mprj_io >> 25) & 1)
#define flag ((reg_mprj_io >> 26) & 1)

#define d_out (reg_mprj_io & 0xFF)
#define d_in(data) reg_mprj_io = (data) & 0xFF

//Test that r_w = 0, opreq = 0, wrp = 0, addr = addr
#define check_read(addr) { uint32_t r = reg_mprj_io; if((r & ((1 << 21) | (1 << 23) | (1 << 22) | (0x1FFF << 8))) != ((1 << 22) | ((addr) << 8))) error_out(); }

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
	
	reg_mprj_wb = 0b01110111;
	reg_mprj_wb = 0b01111111;
	reg_mprj_wb = 0b01110111;
	reg_mprj_wb = 0b01111111;
	reg_mprj_wb = 0b01110111;
	reg_mprj_wb = 0b01111111;
	reg_mprj_wb = 0b01110101;
	reg_mprj_datah = 0b011111;

	//two times nop
	if(addr != 0 || opreq != 0) error_out();
	d_in(0xC0);
	clock();
	check_read(0);
	clock();
	if(opreq != 0) error_out();
	clock();
	if(opreq != 0) error_out();
	
	clock();
	check_read(1);
	clock();
	clock();
	if(opreq != 0 || r_w != 0 || addr != 1) error_out();
	signal_progress();
	
	//loda,r0
	d_in(0x0C);
	clock();
	check_read(2);
	clock();
	if(opreq != 0) error_out();
	clock();
	check_read(3);
	d_in(0x03);
	clock();
	check_read(4);
	d_in(0x01);
	clock();
	if(opreq != 1 || r_w != 0 || addr != 0x0301) error_out();
	d_in(0x05);
	clock();
	if(opreq != 0) error_out();
	clock();
	
	//lodi,r3 8
	d_in(0x07);
	clock();
	check_read(5);
	clock();
	if(opreq != 0) error_out();
	d_in(0x08);
	clock();
	check_read(6);
	clock();
	if(opreq != 0) error_out();
	clock();
	
	//addz,r3
	d_in(0x83);
	clock();
	check_read(7);
	clock();
	if(opreq != 0) error_out();
	clock();
	if(opreq != 0) error_out();
	clock();
	
	//strz,r2
	d_in(0xC2);
	clock();
	check_read(8);
	clock();
	if(opreq != 0) error_out();
	clock();
	
	//strr,r2
	d_in(0xCA);
	clock();
	check_read(9);
	clock();
	if(opreq != 0) error_out();
	d_in(0x0A);
	clock();
	check_read(10);
	clock();
	if(addr != 22 || r_w != 1 || opreq != 1 || wrp != 0 || d_out != 0x0D) error_out();
	clock();
	if(addr != 22 || r_w != 1 || opreq != 1 || wrp != 1 || d_out != 0x0D) error_out();
	clock();
	if(r_w != 0 || opreq != 0 || wrp != 0 || d_out != 0) error_out();
	signal_progress();
	
	//bcfa,0
	d_in(0x9C);
	clock();
	check_read(11);
	clock();
	if(opreq != 0) error_out();
	d_in(0x00);
	clock();
	check_read(12);
	clock();
	check_read(13);
	d_in(0xFF);
	clock();
	if(opreq != 0) error_out();
	
	//ppsu 0b01100000
	d_in(0x76);
	clock();
	check_read(0x00FF);
	clock();
	if(opreq != 0) error_out();
	clock();
	d_in(0b01100000);
	check_read(0x0100);
	if(flag != 0) error_out();
	clock();
	if(opreq != 0 || flag != 1) error_out();
	signal_progress();
	
	reg_mprj_wb = 0b01111111;
	reg_mprj_wb = 0b01110111;
	reg_mprj_wb = 0b01111111;
	reg_mprj_wb = 0b01110111;
	reg_mprj_datah = 0b011110;
	while(1);
}
