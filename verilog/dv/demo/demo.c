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

#define reg_spictrl (*(volatile uint32_t*)0x2d000000) 

uint32_t* mem_pgm_start = (uint32_t*)64;
void (*start_xfer)(void) = 64;

void halt() {
	reg_spictrl = 0;
}

void main() {
	reg_gpio_mode1 = 1;
	reg_gpio_mode0 = 0;
	reg_gpio_ien = 1;
	reg_gpio_oe = 1;
	reg_gpio_out = 0;

	reg_mprj_io_0 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_1 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_2 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_3 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_4 = GPIO_MODE_USER_STD_OUTPUT;
	reg_gpio_out = 1;
	
	//reg_mprj_xfer = 1;
	*mem_pgm_start = 0x260007b7;
	mem_pgm_start++;
	*mem_pgm_start = 0x00100713;
	mem_pgm_start++;
	*mem_pgm_start = 0x00e7a023;
	mem_pgm_start++;
	//reg_spictrl = 0;
	*mem_pgm_start = 0x2d0007b7;
	mem_pgm_start++;
	*mem_pgm_start = 0x0007a023;
	mem_pgm_start++;
	*mem_pgm_start = 0x00000013;
	mem_pgm_start++;
	//while(1);
	*mem_pgm_start = 0x0000006f;
	mem_pgm_start++;
	*mem_pgm_start = 0x0000006f;
	
	start_xfer();
	
	while(1);
}
