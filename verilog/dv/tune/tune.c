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

void main() {
	reg_wb_enable = 1;
	reg_mprj_io_11 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_32 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_33 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_34 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_35 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_36 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
	
	reg_mprj_xfer = 1;
	while(reg_mprj_xfer == 1);
	reg_mprj_wb = 0b10100011;
	reg_mprj_datah = 0b011111;
	reg_mprj_wb = 0b10100001;
	reg_mprj_counter = 0;
	while(reg_mprj_counter < 1000000);
	reg_mprj_datah = 0b011110;
	while(1);
}
