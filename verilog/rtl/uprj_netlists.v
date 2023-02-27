// SPDX-FileCopyrightText: 2020 Efabless Corporation
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

// Include caravel global defines for the number of the user project IO pads 
`include "defines.v"
`define USE_POWER_PINS

`ifdef GL
    // Assume default net type to be wire because GL netlists don't have the wire definitions
    `default_nettype wire
    `include "gl/user_project_wrapper.v"
    `include "gl/mc14500.v"
    `include "gl/tholin_avalonsemi_5401.v"
    `include "gl/tholin_avalonsemi_tbb1143.v"
    `include "gl/tt2_tholin_diceroll.v"
    `include "gl/tt2_tholin_multiplexed_counter.v"
    `include "gl/tt2_tholin_multiplier.v"
    `include "gl/tt2_tholin_namebadge"
`else
    `include "user_project_wrapper.v"
    `include "logisim_common/arith/Adder.v"
    `include "logisim_common/arith/Comparator.v"
    `include "logisim_common/arith/FullAdder.v"
    `include "logisim_common/gates/AND_GATE.v"
    `include "logisim_common/gates/AND_GATE_BUS.v"
    `include "logisim_common/gates/NAND_GATE.v"
    `include "logisim_common/gates/NAND_GATE_BUS.v"
    `include "logisim_common/gates/NOR_GATE.v"
    `include "logisim_common/gates/OR_GATE.v"
    `include "logisim_common/gates/OR_GATE_BUS_4_INPUTS.v"
    `include "logisim_common/gates/XNOR_GATE_ONEHOT.v"
    `include "logisim_common/gates/XOR_GATE_ONEHOT.v"
    `include "logisim_common/memory/D_FLIPFLOP.v"
    `include "logisim_common/memory/REGISTER_FLIP_FLOP.v"
    `include "logisim_common/plexers/Demultiplexer_16.v"
    `include "logisim_common/plexers/Multiplexer_bus_4.v"
    `include "logisim_common/4x4-multiply/logisimTopLevelShell.v"
    `include "logisim_common/4x4-multiply/main.v"
    `include "logisim_common/AS5401/clock_gen_2.v"
    `include "logisim_common/AS5401/CPU.v"
    `include "logisim_common/AS5401/dest_reg_sel_new.v"
    `include "logisim_common/AS5401/div.v"
    `include "logisim_common/AS5401/eq_0.v"
    `include "logisim_common/AS5401/inst_dec.v"
    `include "logisim_common/AS5401/int_memory.v"
    `include "logisim_common/AS5401/logisimTopLevelShell.v"
    `include "logisim_common/AS5401/main.v"
    `include "logisim_common/AS5401/mul2.v"
    `include "logisim_common/AS5401/output_logic.v"
    `include "logisim_common/Diceroll/dice.v"
    `include "logisim_common/Diceroll/toplevel.v"
    `include "logisim_common/LCD_Namebadge/lcd.v"
    `include "logisim_common/LCD_Namebadge/toplevel.v"
    `include "logisim_common/MC14500/MC14500.v"
    `include "logisim_common/MultiplexedCounter/bcd_to_seg.v"
    `include "logisim_common/MultiplexedCounter/custom_counter_3.v"
    `include "logisim_common/MultiplexedCounter/custom_counter_4.v"
    `include "logisim_common/MultiplexedCounter/custom_counter_10.v"
    `include "logisim_common/MultiplexedCounter/full_counter.v"
    `include "logisim_common/MultiplexedCounter/logisimTopLevelShell.v"
    `include "logisim_common/MultiplexedCounter/main.v"
    `include "logisim_common/MultiplexedCounter/seconds_counter.v"
    `include "logisim_common/TBB1143/logisimTopLevelShell.v"
    `include "logisim_common/TBB1143/main.v"
    `include "logisim_common/TBB1143/tone_generator.v"
    `include "logisim_common/TBB1143/tone_generator_2.v"
    `include "logisim_common/TBB1143/triangle_wave_generator.v"
`endif
