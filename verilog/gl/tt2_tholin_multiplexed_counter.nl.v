// This is the unpowered netlist.
module tt2_tholin_multiplexed_counter (clk,
    rst,
    io_out);
 input clk;
 input rst;
 output [11:0] io_out;

 wire \CIRCUIT_1111.MEMORY_2.d ;
 wire \CIRCUIT_1111.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.MEMORY_3.d ;
 wire \CIRCUIT_1111.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.MEMORY_4.d ;
 wire \CIRCUIT_1111.MEMORY_6.d ;
 wire \CIRCUIT_1111.MEMORY_6.s_currentState ;
 wire \CIRCUIT_1111.MEMORY_7.d ;
 wire \CIRCUIT_1111.MEMORY_7.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_1.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_1.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_10.clock ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_10.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_10.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_2.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_3.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_4.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_4.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_5.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_5.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_6.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_6.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_7.clock ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_7.d ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_7.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_8.s_currentState ;
 wire \CIRCUIT_1111.custom_counter_10_1.MEMORY_9.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.ARITH_1.aEqualsB ;
 wire \CIRCUIT_1111.full_counter_1.ARITH_2.aEqualsB ;
 wire \CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.d ;
 wire \CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_1.aEqualsB ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_4.aEqualsB ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.d ;
 wire \CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ;
 wire _007_;
 wire _009_;
 wire _011_;
 wire _013_;
 wire _015_;
 wire _017_;
 wire _019_;
 wire _021_;
 wire _023_;
 wire _026_;
 wire _027_;
 wire _028_;
 wire _029_;
 wire _030_;
 wire _031_;
 wire _032_;
 wire _033_;
 wire _034_;
 wire _035_;
 wire _036_;
 wire _037_;
 wire _038_;
 wire _041_;
 wire _042_;
 wire _043_;
 wire _044_;
 wire _045_;
 wire _046_;
 wire _047_;
 wire _048_;
 wire _049_;
 wire _050_;
 wire _051_;
 wire _052_;
 wire _053_;
 wire _054_;
 wire _056_;
 wire _058_;
 wire _060_;
 wire _062_;
 wire _064_;
 wire _065_;
 wire _066_;
 wire _067_;
 wire _068_;
 wire _069_;
 wire _070_;
 wire _071_;
 wire _072_;
 wire _073_;
 wire _074_;
 wire _075_;
 wire _076_;
 wire _077_;
 wire _078_;
 wire _079_;
 wire _080_;
 wire _081_;
 wire _082_;
 wire _083_;
 wire _084_;
 wire _085_;
 wire _086_;
 wire _087_;
 wire _088_;
 wire _089_;
 wire _090_;
 wire _091_;
 wire _092_;
 wire _093_;
 wire _094_;
 wire clknet_0__068_;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire clknet_2_0__leaf__068_;
 wire clknet_2_1__leaf__068_;
 wire clknet_2_2__leaf__068_;
 wire clknet_2_3__leaf__068_;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net22;
 wire net23;
 wire net24;
 wire net25;
 wire net26;
 wire net27;
 wire net28;
 wire net29;
 wire net3;
 wire net30;
 wire net31;
 wire net32;
 wire net33;
 wire net34;
 wire net35;
 wire net36;
 wire net37;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;
 wire prev_sel;

 sky130_ef_sc_hd__decap_12 FILLER_0_100 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_121 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_125 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_132 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_154 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_164 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_37 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_45 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_52 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_61 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_68 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_121 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_133 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_34 ();
 sky130_fd_sc_hd__decap_3 FILLER_10_42 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_65 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_71 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_75 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_92 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_148 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_155 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_76 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_84 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_139 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_146 ();
 sky130_fd_sc_hd__decap_8 FILLER_12_158 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_166 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_12_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_56 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_83 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_10 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_102 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_110 ();
 sky130_fd_sc_hd__decap_3 FILLER_13_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_119 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_131 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_143 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_158 ();
 sky130_fd_sc_hd__decap_3 FILLER_13_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_35 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_43 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_54 ();
 sky130_fd_sc_hd__decap_3 FILLER_13_57 ();
 sky130_fd_sc_hd__decap_6 FILLER_13_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_73 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_77 ();
 sky130_fd_sc_hd__decap_3 FILLER_14_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_126 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_130 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_134 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_166 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_17 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_82 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_92 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_99 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_110 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_113 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_144 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_156 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_163 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_62 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_86 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_117 ();
 sky130_fd_sc_hd__decap_3 FILLER_16_125 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_131 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_16_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_83 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_93 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_107 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_11 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_118 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_137 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_16 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_160 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_25 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_37 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_49 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_80 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_89 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_26 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_53 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_73 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_101 ();
 sky130_fd_sc_hd__decap_3 FILLER_19_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_118 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_13 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_130 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_142 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_146 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_150 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_157 ();
 sky130_fd_sc_hd__decap_3 FILLER_19_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_20 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_19_53 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_70 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_89 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_103 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_131 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_144 ();
 sky130_fd_sc_hd__decap_8 FILLER_1_157 ();
 sky130_fd_sc_hd__decap_3 FILLER_1_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_23 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_30 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_39 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_86 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_91 ();
 sky130_fd_sc_hd__decap_3 FILLER_20_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_118 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_130 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_141 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_166 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_17 ();
 sky130_fd_sc_hd__decap_3 FILLER_20_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_59 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_93 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_102 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_110 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_119 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_126 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_160 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_33 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_45 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_57 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_64 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_70 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_92 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_98 ();
 sky130_fd_sc_hd__decap_8 FILLER_22_122 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_130 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_139 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_166 ();
 sky130_fd_sc_hd__decap_8 FILLER_22_19 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_92 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_98 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_100 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_104 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_118 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_23_133 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_139 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_146 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_160 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_74 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_86 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_90 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_103 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_125 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_147 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_154 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_34 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_46 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_104 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_124 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_16 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_166 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_44 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_67 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_83 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_106 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_110 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_113 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_123 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_135 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_155 ();
 sky130_fd_sc_hd__decap_3 FILLER_3_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_22 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_30 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_40 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_70 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_94 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_104 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_112 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_120 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_132 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_15 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_166 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_34 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_43 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_59 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_63 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_70 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_92 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_39 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_7 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_73 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_98 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_104 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_116 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_128 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_148 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_16 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_160 ();
 sky130_fd_sc_hd__decap_3 FILLER_6_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_92 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_118 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_129 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_146 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_155 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_162 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_7_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_72 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_8 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_93 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_100 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_104 ();
 sky130_fd_sc_hd__decap_3 FILLER_8_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_126 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_130 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_134 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_164 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_17 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_56 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_68 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_74 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_78 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_93 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_118 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_12 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_130 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_145 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_156 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_163 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_167 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_23 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_46 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_54 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_82 ();
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_10 ();
 sky130_fd_sc_hd__decap_3 PHY_11 ();
 sky130_fd_sc_hd__decap_3 PHY_12 ();
 sky130_fd_sc_hd__decap_3 PHY_13 ();
 sky130_fd_sc_hd__decap_3 PHY_14 ();
 sky130_fd_sc_hd__decap_3 PHY_15 ();
 sky130_fd_sc_hd__decap_3 PHY_16 ();
 sky130_fd_sc_hd__decap_3 PHY_17 ();
 sky130_fd_sc_hd__decap_3 PHY_18 ();
 sky130_fd_sc_hd__decap_3 PHY_19 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_20 ();
 sky130_fd_sc_hd__decap_3 PHY_21 ();
 sky130_fd_sc_hd__decap_3 PHY_22 ();
 sky130_fd_sc_hd__decap_3 PHY_23 ();
 sky130_fd_sc_hd__decap_3 PHY_24 ();
 sky130_fd_sc_hd__decap_3 PHY_25 ();
 sky130_fd_sc_hd__decap_3 PHY_26 ();
 sky130_fd_sc_hd__decap_3 PHY_27 ();
 sky130_fd_sc_hd__decap_3 PHY_28 ();
 sky130_fd_sc_hd__decap_3 PHY_29 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_30 ();
 sky130_fd_sc_hd__decap_3 PHY_31 ();
 sky130_fd_sc_hd__decap_3 PHY_32 ();
 sky130_fd_sc_hd__decap_3 PHY_33 ();
 sky130_fd_sc_hd__decap_3 PHY_34 ();
 sky130_fd_sc_hd__decap_3 PHY_35 ();
 sky130_fd_sc_hd__decap_3 PHY_36 ();
 sky130_fd_sc_hd__decap_3 PHY_37 ();
 sky130_fd_sc_hd__decap_3 PHY_38 ();
 sky130_fd_sc_hd__decap_3 PHY_39 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_40 ();
 sky130_fd_sc_hd__decap_3 PHY_41 ();
 sky130_fd_sc_hd__decap_3 PHY_42 ();
 sky130_fd_sc_hd__decap_3 PHY_43 ();
 sky130_fd_sc_hd__decap_3 PHY_44 ();
 sky130_fd_sc_hd__decap_3 PHY_45 ();
 sky130_fd_sc_hd__decap_3 PHY_46 ();
 sky130_fd_sc_hd__decap_3 PHY_47 ();
 sky130_fd_sc_hd__decap_3 PHY_48 ();
 sky130_fd_sc_hd__decap_3 PHY_49 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_100 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_101 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_102 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_103 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_104 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_105 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_106 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_107 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_108 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_109 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_110 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_111 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_112 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_113 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_114 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_115 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_116 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_50 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_51 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_52 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_53 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_54 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_55 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_56 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_57 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_58 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_59 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_60 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_61 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_62 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_63 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_64 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_65 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_66 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_67 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_68 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_69 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_70 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_71 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_72 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_73 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_74 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_75 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_76 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_77 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_78 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_79 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_80 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_81 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_82 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_83 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_84 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_85 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_86 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_87 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_88 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_89 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_90 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_91 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_92 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_93 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_94 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_95 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_96 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_97 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_98 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_99 ();
 sky130_fd_sc_hd__inv_2 _095_ (.A(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .Y(\CIRCUIT_1111.MEMORY_6.d ));
 sky130_fd_sc_hd__inv_2 _096_ (.A(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .Y(\CIRCUIT_1111.MEMORY_7.d ));
 sky130_fd_sc_hd__inv_2 _097_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.d ));
 sky130_fd_sc_hd__inv_2 _098_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _099_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _100_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _101_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.d ));
 sky130_fd_sc_hd__inv_2 _102_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _103_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.d ));
 sky130_fd_sc_hd__inv_2 _104_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _105_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.d ));
 sky130_fd_sc_hd__inv_2 _106_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _107_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.d ));
 sky130_fd_sc_hd__inv_2 _108_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _109_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.d ));
 sky130_fd_sc_hd__inv_2 _110_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.d ));
 sky130_fd_sc_hd__inv_2 _111_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _112_ (.A(net11),
    .Y(\CIRCUIT_1111.MEMORY_4.d ));
 sky130_fd_sc_hd__inv_2 _113_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _114_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _115_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_4.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_4.d ));
 sky130_fd_sc_hd__inv_2 _116_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_5.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_5.d ));
 sky130_fd_sc_hd__inv_2 _117_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_6.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_6.d ));
 sky130_fd_sc_hd__inv_2 _118_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.d ));
 sky130_fd_sc_hd__inv_2 _119_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_8.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.clock ));
 sky130_fd_sc_hd__inv_2 _120_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_9.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.clock ));
 sky130_fd_sc_hd__inv_2 _121_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.d ));
 sky130_fd_sc_hd__inv_2 _122_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_1.s_currentState ),
    .Y(\CIRCUIT_1111.custom_counter_10_1.MEMORY_1.d ));
 sky130_fd_sc_hd__inv_2 _123_ (.A(\CIRCUIT_1111.MEMORY_3.s_currentState ),
    .Y(\CIRCUIT_1111.MEMORY_3.d ));
 sky130_fd_sc_hd__inv_2 _124_ (.A(\CIRCUIT_1111.MEMORY_2.s_currentState ),
    .Y(\CIRCUIT_1111.MEMORY_2.d ));
 sky130_fd_sc_hd__inv_2 _125__1 (.A(clknet_1_0__leaf_clk),
    .Y(net14));
 sky130_fd_sc_hd__and2_2 _126_ (.A(net1),
    .B(clknet_1_1__leaf_clk),
    .X(_068_));
 sky130_fd_sc_hd__inv_2 _127__10 (.A(clknet_2_2__leaf__068_),
    .Y(net23));
 sky130_fd_sc_hd__nor2_2 _128_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_2__leaf__068_),
    .Y(_052_));
 sky130_fd_sc_hd__nor2_2 _129_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_045_));
 sky130_fd_sc_hd__nor2_2 _130_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_037_));
 sky130_fd_sc_hd__nor2_2 _131_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_029_));
 sky130_fd_sc_hd__nor2_2 _132_ (.A(\CIRCUIT_1111.MEMORY_4.d ),
    .B(prev_sel),
    .Y(_069_));
 sky130_fd_sc_hd__mux2_1 _133_ (.A0(net4),
    .A1(net3),
    .S(_069_),
    .X(_070_));
 sky130_fd_sc_hd__and2b_1 _134_ (.A_N(net1),
    .B(_070_),
    .X(_067_));
 sky130_fd_sc_hd__mux2_1 _135_ (.A0(net3),
    .A1(net13),
    .S(_069_),
    .X(_071_));
 sky130_fd_sc_hd__and2b_1 _136_ (.A_N(net1),
    .B(_071_),
    .X(_066_));
 sky130_fd_sc_hd__mux2_1 _137_ (.A0(net13),
    .A1(net12),
    .S(_069_),
    .X(_072_));
 sky130_fd_sc_hd__and2b_1 _138_ (.A_N(net1),
    .B(_072_),
    .X(_065_));
 sky130_fd_sc_hd__mux2_1 _139_ (.A0(net12),
    .A1(net4),
    .S(_069_),
    .X(_073_));
 sky130_fd_sc_hd__or2_1 _140_ (.A(net1),
    .B(_073_),
    .X(_064_));
 sky130_fd_sc_hd__and4_1 _141_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .B(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .C(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.d ),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.d ),
    .X(\CIRCUIT_1111.full_counter_1.ARITH_1.aEqualsB ));
 sky130_fd_sc_hd__and4_1 _142_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.s_currentState ),
    .B(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .C(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.d ),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.d ),
    .X(\CIRCUIT_1111.full_counter_1.ARITH_2.aEqualsB ));
 sky130_fd_sc_hd__and3_1 _143_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .B(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .C(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.d ),
    .X(\CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_4.aEqualsB ));
 sky130_fd_sc_hd__and4_1 _144_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .B(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .C(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.d ),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.d ),
    .X(\CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_1.aEqualsB ));
 sky130_fd_sc_hd__mux4_2 _145_ (.A0(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .A1(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .A2(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .A3(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .S0(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .S1(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .X(_074_));
 sky130_fd_sc_hd__mux4_2 _146_ (.A0(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .A1(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .A2(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .A3(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .S0(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .S1(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .X(_075_));
 sky130_fd_sc_hd__inv_2 _147_ (.A(_075_),
    .Y(_076_));
 sky130_fd_sc_hd__or2_2 _148_ (.A(_074_),
    .B(_075_),
    .X(_077_));
 sky130_fd_sc_hd__and3b_1 _149_ (.A_N(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .B(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .C(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .X(_078_));
 sky130_fd_sc_hd__nor2_1 _150_ (.A(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .B(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .Y(_079_));
 sky130_fd_sc_hd__or3b_2 _151_ (.A(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .B(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .C_N(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .X(_080_));
 sky130_fd_sc_hd__o21ai_2 _152_ (.A1(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .A2(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .B1(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .Y(_081_));
 sky130_fd_sc_hd__nand2_1 _153_ (.A(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .B(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .Y(_082_));
 sky130_fd_sc_hd__a31oi_4 _154_ (.A1(_080_),
    .A2(_081_),
    .A3(_082_),
    .B1(_078_),
    .Y(_083_));
 sky130_fd_sc_hd__inv_2 _155_ (.A(_083_),
    .Y(_084_));
 sky130_fd_sc_hd__nor2_1 _156_ (.A(_074_),
    .B(_083_),
    .Y(_085_));
 sky130_fd_sc_hd__mux2_1 _157_ (.A0(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .A1(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.s_currentState ),
    .S(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .X(_086_));
 sky130_fd_sc_hd__a22o_2 _158_ (.A1(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ),
    .A2(_079_),
    .B1(_086_),
    .B2(\CIRCUIT_1111.MEMORY_7.s_currentState ),
    .X(_087_));
 sky130_fd_sc_hd__or2_2 _159_ (.A(_085_),
    .B(_087_),
    .X(_088_));
 sky130_fd_sc_hd__xor2_1 _160_ (.A(_077_),
    .B(_088_),
    .X(net2));
 sky130_fd_sc_hd__nand2_2 _161_ (.A(_077_),
    .B(_087_),
    .Y(_089_));
 sky130_fd_sc_hd__a21o_1 _162_ (.A1(_074_),
    .A2(_083_),
    .B1(_076_),
    .X(_090_));
 sky130_fd_sc_hd__a21oi_1 _163_ (.A1(_074_),
    .A2(_083_),
    .B1(_076_),
    .Y(_091_));
 sky130_fd_sc_hd__nor2_1 _164_ (.A(_085_),
    .B(_090_),
    .Y(_092_));
 sky130_fd_sc_hd__o21a_1 _165_ (.A1(_088_),
    .A2(_090_),
    .B1(_089_),
    .X(net5));
 sky130_fd_sc_hd__nor2_1 _166_ (.A(_075_),
    .B(_083_),
    .Y(_093_));
 sky130_fd_sc_hd__o21ai_1 _167_ (.A1(_087_),
    .A2(_093_),
    .B1(_077_),
    .Y(net6));
 sky130_fd_sc_hd__a21o_1 _168_ (.A1(_074_),
    .A2(_076_),
    .B1(_087_),
    .X(_094_));
 sky130_fd_sc_hd__o31a_1 _169_ (.A1(_092_),
    .A2(_093_),
    .A3(_094_),
    .B1(_089_),
    .X(net7));
 sky130_fd_sc_hd__o211a_1 _170_ (.A1(_074_),
    .A2(_076_),
    .B1(_084_),
    .C1(_089_),
    .X(net8));
 sky130_fd_sc_hd__o21a_1 _171_ (.A1(_088_),
    .A2(_091_),
    .B1(_089_),
    .X(net9));
 sky130_fd_sc_hd__o21a_1 _172_ (.A1(_091_),
    .A2(_094_),
    .B1(_089_),
    .X(net10));
 sky130_fd_sc_hd__inv_2 _173__11 (.A(clknet_2_2__leaf__068_),
    .Y(net24));
 sky130_fd_sc_hd__inv_2 _174__12 (.A(clknet_2_2__leaf__068_),
    .Y(net25));
 sky130_fd_sc_hd__inv_2 _175__13 (.A(clknet_2_2__leaf__068_),
    .Y(net26));
 sky130_fd_sc_hd__nor2_2 _176_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_2__leaf__068_),
    .Y(_050_));
 sky130_fd_sc_hd__nor2_2 _177_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_0__leaf__068_),
    .Y(_048_));
 sky130_fd_sc_hd__nor2_2 _178_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ),
    .B(clknet_2_0__leaf__068_),
    .Y(_043_));
 sky130_fd_sc_hd__nor2_2 _179_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ),
    .B(clknet_2_0__leaf__068_),
    .Y(_041_));
 sky130_fd_sc_hd__nor2_2 _180_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_035_));
 sky130_fd_sc_hd__nor2_2 _181_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_033_));
 sky130_fd_sc_hd__nor2_2 _182_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ),
    .B(clknet_2_3__leaf__068_),
    .Y(_031_));
 sky130_fd_sc_hd__nor2_2 _183_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_027_));
 sky130_fd_sc_hd__inv_2 _184__14 (.A(clknet_2_3__leaf__068_),
    .Y(net27));
 sky130_fd_sc_hd__inv_2 _185__15 (.A(clknet_2_3__leaf__068_),
    .Y(net28));
 sky130_fd_sc_hd__inv_2 _186__16 (.A(clknet_2_3__leaf__068_),
    .Y(net29));
 sky130_fd_sc_hd__inv_2 _187__17 (.A(clknet_2_3__leaf__068_),
    .Y(net30));
 sky130_fd_sc_hd__inv_2 _188__18 (.A(clknet_2_3__leaf__068_),
    .Y(net31));
 sky130_fd_sc_hd__inv_2 _189__19 (.A(clknet_2_3__leaf__068_),
    .Y(net32));
 sky130_fd_sc_hd__inv_2 _190__20 (.A(clknet_2_3__leaf__068_),
    .Y(net33));
 sky130_fd_sc_hd__inv_2 _191__21 (.A(clknet_2_3__leaf__068_),
    .Y(net34));
 sky130_fd_sc_hd__inv_2 _192__22 (.A(clknet_2_2__leaf__068_),
    .Y(net35));
 sky130_fd_sc_hd__inv_2 _193__2 (.A(clknet_1_0__leaf_clk),
    .Y(net15));
 sky130_fd_sc_hd__inv_2 _194__3 (.A(clknet_1_0__leaf_clk),
    .Y(net16));
 sky130_fd_sc_hd__inv_2 _195__4 (.A(clknet_1_0__leaf_clk),
    .Y(net17));
 sky130_fd_sc_hd__inv_2 _196__5 (.A(clknet_1_0__leaf_clk),
    .Y(net18));
 sky130_fd_sc_hd__inv_2 _197__23 (.A(clknet_2_3__leaf__068_),
    .Y(net36));
 sky130_fd_sc_hd__inv_2 _198_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_1.s_currentState ),
    .Y(_007_));
 sky130_fd_sc_hd__inv_2 _199_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_2.s_currentState ),
    .Y(_009_));
 sky130_fd_sc_hd__inv_2 _200_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_3.s_currentState ),
    .Y(_011_));
 sky130_fd_sc_hd__inv_2 _201_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_4.s_currentState ),
    .Y(_013_));
 sky130_fd_sc_hd__inv_2 _202_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.s_currentState ),
    .Y(_015_));
 sky130_fd_sc_hd__inv_2 _203_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_9.s_currentState ),
    .Y(_017_));
 sky130_fd_sc_hd__inv_2 _204_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.s_currentState ),
    .Y(_019_));
 sky130_fd_sc_hd__inv_2 _205_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_5.s_currentState ),
    .Y(_021_));
 sky130_fd_sc_hd__inv_2 _206_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_8.s_currentState ),
    .Y(_023_));
 sky130_fd_sc_hd__inv_2 _207__6 (.A(clknet_1_0__leaf_clk),
    .Y(net19));
 sky130_fd_sc_hd__inv_2 _208__7 (.A(clknet_1_0__leaf_clk),
    .Y(net20));
 sky130_fd_sc_hd__nor2_2 _209_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_1__leaf__068_),
    .Y(_026_));
 sky130_fd_sc_hd__inv_2 _210_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .Y(_028_));
 sky130_fd_sc_hd__inv_2 _211_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .Y(_030_));
 sky130_fd_sc_hd__inv_2 _212_ (.A(\CIRCUIT_1111.custom_counter_10_1.MEMORY_6.s_currentState ),
    .Y(_032_));
 sky130_fd_sc_hd__inv_2 _213_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .Y(_034_));
 sky130_fd_sc_hd__inv_2 _214_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .Y(_036_));
 sky130_fd_sc_hd__inv_2 _215_ (.A(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .Y(_038_));
 sky130_fd_sc_hd__inv_2 _216__8 (.A(clknet_1_1__leaf_clk),
    .Y(net21));
 sky130_fd_sc_hd__inv_2 _217__9 (.A(clknet_1_1__leaf_clk),
    .Y(net22));
 sky130_fd_sc_hd__inv_2 _218_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ),
    .Y(_042_));
 sky130_fd_sc_hd__inv_2 _219_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ),
    .Y(_044_));
 sky130_fd_sc_hd__inv_2 _220_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ),
    .Y(_046_));
 sky130_fd_sc_hd__nor2_2 _221_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ),
    .B(clknet_2_0__leaf__068_),
    .Y(_047_));
 sky130_fd_sc_hd__inv_2 _222_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ),
    .Y(_049_));
 sky130_fd_sc_hd__inv_2 _223_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ),
    .Y(_051_));
 sky130_fd_sc_hd__inv_2 _224_ (.A(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ),
    .Y(_053_));
 sky130_fd_sc_hd__nor2_2 _225_ (.A(\CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ),
    .B(clknet_2_0__leaf__068_),
    .Y(_054_));
 sky130_fd_sc_hd__inv_2 _226_ (.A(\CIRCUIT_1111.MEMORY_6.s_currentState ),
    .Y(_056_));
 sky130_fd_sc_hd__inv_2 _227_ (.A(net11),
    .Y(_058_));
 sky130_fd_sc_hd__inv_2 _228_ (.A(\CIRCUIT_1111.MEMORY_3.s_currentState ),
    .Y(_060_));
 sky130_fd_sc_hd__inv_2 _229_ (.A(\CIRCUIT_1111.MEMORY_2.s_currentState ),
    .Y(_062_));
 sky130_fd_sc_hd__inv_2 _230__24 (.A(clknet_2_2__leaf__068_),
    .Y(net37));
 sky130_fd_sc_hd__dfxtp_1 _231_ (.CLK(net14),
    .D(_064_),
    .Q(net12));
 sky130_fd_sc_hd__dfxtp_1 _232_ (.CLK(net15),
    .D(_065_),
    .Q(net13));
 sky130_fd_sc_hd__dfxtp_1 _233_ (.CLK(net16),
    .D(_066_),
    .Q(net3));
 sky130_fd_sc_hd__dfxtp_1 _234_ (.CLK(net17),
    .D(_067_),
    .Q(net4));
 sky130_fd_sc_hd__dfxtp_1 _235_ (.CLK(net18),
    .D(net11),
    .Q(prev_sel));
 sky130_fd_sc_hd__dfrtp_4 _236_ (.CLK(clknet_1_1__leaf_clk),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_1.d ),
    .RESET_B(net36),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_1.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _237_ (.CLK(_007_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_2.d ),
    .RESET_B(net35),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _238_ (.CLK(_009_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_3.d ),
    .RESET_B(net34),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _239_ (.CLK(_011_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_4.d ),
    .RESET_B(net33),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_4.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _240_ (.CLK(_013_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_5.d ),
    .RESET_B(net32),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_5.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _241_ (.CLK(_015_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_6.d ),
    .RESET_B(net31),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_6.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _242_ (.CLK(_017_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.d ),
    .RESET_B(net30),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _243_ (.CLK(_019_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.clock ),
    .RESET_B(net29),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_8.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _244_ (.CLK(_021_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_7.clock ),
    .RESET_B(net28),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_9.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _245_ (.CLK(_023_),
    .D(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.d ),
    .RESET_B(net27),
    .Q(\CIRCUIT_1111.custom_counter_10_1.MEMORY_10.s_currentState ));
 sky130_fd_sc_hd__dfxtp_4 _246_ (.CLK(net19),
    .D(\CIRCUIT_1111.full_counter_1.ARITH_1.aEqualsB ),
    .Q(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfxtp_2 _247_ (.CLK(net20),
    .D(\CIRCUIT_1111.full_counter_1.ARITH_2.aEqualsB ),
    .Q(\CIRCUIT_1111.full_counter_1.MEMORY_6.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _248_ (.CLK(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.d ),
    .RESET_B(_026_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _249_ (.CLK(_028_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.d ),
    .RESET_B(_027_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _250_ (.CLK(_030_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.d ),
    .RESET_B(_029_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _251_ (.CLK(_032_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.d ),
    .RESET_B(_031_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _252_ (.CLK(_034_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.d ),
    .RESET_B(_033_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _253_ (.CLK(_036_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.d ),
    .RESET_B(_035_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _254_ (.CLK(_038_),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.d ),
    .RESET_B(_037_),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ));
 sky130_fd_sc_hd__dfxtp_2 _255_ (.CLK(net21),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_4.aEqualsB ),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ));
 sky130_fd_sc_hd__dfxtp_4 _256_ (.CLK(net22),
    .D(\CIRCUIT_1111.full_counter_1.seconds_counter_1.ARITH_1.aEqualsB ),
    .Q(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_5.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _257_ (.CLK(_042_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.d ),
    .RESET_B(_041_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_4.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _258_ (.CLK(_044_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.d ),
    .RESET_B(_043_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _259_ (.CLK(_046_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.d ),
    .RESET_B(_045_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _260_ (.CLK(\CIRCUIT_1111.full_counter_1.seconds_counter_1.MEMORY_6.s_currentState ),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.d ),
    .RESET_B(_047_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_1.MEMORY_1.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _261_ (.CLK(_049_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.d ),
    .RESET_B(_048_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_4.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _262_ (.CLK(_051_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.d ),
    .RESET_B(_050_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _263_ (.CLK(_053_),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.d ),
    .RESET_B(_052_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _264_ (.CLK(\CIRCUIT_1111.full_counter_1.MEMORY_3.s_currentState ),
    .D(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.d ),
    .RESET_B(_054_),
    .Q(\CIRCUIT_1111.full_counter_1.custom_counter_4_2.MEMORY_1.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _265_ (.CLK(_056_),
    .D(\CIRCUIT_1111.MEMORY_7.d ),
    .RESET_B(net26),
    .Q(\CIRCUIT_1111.MEMORY_7.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _266_ (.CLK(_058_),
    .D(\CIRCUIT_1111.MEMORY_6.d ),
    .RESET_B(net25),
    .Q(\CIRCUIT_1111.MEMORY_6.s_currentState ));
 sky130_fd_sc_hd__dfrtp_2 _267_ (.CLK(_060_),
    .D(\CIRCUIT_1111.MEMORY_4.d ),
    .RESET_B(net24),
    .Q(net11));
 sky130_fd_sc_hd__dfrtp_4 _268_ (.CLK(_062_),
    .D(\CIRCUIT_1111.MEMORY_3.d ),
    .RESET_B(net23),
    .Q(\CIRCUIT_1111.MEMORY_3.s_currentState ));
 sky130_fd_sc_hd__dfrtp_4 _269_ (.CLK(clknet_1_1__leaf_clk),
    .D(\CIRCUIT_1111.MEMORY_2.d ),
    .RESET_B(net37),
    .Q(\CIRCUIT_1111.MEMORY_2.s_currentState ));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0__068_ (.A(_068_),
    .X(clknet_0__068_));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_0__f__068_ (.A(clknet_0__068_),
    .X(clknet_2_0__leaf__068_));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_1__f__068_ (.A(clknet_0__068_),
    .X(clknet_2_1__leaf__068_));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_2__f__068_ (.A(clknet_0__068_),
    .X(clknet_2_2__leaf__068_));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_3__f__068_ (.A(clknet_0__068_),
    .X(clknet_2_3__leaf__068_));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(rst),
    .X(net1));
 sky130_fd_sc_hd__buf_4 output10 (.A(net10),
    .X(io_out[6]));
 sky130_fd_sc_hd__buf_4 output11 (.A(net11),
    .X(io_out[7]));
 sky130_fd_sc_hd__buf_4 output12 (.A(net12),
    .X(io_out[8]));
 sky130_fd_sc_hd__buf_4 output13 (.A(net13),
    .X(io_out[9]));
 sky130_fd_sc_hd__buf_4 output2 (.A(net2),
    .X(io_out[0]));
 sky130_fd_sc_hd__buf_4 output3 (.A(net3),
    .X(io_out[10]));
 sky130_fd_sc_hd__buf_4 output4 (.A(net4),
    .X(io_out[11]));
 sky130_fd_sc_hd__buf_4 output5 (.A(net5),
    .X(io_out[1]));
 sky130_fd_sc_hd__buf_4 output6 (.A(net6),
    .X(io_out[2]));
 sky130_fd_sc_hd__buf_4 output7 (.A(net7),
    .X(io_out[3]));
 sky130_fd_sc_hd__buf_4 output8 (.A(net8),
    .X(io_out[4]));
 sky130_fd_sc_hd__buf_4 output9 (.A(net9),
    .X(io_out[5]));
endmodule

