// SPDX-FileCopyrightText: 2023 Tholin
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none
/*
*-------------------------------------------------------------
*
* user_project_wrapper
*
* This wrapper enumerates all of the pins available to the
* user for the user project.
*
* An example user project is provided in this wrapper.  The
* example should be removed and replaced with the actual
* user project.
*
*-------------------------------------------------------------
*/

module user_project_wrapper #(
	parameter BITS = 32
) (
`ifdef USE_POWER_PINS
	inout vdda1,	// User area 1 3.3V supply
	inout vdda2,	// User area 2 3.3V supply
	inout vssa1,	// User area 1 analog ground
	inout vssa2,	// User area 2 analog ground
	inout vccd1,	// User area 1 1.8V supply
	inout vccd2,	// User area 2 1.8v supply
	inout vssd1,	// User area 1 digital ground
	inout vssd2,	// User area 2 digital ground
`endif

	// Wishbone Slave ports (WB MI A)
	input wb_clk_i,
	input wb_rst_i,
	input wbs_stb_i,
	input wbs_cyc_i,
	input wbs_we_i,
	input [3:0] wbs_sel_i,
	input [31:0] wbs_dat_i,
	input [31:0] wbs_adr_i,
	output wbs_ack_o,
	output [31:0] wbs_dat_o,

	// Logic Analyzer Signals
	input  [127:0] la_data_in,
	output [127:0] la_data_out,
	input  [127:0] la_oenb,

	// IOs
	input  [`MPRJ_IO_PADS-1:0] io_in,
	output [`MPRJ_IO_PADS-1:0] io_out,
	output [`MPRJ_IO_PADS-1:0] io_oeb,

	// Analog (direct connection to GPIO pad---use with caution)
	// Note that analog I/O is not available on the 7 lowest-numbered
	// GPIO pads, and so the analog_io indexing is offset from the
	// GPIO indexing by 7 (also upper 2 GPIOs do not have analog_io).
	inout [`MPRJ_IO_PADS-10:0] analog_io,

	// Independent clock (on independent integer divider)
	input   user_clock2,

	// User maskable interrupt signals
	output [2:0] user_irq
);

wire [27:0] dsi_all;

wire [7:0] dso_multiplier;

wire [26:0] dso_as5401;
wire oeb_as5401;
wire rst_as5401;

wire [7:0] dso_diceroll;
wire rst_diceroll;

wire [7:0] dso_LCD;
wire rst_LCD;

wire [8:0] dso_mc14500;
wire oeb_mc14500;
wire rst_mc14500;

wire [11:0] dso_counter;
wire rst_counter;

wire [7:0] dso_tbb1143;
wire rst_tbb1143;

wire [26:0] dso_as2650;
wire oeb_as2650;
wire rst_as2650;

wire [26:0] dso_6502;
wire oeb_6502;
wire rst_6502;

wire [26:0] dso_as1802;
wire oeb_as1802;
wire rst_as1802;

wire dso_tune;
wire rst_tune;

wire [3:0] dso_posit;
wire rst_posit;

wire [27:0] dso_as512512512;
wire oeb_as512512512;
wire rst_as512512512;

wire [9:0] dso_vgatest;
wire rst_vgatest;

wire design_clk;

