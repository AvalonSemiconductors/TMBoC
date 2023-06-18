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

void main() {
	reg_wb_enable = 0;
	reg_gpio_mode1 = 1;
	reg_gpio_mode0 = 0;
	reg_gpio_ien = 1;
	reg_gpio_oe = 1;
	reg_gpio_out = 0;
	
	reg_mprj_io_5 = GPIO_MODE_USER_STD_INPUT_PULLUP;
	reg_mprj_io_6 = GPIO_MODE_USER_STD_INPUT_PULLUP;
	reg_mprj_io_7 = GPIO_MODE_USER_STD_INPUT_PULLUP;
	reg_mprj_io_8 = GPIO_MODE_USER_STD_INPUT_PULLUP;
	reg_mprj_io_9 = GPIO_MODE_USER_STD_INPUT_PULLDOWN;
	reg_mprj_io_10 = GPIO_MODE_USER_STD_INPUT_PULLDOWN;
	reg_mprj_io_11 = GPIO_MODE_USER_STD_INPUT_PULLDOWN;
	reg_mprj_io_12 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_13 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_14 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_15 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_16 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_17 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_18 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_19 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_20 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_21 = GPIO_MODE_USER_STD_OUTPUT;
	reg_mprj_io_27 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_io_37 = GPIO_MODE_MGMT_STD_OUTPUT;
	reg_mprj_xfer = 1;
	while(reg_mprj_xfer == 1);
	reg_mprj_datal = 1 << 27;
	
	reg_mprj_datah = 0;
	reg_mprj_datah = 1 << 5;
	reg_mprj_datah = 0;
	reg_mprj_datah = 1 << 5;
	reg_gpio_out = 1;
	while(1);
}