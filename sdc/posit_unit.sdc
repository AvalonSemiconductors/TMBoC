###############################################################################
# Created by write_sdc
# Tue Mar 28 12:45:40 2023
###############################################################################
current_design posit_unit
###############################################################################
# Timing Constraints
###############################################################################
create_clock -name clk -period 40.0000 [get_ports {clk}]
set_clock_transition 0.1500 [get_clocks {clk}]
set_clock_uncertainty 0.2500 clk
set_propagated_clock [get_clocks {clk}]
set_input_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_in[0]}]
set_input_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_in[1]}]
set_input_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_in[2]}]
set_input_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {rst}]
set_output_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_out[0]}]
set_output_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_out[1]}]
set_output_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_out[2]}]
set_output_delay 8.0000 -clock [get_clocks {clk}] -add_delay [get_ports {io_out[3]}]
###############################################################################
# Environment
###############################################################################
set_load -pin_load 0.0334 [get_ports {io_out[3]}]
set_load -pin_load 0.0334 [get_ports {io_out[2]}]
set_load -pin_load 0.0334 [get_ports {io_out[1]}]
set_load -pin_load 0.0334 [get_ports {io_out[0]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {clk}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {rst}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[2]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[1]}]
set_driving_cell -lib_cell sky130_fd_sc_hd__inv_2 -pin {Y} -input_transition_rise 0.0000 -input_transition_fall 0.0000 [get_ports {io_in[0]}]
set_timing_derate -early 0.9500
set_timing_derate -late 1.0500
###############################################################################
# Design Rules
###############################################################################
set_max_fanout 10.0000 [current_design]
