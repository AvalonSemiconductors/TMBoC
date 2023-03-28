// This is the unpowered netlist.
module tt2_tholin_diceroll (clk,
    io_in,
    rst,
    io_out);
 input clk;
 input io_in;
 input rst;
 output [7:0] io_out;

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire _006_;
 wire _007_;
 wire _008_;
 wire _009_;
 wire _010_;
 wire _011_;
 wire _012_;
 wire _013_;
 wire _014_;
 wire _015_;
 wire _016_;
 wire _017_;
 wire _018_;
 wire _019_;
 wire _020_;
 wire _021_;
 wire _022_;
 wire _023_;
 wire _024_;
 wire _025_;
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
 wire _039_;
 wire _040_;
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
 wire _055_;
 wire _056_;
 wire _057_;
 wire _058_;
 wire _059_;
 wire _060_;
 wire _061_;
 wire _062_;
 wire _063_;
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
 wire _095_;
 wire _096_;
 wire _097_;
 wire _098_;
 wire _099_;
 wire _100_;
 wire _101_;
 wire _102_;
 wire _103_;
 wire _104_;
 wire _105_;
 wire _106_;
 wire _107_;
 wire _108_;
 wire _109_;
 wire _110_;
 wire _111_;
 wire _112_;
 wire _113_;
 wire _114_;
 wire _115_;
 wire _116_;
 wire _117_;
 wire _118_;
 wire _119_;
 wire _120_;
 wire _121_;
 wire _122_;
 wire _123_;
 wire _124_;
 wire _125_;
 wire _126_;
 wire _127_;
 wire _128_;
 wire _129_;
 wire _130_;
 wire _131_;
 wire _132_;
 wire _133_;
 wire _134_;
 wire _135_;
 wire _136_;
 wire _137_;
 wire _138_;
 wire _139_;
 wire _140_;
 wire _141_;
 wire _142_;
 wire _143_;
 wire _144_;
 wire _145_;
 wire _146_;
 wire _147_;
 wire _148_;
 wire _149_;
 wire _150_;
 wire _151_;
 wire _152_;
 wire _153_;
 wire _154_;
 wire _155_;
 wire _156_;
 wire _157_;
 wire _158_;
 wire _159_;
 wire _160_;
 wire _161_;
 wire _162_;
 wire _163_;
 wire _164_;
 wire _165_;
 wire _166_;
 wire _167_;
 wire _168_;
 wire _169_;
 wire _170_;
 wire _171_;
 wire _172_;
 wire _173_;
 wire _174_;
 wire _175_;
 wire _176_;
 wire _177_;
 wire _178_;
 wire _179_;
 wire _180_;
 wire clknet_0_clk;
 wire clknet_2_0__leaf_clk;
 wire clknet_2_1__leaf_clk;
 wire clknet_2_2__leaf_clk;
 wire clknet_2_3__leaf_clk;
 wire \dice.bcd[0] ;
 wire \dice.bcd[1] ;
 wire \dice.bcd[2] ;
 wire \dice.clkdiv[0] ;
 wire \dice.clkdiv[1] ;
 wire \dice.clkdiv[2] ;
 wire \dice.clkdiv[3] ;
 wire \dice.clkdiv[4] ;
 wire \dice.clkdiv[5] ;
 wire \dice.clkdiv[6] ;
 wire \dice.clkdiv[7] ;
 wire \dice.counter[0] ;
 wire \dice.counter[10] ;
 wire \dice.counter[11] ;
 wire \dice.counter[12] ;
 wire \dice.counter[13] ;
 wire \dice.counter[14] ;
 wire \dice.counter[15] ;
 wire \dice.counter[1] ;
 wire \dice.counter[2] ;
 wire \dice.counter[3] ;
 wire \dice.counter[4] ;
 wire \dice.counter[5] ;
 wire \dice.counter[6] ;
 wire \dice.counter[7] ;
 wire \dice.counter[8] ;
 wire \dice.counter[9] ;
 wire \dice.lfsr[0] ;
 wire \dice.lfsr[10] ;
 wire \dice.lfsr[11] ;
 wire \dice.lfsr[12] ;
 wire \dice.lfsr[13] ;
 wire \dice.lfsr[14] ;
 wire \dice.lfsr[15] ;
 wire \dice.lfsr[1] ;
 wire \dice.lfsr[2] ;
 wire \dice.lfsr[3] ;
 wire \dice.lfsr[4] ;
 wire \dice.lfsr[5] ;
 wire \dice.lfsr[6] ;
 wire \dice.lfsr[7] ;
 wire \dice.lfsr[8] ;
 wire \dice.lfsr[9] ;
 wire \dice.r_counter[0] ;
 wire \dice.r_counter[1] ;
 wire \dice.r_counter[2] ;
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
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__decap_3 FILLER_0_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_167 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_197 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_205 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_213 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_37 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_69 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_100 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_111 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_119 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_126 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_138 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_141 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_161 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_168 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_180 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_204 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_216 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_228 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_232 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_49 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_60 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_71 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_82 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_103 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_110 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_113 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_124 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_131 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_141 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_148 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_156 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_184 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_19 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_192 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_202 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_214 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_35 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_44 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_64 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_75 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_109 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_126 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_130 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_166 ();
 sky130_fd_sc_hd__decap_8 FILLER_12_178 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_186 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_194 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_27 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_49 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_61 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_72 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_9 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_102 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_107 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_11 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_119 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_131 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_139 ();
 sky130_fd_sc_hd__decap_6 FILLER_13_151 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_157 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_166 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_198 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_23 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_35 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_64 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_72 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_79 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_90 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_106 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_115 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_124 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_138 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_14 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_151 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_163 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_176 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_182 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_207 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_219 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_231 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_49 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_58 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_76 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_96 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_113 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_12 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_125 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_129 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_134 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_157 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_164 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_181 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_185 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_206 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_218 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_22 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_30 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_7 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_165 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_177 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_188 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_16_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_72 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_106 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_157 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_16 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_185 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_204 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_216 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_225 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_23 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_31 ();
 sky130_fd_sc_hd__decap_6 FILLER_17_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_94 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_128 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_159 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_172 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_184 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_197 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_20 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_208 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_220 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_232 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_50 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_56 ();
 sky130_fd_sc_hd__decap_8 FILLER_18_73 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_81 ();
 sky130_fd_sc_hd__decap_3 FILLER_18_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_110 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_163 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_198 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_206 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_218 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_225 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_73 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_90 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_1_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_20_153 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_161 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_171 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_183 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_20_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_206 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_218 ();
 sky130_fd_sc_hd__decap_3 FILLER_20_230 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_20_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_110 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_113 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_140 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_146 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_151 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_16 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_165 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_174 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_186 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_225 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_28 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_21_50 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_83 ();
 sky130_fd_sc_hd__decap_3 FILLER_21_91 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_110 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_138 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_164 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_175 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_182 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_204 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_216 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_228 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_232 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_22_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_33 ();
 sky130_fd_sc_hd__decap_8 FILLER_22_50 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_58 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_83 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_85 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_11 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_111 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_113 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_121 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_139 ();
 sky130_fd_sc_hd__decap_3 FILLER_23_151 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_167 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_176 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_188 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_202 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_21 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_225 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_35 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_87 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_99 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_108 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_120 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_138 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_141 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_178 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_18 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_190 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_203 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_215 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_227 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_83 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_91 ();
 sky130_fd_sc_hd__decap_3 FILLER_25_109 ();
 sky130_fd_sc_hd__decap_4 FILLER_25_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_144 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_156 ();
 sky130_fd_sc_hd__fill_2 FILLER_25_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_25_178 ();
 sky130_fd_sc_hd__decap_3 FILLER_25_186 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_205 ();
 sky130_fd_sc_hd__decap_4 FILLER_25_21 ();
 sky130_fd_sc_hd__decap_6 FILLER_25_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_25_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_25_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_28 ();
 sky130_fd_sc_hd__fill_2 FILLER_25_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_25_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_25_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_25_81 ();
 sky130_fd_sc_hd__fill_1 FILLER_26_11 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_110 ();
 sky130_fd_sc_hd__fill_1 FILLER_26_118 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_136 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_141 ();
 sky130_fd_sc_hd__decap_6 FILLER_26_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_156 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_168 ();
 sky130_fd_sc_hd__fill_1 FILLER_26_172 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_192 ();
 sky130_fd_sc_hd__fill_2 FILLER_26_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_206 ();
 sky130_ef_sc_hd__decap_12 FILLER_26_218 ();
 sky130_fd_sc_hd__decap_3 FILLER_26_230 ();
 sky130_fd_sc_hd__fill_2 FILLER_26_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_53 ();
 sky130_fd_sc_hd__decap_3 FILLER_26_61 ();
 sky130_fd_sc_hd__decap_4 FILLER_26_80 ();
 sky130_fd_sc_hd__decap_8 FILLER_26_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_26_93 ();
 sky130_fd_sc_hd__decap_3 FILLER_27_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_144 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_156 ();
 sky130_fd_sc_hd__fill_2 FILLER_27_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_27_17 ();
 sky130_fd_sc_hd__decap_4 FILLER_27_184 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_188 ();
 sky130_fd_sc_hd__decap_4 FILLER_27_203 ();
 sky130_fd_sc_hd__decap_4 FILLER_27_210 ();
 sky130_fd_sc_hd__decap_6 FILLER_27_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_27_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_27_24 ();
 sky130_fd_sc_hd__decap_6 FILLER_27_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_27_36 ();
 sky130_fd_sc_hd__fill_2 FILLER_27_54 ();
 sky130_fd_sc_hd__decap_8 FILLER_27_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_27_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_27_84 ();
 sky130_fd_sc_hd__fill_1 FILLER_27_92 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_28_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_139 ();
 sky130_fd_sc_hd__decap_8 FILLER_28_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_152 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_160 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_179 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_195 ();
 sky130_fd_sc_hd__fill_2 FILLER_28_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_204 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_216 ();
 sky130_fd_sc_hd__decap_6 FILLER_28_22 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_228 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_232 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_28_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_28_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_28_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_28_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_28_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_10 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_108 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_137 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_149 ();
 sky130_fd_sc_hd__fill_1 FILLER_29_153 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_160 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_169 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_17 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_181 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_194 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_201 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_213 ();
 sky130_fd_sc_hd__decap_3 FILLER_29_221 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_29_25 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_29_33 ();
 sky130_fd_sc_hd__decap_3 FILLER_29_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_29_57 ();
 sky130_fd_sc_hd__decap_3 FILLER_29_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_84 ();
 sky130_ef_sc_hd__decap_12 FILLER_29_96 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_105 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_117 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_138 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_141 ();
 sky130_fd_sc_hd__decap_6 FILLER_30_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_153 ();
 sky130_fd_sc_hd__decap_3 FILLER_30_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_172 ();
 sky130_fd_sc_hd__decap_4 FILLER_30_184 ();
 sky130_fd_sc_hd__fill_1 FILLER_30_188 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_30_202 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_219 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_231 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_30_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_30_53 ();
 sky130_fd_sc_hd__decap_8 FILLER_30_65 ();
 sky130_fd_sc_hd__fill_2 FILLER_30_73 ();
 sky130_fd_sc_hd__decap_4 FILLER_30_80 ();
 sky130_fd_sc_hd__decap_4 FILLER_30_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_107 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_111 ();
 sky130_fd_sc_hd__decap_6 FILLER_31_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_135 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_152 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_16 ();
 sky130_fd_sc_hd__decap_3 FILLER_31_160 ();
 sky130_fd_sc_hd__fill_2 FILLER_31_166 ();
 sky130_fd_sc_hd__fill_2 FILLER_31_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_178 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_190 ();
 sky130_fd_sc_hd__decap_4 FILLER_31_196 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_31_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_31_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_225 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_28 ();
 sky130_fd_sc_hd__decap_8 FILLER_31_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_31_36 ();
 sky130_fd_sc_hd__fill_2 FILLER_31_54 ();
 sky130_fd_sc_hd__decap_6 FILLER_31_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_31_79 ();
 sky130_fd_sc_hd__decap_8 FILLER_32_109 ();
 sky130_fd_sc_hd__decap_3 FILLER_32_117 ();
 sky130_fd_sc_hd__decap_3 FILLER_32_137 ();
 sky130_fd_sc_hd__fill_2 FILLER_32_141 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_149 ();
 sky130_fd_sc_hd__decap_6 FILLER_32_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_158 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_179 ();
 sky130_fd_sc_hd__decap_4 FILLER_32_191 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_221 ();
 sky130_fd_sc_hd__fill_2 FILLER_32_26 ();
 sky130_fd_sc_hd__decap_6 FILLER_32_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_32_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_32_35 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_32_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_32_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_109 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_11 ();
 sky130_fd_sc_hd__decap_8 FILLER_33_113 ();
 sky130_fd_sc_hd__fill_2 FILLER_33_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_139 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_143 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_155 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_165 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_169 ();
 sky130_fd_sc_hd__decap_6 FILLER_33_185 ();
 sky130_ef_sc_hd__decap_12 FILLER_33_198 ();
 sky130_ef_sc_hd__decap_12 FILLER_33_20 ();
 sky130_ef_sc_hd__decap_12 FILLER_33_210 ();
 sky130_fd_sc_hd__fill_2 FILLER_33_222 ();
 sky130_fd_sc_hd__decap_8 FILLER_33_225 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_33_32 ();
 sky130_fd_sc_hd__decap_4 FILLER_33_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_55 ();
 sky130_fd_sc_hd__decap_6 FILLER_33_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_33_80 ();
 sky130_fd_sc_hd__fill_1 FILLER_33_92 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_117 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_138 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_14 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_141 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_153 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_159 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_169 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_177 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_194 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_221 ();
 sky130_fd_sc_hd__decap_4 FILLER_34_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_34_27 ();
 sky130_fd_sc_hd__decap_6 FILLER_34_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_34_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_34_51 ();
 sky130_fd_sc_hd__decap_3 FILLER_34_63 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_34_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_34_92 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_109 ();
 sky130_fd_sc_hd__decap_6 FILLER_35_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_123 ();
 sky130_fd_sc_hd__decap_4 FILLER_35_135 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_15 ();
 sky130_fd_sc_hd__decap_8 FILLER_35_157 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_181 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_193 ();
 sky130_fd_sc_hd__fill_2 FILLER_35_197 ();
 sky130_fd_sc_hd__decap_4 FILLER_35_204 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_212 ();
 sky130_fd_sc_hd__decap_8 FILLER_35_225 ();
 sky130_fd_sc_hd__fill_1 FILLER_35_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_35_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_35_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_153 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_111 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_125 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_137 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_149 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_161 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_167 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_169 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_181 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_193 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_205 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_217 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_223 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_225 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_109 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_121 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_133 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_139 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_141 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_153 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_159 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_165 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_177 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_189 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_195 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_197 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_209 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_221 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_85 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_105 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_111 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_113 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_121 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_133 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_144 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_156 ();
 sky130_fd_sc_hd__decap_3 FILLER_9_165 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_169 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_173 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_180 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_194 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_206 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_218 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_225 ();
 sky130_fd_sc_hd__decap_3 FILLER_9_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_37 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_64 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_72 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_79 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_91 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_97 ();
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
 sky130_fd_sc_hd__decap_3 PHY_50 ();
 sky130_fd_sc_hd__decap_3 PHY_51 ();
 sky130_fd_sc_hd__decap_3 PHY_52 ();
 sky130_fd_sc_hd__decap_3 PHY_53 ();
 sky130_fd_sc_hd__decap_3 PHY_54 ();
 sky130_fd_sc_hd__decap_3 PHY_55 ();
 sky130_fd_sc_hd__decap_3 PHY_56 ();
 sky130_fd_sc_hd__decap_3 PHY_57 ();
 sky130_fd_sc_hd__decap_3 PHY_58 ();
 sky130_fd_sc_hd__decap_3 PHY_59 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_60 ();
 sky130_fd_sc_hd__decap_3 PHY_61 ();
 sky130_fd_sc_hd__decap_3 PHY_62 ();
 sky130_fd_sc_hd__decap_3 PHY_63 ();
 sky130_fd_sc_hd__decap_3 PHY_64 ();
 sky130_fd_sc_hd__decap_3 PHY_65 ();
 sky130_fd_sc_hd__decap_3 PHY_66 ();
 sky130_fd_sc_hd__decap_3 PHY_67 ();
 sky130_fd_sc_hd__decap_3 PHY_68 ();
 sky130_fd_sc_hd__decap_3 PHY_69 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_70 ();
 sky130_fd_sc_hd__decap_3 PHY_71 ();
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
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_117 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_118 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_119 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_120 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_121 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_122 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_123 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_124 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_125 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_126 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_127 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_128 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_129 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_130 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_131 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_132 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_133 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_134 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_135 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_136 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_137 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_138 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_139 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_140 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_141 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_142 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_143 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_144 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_145 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_146 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_147 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_148 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_149 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_150 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_151 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_152 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_153 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_154 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_155 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_156 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_157 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_158 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_159 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_160 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_161 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_162 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_163 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_164 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_165 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_166 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_167 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_168 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_169 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_170 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_171 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_172 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_173 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_174 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_175 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_176 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_177 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_178 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_179 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_180 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_181 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_182 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_183 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_184 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_185 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_186 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_187 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_188 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_189 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_190 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_191 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_192 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_193 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_194 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_195 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_196 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_197 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_198 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_199 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_200 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_201 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_202 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_203 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_204 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_205 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_206 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_207 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_208 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_209 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_210 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_211 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_212 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_213 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_214 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_215 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_216 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_217 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_218 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_219 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_220 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_221 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_222 ();
 sky130_fd_sc_hd__tapvpwrvgnd_1 TAP_223 ();
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
 sky130_fd_sc_hd__inv_2 _181_ (.A(\dice.bcd[2] ),
    .Y(_054_));
 sky130_fd_sc_hd__inv_2 _182_ (.A(\dice.bcd[0] ),
    .Y(_055_));
 sky130_fd_sc_hd__inv_2 _183_ (.A(net20),
    .Y(_056_));
 sky130_fd_sc_hd__inv_2 _184_ (.A(\dice.clkdiv[5] ),
    .Y(_057_));
 sky130_fd_sc_hd__inv_2 _185_ (.A(\dice.counter[13] ),
    .Y(_058_));
 sky130_fd_sc_hd__inv_2 _186_ (.A(net17),
    .Y(_059_));
 sky130_fd_sc_hd__and2_1 _187_ (.A(\dice.lfsr[1] ),
    .B(\dice.r_counter[1] ),
    .X(_060_));
 sky130_fd_sc_hd__xor2_4 _188_ (.A(\dice.lfsr[1] ),
    .B(\dice.r_counter[1] ),
    .X(_061_));
 sky130_fd_sc_hd__nand2_2 _189_ (.A(\dice.lfsr[0] ),
    .B(\dice.r_counter[0] ),
    .Y(_062_));
 sky130_fd_sc_hd__xor2_2 _190_ (.A(_061_),
    .B(_062_),
    .X(_063_));
 sky130_fd_sc_hd__a31o_1 _191_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.r_counter[0] ),
    .A3(_061_),
    .B1(_060_),
    .X(_064_));
 sky130_fd_sc_hd__xnor2_2 _192_ (.A(\dice.lfsr[2] ),
    .B(\dice.r_counter[2] ),
    .Y(_065_));
 sky130_fd_sc_hd__xnor2_2 _193_ (.A(_064_),
    .B(_065_),
    .Y(_066_));
 sky130_fd_sc_hd__nand2_1 _194_ (.A(_063_),
    .B(_066_),
    .Y(_067_));
 sky130_fd_sc_hd__or3_1 _195_ (.A(net18),
    .B(\dice.counter[1] ),
    .C(\dice.clkdiv[1] ),
    .X(_068_));
 sky130_fd_sc_hd__nand3b_1 _196_ (.A_N(net18),
    .B(\dice.counter[1] ),
    .C(\dice.clkdiv[1] ),
    .Y(_069_));
 sky130_fd_sc_hd__o21ba_1 _197_ (.A1(\dice.counter[6] ),
    .A2(\dice.clkdiv[6] ),
    .B1_N(net18),
    .X(_070_));
 sky130_fd_sc_hd__nand3b_1 _198_ (.A_N(net18),
    .B(\dice.counter[6] ),
    .C(\dice.clkdiv[6] ),
    .Y(_071_));
 sky130_fd_sc_hd__a22o_1 _199_ (.A1(_068_),
    .A2(_069_),
    .B1(_070_),
    .B2(_071_),
    .X(_072_));
 sky130_fd_sc_hd__and2_1 _200_ (.A(net13),
    .B(\dice.counter[12] ),
    .X(_073_));
 sky130_fd_sc_hd__and2_1 _201_ (.A(net13),
    .B(\dice.counter[10] ),
    .X(_074_));
 sky130_fd_sc_hd__nand2b_2 _202_ (.A_N(net18),
    .B(\dice.clkdiv[2] ),
    .Y(_075_));
 sky130_fd_sc_hd__inv_2 _203_ (.A(_075_),
    .Y(_076_));
 sky130_fd_sc_hd__and2_1 _204_ (.A(net13),
    .B(\dice.counter[8] ),
    .X(_077_));
 sky130_fd_sc_hd__and2_1 _205_ (.A(net13),
    .B(\dice.counter[9] ),
    .X(_078_));
 sky130_fd_sc_hd__xor2_1 _206_ (.A(\dice.counter[0] ),
    .B(\dice.clkdiv[0] ),
    .X(_079_));
 sky130_fd_sc_hd__and2b_1 _207_ (.A_N(\dice.clkdiv[2] ),
    .B(\dice.counter[2] ),
    .X(_080_));
 sky130_fd_sc_hd__o41a_1 _208_ (.A1(\dice.counter[14] ),
    .A2(\dice.counter[15] ),
    .A3(_079_),
    .A4(_080_),
    .B1(net14),
    .X(_081_));
 sky130_fd_sc_hd__and2b_1 _209_ (.A_N(\dice.counter[4] ),
    .B(\dice.clkdiv[4] ),
    .X(_082_));
 sky130_fd_sc_hd__nand2b_2 _210_ (.A_N(net18),
    .B(\dice.clkdiv[7] ),
    .Y(_083_));
 sky130_fd_sc_hd__or3b_1 _211_ (.A(net18),
    .B(\dice.clkdiv[4] ),
    .C_N(\dice.counter[4] ),
    .X(_084_));
 sky130_fd_sc_hd__or3b_1 _212_ (.A(net20),
    .B(\dice.clkdiv[7] ),
    .C_N(\dice.counter[7] ),
    .X(_085_));
 sky130_fd_sc_hd__nand2b_2 _213_ (.A_N(net18),
    .B(\dice.counter[3] ),
    .Y(_086_));
 sky130_fd_sc_hd__inv_2 _214_ (.A(_086_),
    .Y(_087_));
 sky130_fd_sc_hd__nand2b_1 _215_ (.A_N(net19),
    .B(\dice.clkdiv[3] ),
    .Y(_088_));
 sky130_fd_sc_hd__mux2_1 _216_ (.A0(\dice.clkdiv[3] ),
    .A1(_088_),
    .S(_086_),
    .X(_089_));
 sky130_fd_sc_hd__and2b_2 _217_ (.A_N(net20),
    .B(\dice.counter[5] ),
    .X(_090_));
 sky130_fd_sc_hd__o41a_2 _218_ (.A1(\dice.counter[8] ),
    .A2(\dice.counter[9] ),
    .A3(\dice.counter[11] ),
    .A4(\dice.counter[13] ),
    .B1(net13),
    .X(_091_));
 sky130_fd_sc_hd__or4b_4 _219_ (.A(_072_),
    .B(_091_),
    .C(_081_),
    .D_N(_089_),
    .X(_092_));
 sky130_fd_sc_hd__o21ai_1 _220_ (.A1(\dice.counter[2] ),
    .A2(_075_),
    .B1(_084_),
    .Y(_093_));
 sky130_fd_sc_hd__a2bb2o_1 _221_ (.A1_N(\dice.counter[7] ),
    .A2_N(_083_),
    .B1(_090_),
    .B2(_057_),
    .X(_094_));
 sky130_fd_sc_hd__o31ai_1 _222_ (.A1(net20),
    .A2(\dice.counter[5] ),
    .A3(_057_),
    .B1(_085_),
    .Y(_095_));
 sky130_fd_sc_hd__o31a_1 _223_ (.A1(\dice.counter[10] ),
    .A2(\dice.counter[12] ),
    .A3(_082_),
    .B1(net13),
    .X(_096_));
 sky130_fd_sc_hd__or4_4 _224_ (.A(_093_),
    .B(_094_),
    .C(_095_),
    .D(_096_),
    .X(_097_));
 sky130_fd_sc_hd__or3b_1 _225_ (.A(\dice.clkdiv[4] ),
    .B(\dice.clkdiv[6] ),
    .C_N(\dice.clkdiv[5] ),
    .X(_098_));
 sky130_fd_sc_hd__or4_1 _226_ (.A(\dice.clkdiv[0] ),
    .B(\dice.clkdiv[1] ),
    .C(\dice.clkdiv[2] ),
    .D(\dice.clkdiv[3] ),
    .X(_099_));
 sky130_fd_sc_hd__nor3_2 _227_ (.A(_083_),
    .B(_098_),
    .C(_099_),
    .Y(_100_));
 sky130_fd_sc_hd__or3_4 _228_ (.A(\dice.clkdiv[2] ),
    .B(\dice.clkdiv[4] ),
    .C(\dice.clkdiv[6] ),
    .X(_101_));
 sky130_fd_sc_hd__and2b_2 _229_ (.A_N(net19),
    .B(\dice.clkdiv[0] ),
    .X(_102_));
 sky130_fd_sc_hd__or3b_4 _230_ (.A(net19),
    .B(\dice.clkdiv[3] ),
    .C_N(\dice.clkdiv[7] ),
    .X(_103_));
 sky130_fd_sc_hd__or3b_4 _231_ (.A(net19),
    .B(\dice.clkdiv[1] ),
    .C_N(\dice.clkdiv[5] ),
    .X(_104_));
 sky130_fd_sc_hd__nor4_4 _232_ (.A(_101_),
    .B(_102_),
    .C(_103_),
    .D(_104_),
    .Y(_105_));
 sky130_fd_sc_hd__or4_4 _233_ (.A(_101_),
    .B(_102_),
    .C(_103_),
    .D(_104_),
    .X(_106_));
 sky130_fd_sc_hd__nor3_4 _234_ (.A(_092_),
    .B(_097_),
    .C(_105_),
    .Y(_107_));
 sky130_fd_sc_hd__or2_1 _235_ (.A(\dice.lfsr[0] ),
    .B(\dice.r_counter[0] ),
    .X(_108_));
 sky130_fd_sc_hd__and2_1 _236_ (.A(_062_),
    .B(_108_),
    .X(_109_));
 sky130_fd_sc_hd__nand2_1 _237_ (.A(_062_),
    .B(_108_),
    .Y(_110_));
 sky130_fd_sc_hd__nand2_1 _238_ (.A(_061_),
    .B(_109_),
    .Y(_111_));
 sky130_fd_sc_hd__or2_2 _239_ (.A(_066_),
    .B(_111_),
    .X(_112_));
 sky130_fd_sc_hd__o31a_1 _240_ (.A1(_092_),
    .A2(_097_),
    .A3(_105_),
    .B1(_054_),
    .X(_113_));
 sky130_fd_sc_hd__a311o_4 _241_ (.A1(_067_),
    .A2(_107_),
    .A3(_112_),
    .B1(_113_),
    .C1(net15),
    .X(_114_));
 sky130_fd_sc_hd__inv_2 _242_ (.A(_114_),
    .Y(_053_));
 sky130_fd_sc_hd__nor2_4 _243_ (.A(net15),
    .B(_107_),
    .Y(_115_));
 sky130_fd_sc_hd__o311a_1 _244_ (.A1(_092_),
    .A2(_097_),
    .A3(_105_),
    .B1(net12),
    .C1(_055_),
    .X(_116_));
 sky130_fd_sc_hd__mux2_2 _245_ (.A0(_109_),
    .A1(_111_),
    .S(_066_),
    .X(_117_));
 sky130_fd_sc_hd__nand2_1 _246_ (.A(_063_),
    .B(_110_),
    .Y(_118_));
 sky130_fd_sc_hd__a211o_1 _247_ (.A1(_063_),
    .A2(_110_),
    .B1(_100_),
    .C1(net16),
    .X(_119_));
 sky130_fd_sc_hd__nor3_2 _248_ (.A(_092_),
    .B(_097_),
    .C(_119_),
    .Y(_120_));
 sky130_fd_sc_hd__a21oi_4 _249_ (.A1(_117_),
    .A2(_120_),
    .B1(_116_),
    .Y(_051_));
 sky130_fd_sc_hd__o31a_1 _250_ (.A1(_092_),
    .A2(_097_),
    .A3(_105_),
    .B1(\dice.bcd[1] ),
    .X(_121_));
 sky130_fd_sc_hd__a31o_4 _251_ (.A1(_107_),
    .A2(_112_),
    .A3(_118_),
    .B1(_121_),
    .X(_122_));
 sky130_fd_sc_hd__nand2_1 _252_ (.A(net11),
    .B(_122_),
    .Y(_123_));
 sky130_fd_sc_hd__inv_2 _253_ (.A(_123_),
    .Y(_052_));
 sky130_fd_sc_hd__nand2_1 _254_ (.A(_114_),
    .B(_052_),
    .Y(_124_));
 sky130_fd_sc_hd__a21o_1 _255_ (.A1(_051_),
    .A2(_123_),
    .B1(_053_),
    .X(_125_));
 sky130_fd_sc_hd__a21bo_1 _256_ (.A1(_053_),
    .A2(_051_),
    .B1_N(_125_),
    .X(_000_));
 sky130_fd_sc_hd__a31o_1 _257_ (.A1(net11),
    .A2(_051_),
    .A3(_122_),
    .B1(_114_),
    .X(_126_));
 sky130_fd_sc_hd__o21bai_1 _258_ (.A1(_051_),
    .A2(_122_),
    .B1_N(_126_),
    .Y(_009_));
 sky130_fd_sc_hd__nand2_1 _259_ (.A(_125_),
    .B(_009_),
    .Y(_001_));
 sky130_fd_sc_hd__o21ba_1 _260_ (.A1(_114_),
    .A2(_122_),
    .B1_N(_051_),
    .X(_002_));
 sky130_fd_sc_hd__o21ai_1 _261_ (.A1(_051_),
    .A2(_122_),
    .B1(_126_),
    .Y(_003_));
 sky130_fd_sc_hd__nand2_1 _262_ (.A(_124_),
    .B(_126_),
    .Y(_004_));
 sky130_fd_sc_hd__or2_1 _263_ (.A(_051_),
    .B(_124_),
    .X(_005_));
 sky130_fd_sc_hd__nor2_1 _264_ (.A(\dice.r_counter[0] ),
    .B(net16),
    .Y(_006_));
 sky130_fd_sc_hd__a21oi_1 _265_ (.A1(\dice.r_counter[1] ),
    .A2(\dice.r_counter[0] ),
    .B1(net16),
    .Y(_127_));
 sky130_fd_sc_hd__o21a_1 _266_ (.A1(\dice.r_counter[1] ),
    .A2(\dice.r_counter[0] ),
    .B1(_127_),
    .X(_007_));
 sky130_fd_sc_hd__a21oi_1 _267_ (.A1(\dice.r_counter[1] ),
    .A2(\dice.r_counter[0] ),
    .B1(\dice.r_counter[2] ),
    .Y(_128_));
 sky130_fd_sc_hd__a31o_1 _268_ (.A1(\dice.r_counter[2] ),
    .A2(\dice.r_counter[1] ),
    .A3(\dice.r_counter[0] ),
    .B1(net16),
    .X(_129_));
 sky130_fd_sc_hd__nor2_1 _269_ (.A(_128_),
    .B(_129_),
    .Y(_008_));
 sky130_fd_sc_hd__a211o_1 _270_ (.A1(net10),
    .A2(net14),
    .B1(net15),
    .C1(_105_),
    .X(_010_));
 sky130_fd_sc_hd__and4bb_2 _271_ (.A_N(_092_),
    .B_N(_097_),
    .C(_102_),
    .D(_106_),
    .X(_130_));
 sky130_fd_sc_hd__nor2_1 _272_ (.A(net15),
    .B(_130_),
    .Y(_131_));
 sky130_fd_sc_hd__o21a_1 _273_ (.A1(_102_),
    .A2(_107_),
    .B1(_131_),
    .X(_011_));
 sky130_fd_sc_hd__or3_1 _274_ (.A(net19),
    .B(\dice.clkdiv[1] ),
    .C(_130_),
    .X(_132_));
 sky130_fd_sc_hd__nand2_1 _275_ (.A(\dice.clkdiv[1] ),
    .B(_130_),
    .Y(_133_));
 sky130_fd_sc_hd__and3_1 _276_ (.A(net12),
    .B(_132_),
    .C(_133_),
    .X(_012_));
 sky130_fd_sc_hd__a31o_1 _277_ (.A1(\dice.clkdiv[1] ),
    .A2(_076_),
    .A3(_130_),
    .B1(net15),
    .X(_134_));
 sky130_fd_sc_hd__a21oi_1 _278_ (.A1(_075_),
    .A2(_133_),
    .B1(_134_),
    .Y(_013_));
 sky130_fd_sc_hd__o21a_1 _279_ (.A1(_075_),
    .A2(_133_),
    .B1(_088_),
    .X(_135_));
 sky130_fd_sc_hd__and4_2 _280_ (.A(\dice.clkdiv[1] ),
    .B(\dice.clkdiv[3] ),
    .C(_076_),
    .D(_130_),
    .X(_136_));
 sky130_fd_sc_hd__nor3_1 _281_ (.A(net15),
    .B(_135_),
    .C(_136_),
    .Y(_014_));
 sky130_fd_sc_hd__a21oi_1 _282_ (.A1(net14),
    .A2(\dice.clkdiv[4] ),
    .B1(_136_),
    .Y(_137_));
 sky130_fd_sc_hd__a211oi_2 _283_ (.A1(\dice.clkdiv[4] ),
    .A2(_136_),
    .B1(_137_),
    .C1(net15),
    .Y(_015_));
 sky130_fd_sc_hd__and4_2 _284_ (.A(net14),
    .B(\dice.clkdiv[4] ),
    .C(\dice.clkdiv[5] ),
    .D(_136_),
    .X(_138_));
 sky130_fd_sc_hd__o2bb2a_1 _285_ (.A1_N(\dice.clkdiv[4] ),
    .A2_N(_136_),
    .B1(_057_),
    .B2(net18),
    .X(_139_));
 sky130_fd_sc_hd__o21ai_1 _286_ (.A1(_138_),
    .A2(_139_),
    .B1(net12),
    .Y(_016_));
 sky130_fd_sc_hd__a21oi_1 _287_ (.A1(net14),
    .A2(\dice.clkdiv[6] ),
    .B1(_138_),
    .Y(_140_));
 sky130_fd_sc_hd__a211oi_1 _288_ (.A1(\dice.clkdiv[6] ),
    .A2(_138_),
    .B1(_140_),
    .C1(net15),
    .Y(_017_));
 sky130_fd_sc_hd__and3_1 _289_ (.A(\dice.clkdiv[6] ),
    .B(_083_),
    .C(_138_),
    .X(_141_));
 sky130_fd_sc_hd__a21oi_1 _290_ (.A1(\dice.clkdiv[6] ),
    .A2(_138_),
    .B1(_083_),
    .Y(_142_));
 sky130_fd_sc_hd__or3_1 _291_ (.A(net15),
    .B(_141_),
    .C(_142_),
    .X(_018_));
 sky130_fd_sc_hd__and2b_1 _292_ (.A_N(net18),
    .B(\dice.counter[0] ),
    .X(_143_));
 sky130_fd_sc_hd__nand2_1 _293_ (.A(_106_),
    .B(_143_),
    .Y(_144_));
 sky130_fd_sc_hd__or2_1 _294_ (.A(_106_),
    .B(_143_),
    .X(_145_));
 sky130_fd_sc_hd__and3_1 _295_ (.A(_115_),
    .B(_144_),
    .C(_145_),
    .X(_019_));
 sky130_fd_sc_hd__nand2_1 _296_ (.A(\dice.counter[1] ),
    .B(_143_),
    .Y(_146_));
 sky130_fd_sc_hd__o21a_1 _297_ (.A1(\dice.counter[0] ),
    .A2(\dice.counter[1] ),
    .B1(net14),
    .X(_147_));
 sky130_fd_sc_hd__o211a_1 _298_ (.A1(_092_),
    .A2(_097_),
    .B1(_146_),
    .C1(_147_),
    .X(_148_));
 sky130_fd_sc_hd__and3_1 _299_ (.A(\dice.counter[0] ),
    .B(_100_),
    .C(_148_),
    .X(_149_));
 sky130_fd_sc_hd__a21oi_1 _300_ (.A1(\dice.counter[0] ),
    .A2(_105_),
    .B1(_148_),
    .Y(_150_));
 sky130_fd_sc_hd__nor3_1 _301_ (.A(net15),
    .B(_149_),
    .C(_150_),
    .Y(_020_));
 sky130_fd_sc_hd__and3_1 _302_ (.A(\dice.counter[1] ),
    .B(\dice.counter[2] ),
    .C(_143_),
    .X(_151_));
 sky130_fd_sc_hd__nand2_1 _303_ (.A(_106_),
    .B(_151_),
    .Y(_152_));
 sky130_fd_sc_hd__a2bb2o_1 _304_ (.A1_N(_146_),
    .A2_N(_100_),
    .B1(\dice.counter[2] ),
    .B2(net14),
    .X(_153_));
 sky130_fd_sc_hd__and3_1 _305_ (.A(_115_),
    .B(_152_),
    .C(_153_),
    .X(_021_));
 sky130_fd_sc_hd__nor2_1 _306_ (.A(_086_),
    .B(_152_),
    .Y(_154_));
 sky130_fd_sc_hd__nand2_1 _307_ (.A(_086_),
    .B(_152_),
    .Y(_155_));
 sky130_fd_sc_hd__and3b_1 _308_ (.A_N(_154_),
    .B(_155_),
    .C(_115_),
    .X(_022_));
 sky130_fd_sc_hd__a21o_1 _309_ (.A1(net14),
    .A2(\dice.counter[4] ),
    .B1(_154_),
    .X(_156_));
 sky130_fd_sc_hd__and4_4 _310_ (.A(\dice.counter[4] ),
    .B(_087_),
    .C(_106_),
    .D(_151_),
    .X(_157_));
 sky130_fd_sc_hd__and3b_1 _311_ (.A_N(_157_),
    .B(_115_),
    .C(_156_),
    .X(_023_));
 sky130_fd_sc_hd__o21ai_1 _312_ (.A1(_090_),
    .A2(_157_),
    .B1(_115_),
    .Y(_158_));
 sky130_fd_sc_hd__a21oi_1 _313_ (.A1(_090_),
    .A2(_157_),
    .B1(_158_),
    .Y(_024_));
 sky130_fd_sc_hd__a22o_1 _314_ (.A1(net13),
    .A2(\dice.counter[6] ),
    .B1(_090_),
    .B2(_157_),
    .X(_159_));
 sky130_fd_sc_hd__and2_1 _315_ (.A(\dice.counter[6] ),
    .B(_090_),
    .X(_160_));
 sky130_fd_sc_hd__and2_1 _316_ (.A(_157_),
    .B(_160_),
    .X(_161_));
 sky130_fd_sc_hd__and3b_1 _317_ (.A_N(_161_),
    .B(_115_),
    .C(_159_),
    .X(_025_));
 sky130_fd_sc_hd__and3_1 _318_ (.A(\dice.counter[7] ),
    .B(_157_),
    .C(_160_),
    .X(_162_));
 sky130_fd_sc_hd__a21o_1 _319_ (.A1(net13),
    .A2(\dice.counter[7] ),
    .B1(_161_),
    .X(_163_));
 sky130_fd_sc_hd__and3b_1 _320_ (.A_N(_162_),
    .B(_163_),
    .C(_115_),
    .X(_026_));
 sky130_fd_sc_hd__and4_2 _321_ (.A(\dice.counter[7] ),
    .B(_077_),
    .C(_157_),
    .D(_160_),
    .X(_164_));
 sky130_fd_sc_hd__inv_2 _322_ (.A(_164_),
    .Y(_165_));
 sky130_fd_sc_hd__o211a_1 _323_ (.A1(_077_),
    .A2(_162_),
    .B1(_165_),
    .C1(_115_),
    .X(_027_));
 sky130_fd_sc_hd__nand2_1 _324_ (.A(\dice.counter[9] ),
    .B(_164_),
    .Y(_166_));
 sky130_fd_sc_hd__o211a_1 _325_ (.A1(_078_),
    .A2(_164_),
    .B1(_166_),
    .C1(net11),
    .X(_028_));
 sky130_fd_sc_hd__a21oi_1 _326_ (.A1(\dice.counter[9] ),
    .A2(_164_),
    .B1(_074_),
    .Y(_167_));
 sky130_fd_sc_hd__and3_1 _327_ (.A(\dice.counter[9] ),
    .B(_074_),
    .C(_164_),
    .X(_168_));
 sky130_fd_sc_hd__nor3_1 _328_ (.A(net17),
    .B(_167_),
    .C(_168_),
    .Y(_029_));
 sky130_fd_sc_hd__a21oi_1 _329_ (.A1(net13),
    .A2(\dice.counter[11] ),
    .B1(_168_),
    .Y(_169_));
 sky130_fd_sc_hd__and4_2 _330_ (.A(\dice.counter[9] ),
    .B(\dice.counter[11] ),
    .C(_074_),
    .D(_164_),
    .X(_170_));
 sky130_fd_sc_hd__nor3_1 _331_ (.A(net17),
    .B(_169_),
    .C(_170_),
    .Y(_030_));
 sky130_fd_sc_hd__or2_1 _332_ (.A(_073_),
    .B(_170_),
    .X(_171_));
 sky130_fd_sc_hd__nand2_1 _333_ (.A(_073_),
    .B(_170_),
    .Y(_172_));
 sky130_fd_sc_hd__and3_1 _334_ (.A(net11),
    .B(_171_),
    .C(_172_),
    .X(_031_));
 sky130_fd_sc_hd__o21ai_1 _335_ (.A1(net20),
    .A2(_058_),
    .B1(_172_),
    .Y(_173_));
 sky130_fd_sc_hd__o211a_1 _336_ (.A1(_058_),
    .A2(_172_),
    .B1(_173_),
    .C1(net11),
    .X(_032_));
 sky130_fd_sc_hd__a31oi_1 _337_ (.A1(\dice.counter[13] ),
    .A2(_073_),
    .A3(_170_),
    .B1(\dice.counter[14] ),
    .Y(_174_));
 sky130_fd_sc_hd__and4_1 _338_ (.A(\dice.counter[13] ),
    .B(\dice.counter[14] ),
    .C(_073_),
    .D(_170_),
    .X(_175_));
 sky130_fd_sc_hd__nor4_1 _339_ (.A(net20),
    .B(net17),
    .C(_174_),
    .D(_175_),
    .Y(_033_));
 sky130_fd_sc_hd__nand2_1 _340_ (.A(net13),
    .B(\dice.counter[15] ),
    .Y(_176_));
 sky130_fd_sc_hd__mux2_1 _341_ (.A0(_176_),
    .A1(\dice.counter[15] ),
    .S(_175_),
    .X(_177_));
 sky130_fd_sc_hd__nor2_1 _342_ (.A(net17),
    .B(_177_),
    .Y(_034_));
 sky130_fd_sc_hd__and2_1 _343_ (.A(\dice.lfsr[1] ),
    .B(net12),
    .X(_035_));
 sky130_fd_sc_hd__or2_1 _344_ (.A(\dice.lfsr[2] ),
    .B(net16),
    .X(_036_));
 sky130_fd_sc_hd__and2_1 _345_ (.A(net12),
    .B(\dice.lfsr[3] ),
    .X(_037_));
 sky130_fd_sc_hd__or2_1 _346_ (.A(net16),
    .B(\dice.lfsr[4] ),
    .X(_038_));
 sky130_fd_sc_hd__or2_1 _347_ (.A(net17),
    .B(\dice.lfsr[5] ),
    .X(_039_));
 sky130_fd_sc_hd__and2_1 _348_ (.A(net11),
    .B(\dice.lfsr[6] ),
    .X(_040_));
 sky130_fd_sc_hd__or2_1 _349_ (.A(net17),
    .B(\dice.lfsr[7] ),
    .X(_041_));
 sky130_fd_sc_hd__or2_1 _350_ (.A(net17),
    .B(\dice.lfsr[8] ),
    .X(_042_));
 sky130_fd_sc_hd__and2_1 _351_ (.A(net11),
    .B(\dice.lfsr[9] ),
    .X(_043_));
 sky130_fd_sc_hd__and2_1 _352_ (.A(net11),
    .B(\dice.lfsr[10] ),
    .X(_044_));
 sky130_fd_sc_hd__a21oi_1 _353_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[11] ),
    .B1(net17),
    .Y(_178_));
 sky130_fd_sc_hd__o21a_1 _354_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[11] ),
    .B1(_178_),
    .X(_045_));
 sky130_fd_sc_hd__and2_1 _355_ (.A(net11),
    .B(\dice.lfsr[12] ),
    .X(_046_));
 sky130_fd_sc_hd__a21oi_1 _356_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[13] ),
    .B1(net16),
    .Y(_179_));
 sky130_fd_sc_hd__o21a_1 _357_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[13] ),
    .B1(_179_),
    .X(_047_));
 sky130_fd_sc_hd__a21oi_1 _358_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[14] ),
    .B1(net16),
    .Y(_180_));
 sky130_fd_sc_hd__o21a_1 _359_ (.A1(\dice.lfsr[0] ),
    .A2(\dice.lfsr[14] ),
    .B1(_180_),
    .X(_048_));
 sky130_fd_sc_hd__and2_1 _360_ (.A(net12),
    .B(\dice.lfsr[15] ),
    .X(_049_));
 sky130_fd_sc_hd__and2_1 _361_ (.A(\dice.lfsr[0] ),
    .B(net11),
    .X(_050_));
 sky130_fd_sc_hd__dfxtp_1 _362_ (.CLK(clknet_2_1__leaf_clk),
    .D(_005_),
    .Q(net5));
 sky130_fd_sc_hd__dfxtp_4 _363_ (.CLK(clknet_2_3__leaf_clk),
    .D(_006_),
    .Q(\dice.r_counter[0] ));
 sky130_fd_sc_hd__dfxtp_4 _364_ (.CLK(clknet_2_3__leaf_clk),
    .D(_007_),
    .Q(\dice.r_counter[1] ));
 sky130_fd_sc_hd__dfxtp_2 _365_ (.CLK(clknet_2_3__leaf_clk),
    .D(_008_),
    .Q(\dice.r_counter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _366_ (.CLK(clknet_2_1__leaf_clk),
    .D(_009_),
    .Q(net4));
 sky130_fd_sc_hd__dfxtp_1 _367_ (.CLK(clknet_2_1__leaf_clk),
    .D(_000_),
    .Q(net3));
 sky130_fd_sc_hd__dfxtp_1 _368_ (.CLK(clknet_2_1__leaf_clk),
    .D(_001_),
    .Q(net6));
 sky130_fd_sc_hd__dfxtp_1 _369_ (.CLK(clknet_2_0__leaf_clk),
    .D(_002_),
    .Q(net7));
 sky130_fd_sc_hd__dfxtp_1 _370_ (.CLK(clknet_2_0__leaf_clk),
    .D(_003_),
    .Q(net8));
 sky130_fd_sc_hd__dfxtp_1 _371_ (.CLK(clknet_2_2__leaf_clk),
    .D(_004_),
    .Q(net9));
 sky130_fd_sc_hd__dfxtp_1 _372_ (.CLK(clknet_2_2__leaf_clk),
    .D(_010_),
    .Q(net10));
 sky130_fd_sc_hd__dfxtp_1 _373_ (.CLK(clknet_2_2__leaf_clk),
    .D(_011_),
    .Q(\dice.clkdiv[0] ));
 sky130_fd_sc_hd__dfxtp_4 _374_ (.CLK(clknet_2_2__leaf_clk),
    .D(_012_),
    .Q(\dice.clkdiv[1] ));
 sky130_fd_sc_hd__dfxtp_1 _375_ (.CLK(clknet_2_2__leaf_clk),
    .D(_013_),
    .Q(\dice.clkdiv[2] ));
 sky130_fd_sc_hd__dfxtp_1 _376_ (.CLK(clknet_2_2__leaf_clk),
    .D(_014_),
    .Q(\dice.clkdiv[3] ));
 sky130_fd_sc_hd__dfxtp_4 _377_ (.CLK(clknet_2_2__leaf_clk),
    .D(_015_),
    .Q(\dice.clkdiv[4] ));
 sky130_fd_sc_hd__dfxtp_1 _378_ (.CLK(clknet_2_2__leaf_clk),
    .D(_016_),
    .Q(\dice.clkdiv[5] ));
 sky130_fd_sc_hd__dfxtp_4 _379_ (.CLK(clknet_2_0__leaf_clk),
    .D(_017_),
    .Q(\dice.clkdiv[6] ));
 sky130_fd_sc_hd__dfxtp_2 _380_ (.CLK(clknet_2_2__leaf_clk),
    .D(_018_),
    .Q(\dice.clkdiv[7] ));
 sky130_fd_sc_hd__dfxtp_2 _381_ (.CLK(clknet_2_2__leaf_clk),
    .D(_019_),
    .Q(\dice.counter[0] ));
 sky130_fd_sc_hd__dfxtp_2 _382_ (.CLK(clknet_2_3__leaf_clk),
    .D(_020_),
    .Q(\dice.counter[1] ));
 sky130_fd_sc_hd__dfxtp_1 _383_ (.CLK(clknet_2_2__leaf_clk),
    .D(_021_),
    .Q(\dice.counter[2] ));
 sky130_fd_sc_hd__dfxtp_1 _384_ (.CLK(clknet_2_2__leaf_clk),
    .D(_022_),
    .Q(\dice.counter[3] ));
 sky130_fd_sc_hd__dfxtp_1 _385_ (.CLK(clknet_2_2__leaf_clk),
    .D(_023_),
    .Q(\dice.counter[4] ));
 sky130_fd_sc_hd__dfxtp_1 _386_ (.CLK(clknet_2_0__leaf_clk),
    .D(_024_),
    .Q(\dice.counter[5] ));
 sky130_fd_sc_hd__dfxtp_2 _387_ (.CLK(clknet_2_0__leaf_clk),
    .D(_025_),
    .Q(\dice.counter[6] ));
 sky130_fd_sc_hd__dfxtp_1 _388_ (.CLK(clknet_2_0__leaf_clk),
    .D(_026_),
    .Q(\dice.counter[7] ));
 sky130_fd_sc_hd__dfxtp_1 _389_ (.CLK(clknet_2_0__leaf_clk),
    .D(_027_),
    .Q(\dice.counter[8] ));
 sky130_fd_sc_hd__dfxtp_2 _390_ (.CLK(clknet_2_0__leaf_clk),
    .D(_028_),
    .Q(\dice.counter[9] ));
 sky130_fd_sc_hd__dfxtp_1 _391_ (.CLK(clknet_2_0__leaf_clk),
    .D(_029_),
    .Q(\dice.counter[10] ));
 sky130_fd_sc_hd__dfxtp_1 _392_ (.CLK(clknet_2_0__leaf_clk),
    .D(_030_),
    .Q(\dice.counter[11] ));
 sky130_fd_sc_hd__dfxtp_1 _393_ (.CLK(clknet_2_0__leaf_clk),
    .D(_031_),
    .Q(\dice.counter[12] ));
 sky130_fd_sc_hd__dfxtp_1 _394_ (.CLK(clknet_2_0__leaf_clk),
    .D(_032_),
    .Q(\dice.counter[13] ));
 sky130_fd_sc_hd__dfxtp_1 _395_ (.CLK(clknet_2_0__leaf_clk),
    .D(_033_),
    .Q(\dice.counter[14] ));
 sky130_fd_sc_hd__dfxtp_1 _396_ (.CLK(clknet_2_0__leaf_clk),
    .D(_034_),
    .Q(\dice.counter[15] ));
 sky130_fd_sc_hd__dfxtp_4 _397_ (.CLK(clknet_2_3__leaf_clk),
    .D(_035_),
    .Q(\dice.lfsr[0] ));
 sky130_fd_sc_hd__dfxtp_2 _398_ (.CLK(clknet_2_3__leaf_clk),
    .D(_036_),
    .Q(\dice.lfsr[1] ));
 sky130_fd_sc_hd__dfxtp_1 _399_ (.CLK(clknet_2_3__leaf_clk),
    .D(_037_),
    .Q(\dice.lfsr[2] ));
 sky130_fd_sc_hd__dfxtp_1 _400_ (.CLK(clknet_2_3__leaf_clk),
    .D(_038_),
    .Q(\dice.lfsr[3] ));
 sky130_fd_sc_hd__dfxtp_1 _401_ (.CLK(clknet_2_3__leaf_clk),
    .D(_039_),
    .Q(\dice.lfsr[4] ));
 sky130_fd_sc_hd__dfxtp_1 _402_ (.CLK(clknet_2_1__leaf_clk),
    .D(_040_),
    .Q(\dice.lfsr[5] ));
 sky130_fd_sc_hd__dfxtp_1 _403_ (.CLK(clknet_2_1__leaf_clk),
    .D(_041_),
    .Q(\dice.lfsr[6] ));
 sky130_fd_sc_hd__dfxtp_1 _404_ (.CLK(clknet_2_1__leaf_clk),
    .D(_042_),
    .Q(\dice.lfsr[7] ));
 sky130_fd_sc_hd__dfxtp_1 _405_ (.CLK(clknet_2_1__leaf_clk),
    .D(_043_),
    .Q(\dice.lfsr[8] ));
 sky130_fd_sc_hd__dfxtp_1 _406_ (.CLK(clknet_2_1__leaf_clk),
    .D(_044_),
    .Q(\dice.lfsr[9] ));
 sky130_fd_sc_hd__dfxtp_1 _407_ (.CLK(clknet_2_1__leaf_clk),
    .D(_045_),
    .Q(\dice.lfsr[10] ));
 sky130_fd_sc_hd__dfxtp_1 _408_ (.CLK(clknet_2_1__leaf_clk),
    .D(_046_),
    .Q(\dice.lfsr[11] ));
 sky130_fd_sc_hd__dfxtp_1 _409_ (.CLK(clknet_2_1__leaf_clk),
    .D(_047_),
    .Q(\dice.lfsr[12] ));
 sky130_fd_sc_hd__dfxtp_1 _410_ (.CLK(clknet_2_3__leaf_clk),
    .D(_048_),
    .Q(\dice.lfsr[13] ));
 sky130_fd_sc_hd__dfxtp_1 _411_ (.CLK(clknet_2_3__leaf_clk),
    .D(_049_),
    .Q(\dice.lfsr[14] ));
 sky130_fd_sc_hd__dfxtp_1 _412_ (.CLK(clknet_2_1__leaf_clk),
    .D(_050_),
    .Q(\dice.lfsr[15] ));
 sky130_fd_sc_hd__dfxtp_1 _413_ (.CLK(clknet_2_3__leaf_clk),
    .D(_051_),
    .Q(\dice.bcd[0] ));
 sky130_fd_sc_hd__dfxtp_1 _414_ (.CLK(clknet_2_3__leaf_clk),
    .D(_052_),
    .Q(\dice.bcd[1] ));
 sky130_fd_sc_hd__dfxtp_1 _415_ (.CLK(clknet_2_1__leaf_clk),
    .D(_053_),
    .Q(\dice.bcd[2] ));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_0__f_clk (.A(clknet_0_clk),
    .X(clknet_2_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_1__f_clk (.A(clknet_0_clk),
    .X(clknet_2_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_2__f_clk (.A(clknet_0_clk),
    .X(clknet_2_2__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_2_3__f_clk (.A(clknet_0_clk),
    .X(clknet_2_3__leaf_clk));
 sky130_fd_sc_hd__clkbuf_4 fanout11 (.A(net12),
    .X(net11));
 sky130_fd_sc_hd__clkbuf_4 fanout12 (.A(_059_),
    .X(net12));
 sky130_fd_sc_hd__clkbuf_4 fanout13 (.A(_056_),
    .X(net13));
 sky130_fd_sc_hd__clkbuf_4 fanout14 (.A(_056_),
    .X(net14));
 sky130_fd_sc_hd__buf_6 fanout15 (.A(net2),
    .X(net15));
 sky130_fd_sc_hd__clkbuf_4 fanout16 (.A(net17),
    .X(net16));
 sky130_fd_sc_hd__clkbuf_8 fanout17 (.A(net2),
    .X(net17));
 sky130_fd_sc_hd__buf_2 fanout18 (.A(net20),
    .X(net18));
 sky130_fd_sc_hd__clkbuf_2 fanout19 (.A(net20),
    .X(net19));
 sky130_fd_sc_hd__buf_4 fanout20 (.A(net1),
    .X(net20));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(io_in),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_2 input2 (.A(rst),
    .X(net2));
 sky130_fd_sc_hd__buf_4 output10 (.A(net10),
    .X(io_out[7]));
 sky130_fd_sc_hd__buf_4 output3 (.A(net3),
    .X(io_out[0]));
 sky130_fd_sc_hd__buf_4 output4 (.A(net4),
    .X(io_out[1]));
 sky130_fd_sc_hd__buf_4 output5 (.A(net5),
    .X(io_out[2]));
 sky130_fd_sc_hd__buf_4 output6 (.A(net6),
    .X(io_out[3]));
 sky130_fd_sc_hd__buf_4 output7 (.A(net7),
    .X(io_out[4]));
 sky130_fd_sc_hd__buf_4 output8 (.A(net8),
    .X(io_out[5]));
 sky130_fd_sc_hd__buf_4 output9 (.A(net9),
    .X(io_out[6]));
endmodule