multiplexer proj_multiplexer(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.io_in(io_in),
	.io_out(io_out),
	.io_oeb(io_oeb),
	.wb_clk_i(wb_clk_i),
	.wb_rst_i(wb_rst_i),
	.wbs_adr_i(wbs_adr_i),
	.wbs_dat_i(wbs_dat_i),
	.wbs_dat_o(wbs_dat_o),
	.wbs_we_i(wbs_we_i),
	.wbs_cyc_i(wbs_cyc_i),
	.wbs_stb_i(wbs_stb_i),
	.wbs_ack_o(wbs_ack_o),
	
	.dsi_all(dsi_all),
	
	.dso_multiplier(dso_multiplier),
	
	.dso_as5401(dso_as5401),
	.oeb_as5401(oeb_as5401),
	.rst_as5401(rst_as5401),
	
	.dso_diceroll(dso_diceroll),
	.rst_diceroll(rst_diceroll),
	
	.dso_LCD(dso_LCD),
	.rst_LCD(rst_LCD),
	
	.dso_mc14500(dso_mc14500),
	.oeb_mc14500(oeb_mc14500),
	.rst_mc14500(rst_mc14500),
	
	.dso_counter(dso_counter),
	.rst_counter(rst_counter),
	
	.dso_tbb1143(dso_tbb1143),
	.rst_tbb1143(rst_tbb1143),
	
	.dso_as2650(dso_as2650),
	.oeb_as2650(oeb_as2650),
	.rst_as2650(rst_as2650),
	
	.dso_6502(dso_6502),
	.oeb_6502(oeb_6502),
	.rst_6502(rst_6502),
	
	.dso_as1802(dso_as1802),
	.oeb_as1802(oeb_as1802),
	.rst_as1802(rst_as1802),
	
	.dso_tune(dso_tune),
	.rst_tune(rst_tune),
	
	.dso_posit(dso_posit),
	.rst_posit(rst_posit),
	
	.dso_as512512512(dso_as512512512),
	.oeb_as512512512(oeb_as512512512),
	.rst_as512512512(rst_as512512512),
	
	.dso_vgatest(dso_vgatest),
	.rst_vgatest(rst_vgatest),
	
	.design_clk_o(design_clk)
);

tt2_tholin_multiplier tt2_tholin_multiplier(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.io_in(dsi_all[7:0]),
	.io_out(dso_multiplier)
);

tholin_avalonsemi_5401 tholin_avalonsemi_5401(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_as5401),
	.io_in(dsi_all[9:0]),
	.io_out(dso_as5401),
	.io_oeb(oeb_as5401)
);

tt2_tholin_diceroll tt2_tholin_diceroll(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_diceroll),
	.io_in(dsi_all[0]),
	.io_out(dso_diceroll)
);

tt2_tholin_namebadge tt2_tholin_namebadge(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_LCD),
	.io_in(dsi_all[10:8]),
	.io_out(dso_LCD)
);

wrapped_MC14500 wrapped_MC14500(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_mc14500),
	.io_in(dsi_all[4:0]),
	.io_out(dso_mc14500),
	.io_oeb(oeb_mc14500)
);

tt2_tholin_multiplexed_counter tt2_tholin_multiplexed_counter(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_counter),
	.io_out(dso_counter)
);

tholin_avalonsemi_tbb1143 tholin_avalonsemi_tbb1143(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_tbb1143),
	.io_in(dsi_all[5:0]),
	.io_out(dso_tbb1143)
);

wrapped_as2650 wrapped_as2650(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(wb_clk_i),
	.rst(rst_as2650),
	.io_in({dsi_all[27], dsi_all[7:0]}),
	.io_out(dso_as2650),
	.io_oeb(oeb_as2650)
);

wrapped_6502 wrapped_6502(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(wb_clk_i),
	.rst(rst_6502),
	.io_in(dsi_all[9:0]),
	.io_out(dso_6502),
	.io_oeb(oeb_6502)
);

wrapped_as1802 wrapped_as1802(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(wb_clk_i),
	.rst(rst_as1802),
	.io_in(dsi_all[12:0]),
	.io_out(dso_as1802),
	.io_oeb(oeb_as1802)
);

tune_player tune_player(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_tune),
	.OP(dso_tune)
);

posit_unit posit_unit(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(design_clk),
	.rst(rst_posit),
	.io_in(dsi_all[2:0]),
	.io_out(dso_posit)
);

wrapped_as512512512 wrapped_as512512512(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(wb_clk_i),
	.rst(rst_as512512512),
	.io_in(dsi_all[26:0]),
	.io_out(dso_as512512512),
	.io_oeb(oeb_as512512512)
);

wrapped_vgatest wrapped_vgatest(
`ifdef USE_POWER_PINS
	.vccd1(vccd1),	// User area 1 1.8V power
	.vssd1(vssd1),	// User area 1 digital ground
`endif
	.clk(wb_clk_i),
	.rst(rst_vgatest),
	.io_in(dsi_all[0]),
	.io_out(dso_vgatest)
);

endmodule	// user_project_wrapper

`default_nettype wire
