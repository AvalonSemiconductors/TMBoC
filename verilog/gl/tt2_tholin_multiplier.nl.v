// This is the unpowered netlist.
module tt2_tholin_multiplier (io_in,
    io_out);
 input [7:0] io_in;
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
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net16;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__diode_2 ANTENNA_input1_A (.DIODE(io_in[0]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input2_A (.DIODE(io_in[1]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input3_A (.DIODE(io_in[2]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input4_A (.DIODE(io_in[3]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input5_A (.DIODE(io_in[4]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input6_A (.DIODE(io_in[5]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input7_A (.DIODE(io_in[6]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input8_A (.DIODE(io_in[7]));
 sky130_fd_sc_hd__decap_4 FILLER_0_19 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_75 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_99 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_38 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_42 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_48 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_65 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_100 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_32 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_44 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_88 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_13 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_25 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_41 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_49 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_69 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_7 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_23 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_93 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_14 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_29 ();
 sky130_fd_sc_hd__decap_3 FILLER_14_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_40 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_52 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_22 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_48 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_77 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_89 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_3 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_41 ();
 sky130_fd_sc_hd__decap_4 FILLER_16_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_16_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_43 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_74 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_86 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_98 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_18_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_18_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_19_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_18 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_25 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_32 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_31 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_22_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_31 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_23 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_102 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_22 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_29 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_36 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_45 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_56 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_64 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_73 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_85 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_94 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_13 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_20 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_31 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_35 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_47 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_54 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_3_65 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_73 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_83 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_9 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_95 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_12 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_19 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_25 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_39 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_47 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_54 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_69 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_101 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_23 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_69 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_5_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_14 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_62 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_74 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_31 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_57 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_65 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_74 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_86 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_98 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_11 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_38 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_50 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_70 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_82 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_97 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_22 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_36 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_9_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_62 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_71 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_83 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_95 ();
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
 sky130_fd_sc_hd__inv_2 _052_ (.A(net5),
    .Y(_000_));
 sky130_fd_sc_hd__inv_2 _053_ (.A(net3),
    .Y(_001_));
 sky130_fd_sc_hd__nand2_1 _054_ (.A(net5),
    .B(net1),
    .Y(_002_));
 sky130_fd_sc_hd__inv_2 _055_ (.A(_002_),
    .Y(net9));
 sky130_fd_sc_hd__a22o_1 _056_ (.A1(net1),
    .A2(net6),
    .B1(net2),
    .B2(net5),
    .X(_003_));
 sky130_fd_sc_hd__nand2_1 _057_ (.A(net6),
    .B(net2),
    .Y(_004_));
 sky130_fd_sc_hd__o21a_1 _058_ (.A1(_002_),
    .A2(_004_),
    .B1(_003_),
    .X(net10));
 sky130_fd_sc_hd__nand2_2 _059_ (.A(net1),
    .B(net7),
    .Y(_005_));
 sky130_fd_sc_hd__nand2_1 _060_ (.A(net5),
    .B(net3),
    .Y(_006_));
 sky130_fd_sc_hd__or4_1 _061_ (.A(_000_),
    .B(_001_),
    .C(_002_),
    .D(_004_),
    .X(_007_));
 sky130_fd_sc_hd__o2111a_4 _062_ (.A1(net1),
    .A2(net3),
    .B1(net6),
    .C1(net5),
    .D1(net2),
    .X(_008_));
 sky130_fd_sc_hd__a21o_1 _063_ (.A1(_004_),
    .A2(_006_),
    .B1(_008_),
    .X(_009_));
 sky130_fd_sc_hd__a21oi_2 _064_ (.A1(_007_),
    .A2(_009_),
    .B1(_005_),
    .Y(_010_));
 sky130_fd_sc_hd__and3_1 _065_ (.A(_005_),
    .B(_007_),
    .C(_009_),
    .X(_011_));
 sky130_fd_sc_hd__nor2_1 _066_ (.A(_010_),
    .B(_011_),
    .Y(net11));
 sky130_fd_sc_hd__nand2_2 _067_ (.A(net7),
    .B(net3),
    .Y(_012_));
 sky130_fd_sc_hd__nand2_2 _068_ (.A(net2),
    .B(net8),
    .Y(_013_));
 sky130_fd_sc_hd__nor2_1 _069_ (.A(_012_),
    .B(_013_),
    .Y(_014_));
 sky130_fd_sc_hd__xnor2_2 _070_ (.A(_012_),
    .B(_013_),
    .Y(_015_));
 sky130_fd_sc_hd__nand2_1 _071_ (.A(net6),
    .B(net4),
    .Y(_016_));
 sky130_fd_sc_hd__a22o_2 _072_ (.A1(net6),
    .A2(net3),
    .B1(net4),
    .B2(net5),
    .X(_017_));
 sky130_fd_sc_hd__nand4_4 _073_ (.A(net5),
    .B(net6),
    .C(net3),
    .D(net4),
    .Y(_018_));
 sky130_fd_sc_hd__nand3_2 _074_ (.A(_008_),
    .B(_017_),
    .C(_018_),
    .Y(_019_));
 sky130_fd_sc_hd__a221o_2 _075_ (.A1(net5),
    .A2(net3),
    .B1(_008_),
    .B2(_017_),
    .C1(_016_),
    .X(_020_));
 sky130_fd_sc_hd__nand3_2 _076_ (.A(_008_),
    .B(_016_),
    .C(_017_),
    .Y(_021_));
 sky130_fd_sc_hd__a21oi_1 _077_ (.A1(_020_),
    .A2(_021_),
    .B1(_015_),
    .Y(_022_));
 sky130_fd_sc_hd__a21o_1 _078_ (.A1(_020_),
    .A2(_021_),
    .B1(_015_),
    .X(_023_));
 sky130_fd_sc_hd__nand3_1 _079_ (.A(_015_),
    .B(_020_),
    .C(_021_),
    .Y(_024_));
 sky130_fd_sc_hd__nor2_1 _080_ (.A(_005_),
    .B(_013_),
    .Y(_025_));
 sky130_fd_sc_hd__or2_1 _081_ (.A(_005_),
    .B(_013_),
    .X(_026_));
 sky130_fd_sc_hd__a22o_1 _082_ (.A1(net2),
    .A2(net7),
    .B1(net8),
    .B2(net1),
    .X(_027_));
 sky130_fd_sc_hd__a21o_1 _083_ (.A1(_017_),
    .A2(_018_),
    .B1(_008_),
    .X(_028_));
 sky130_fd_sc_hd__nand4_2 _084_ (.A(_019_),
    .B(_026_),
    .C(_027_),
    .D(_028_),
    .Y(_029_));
 sky130_fd_sc_hd__a31o_1 _085_ (.A1(_019_),
    .A2(_027_),
    .A3(_028_),
    .B1(_025_),
    .X(_030_));
 sky130_fd_sc_hd__and3_1 _086_ (.A(_023_),
    .B(_024_),
    .C(_030_),
    .X(_031_));
 sky130_fd_sc_hd__a21o_1 _087_ (.A1(_023_),
    .A2(_024_),
    .B1(_030_),
    .X(_032_));
 sky130_fd_sc_hd__and2b_1 _088_ (.A_N(_031_),
    .B(_032_),
    .X(_033_));
 sky130_fd_sc_hd__a22o_1 _089_ (.A1(_026_),
    .A2(_027_),
    .B1(_028_),
    .B2(_019_),
    .X(_034_));
 sky130_fd_sc_hd__and3_1 _090_ (.A(_010_),
    .B(_029_),
    .C(_034_),
    .X(_035_));
 sky130_fd_sc_hd__xor2_1 _091_ (.A(_033_),
    .B(_035_),
    .X(net13));
 sky130_fd_sc_hd__a21boi_2 _092_ (.A1(net4),
    .A2(_008_),
    .B1_N(_018_),
    .Y(_036_));
 sky130_fd_sc_hd__a22oi_2 _093_ (.A1(net3),
    .A2(net8),
    .B1(net4),
    .B2(net7),
    .Y(_037_));
 sky130_fd_sc_hd__and4_1 _094_ (.A(net7),
    .B(net3),
    .C(net8),
    .D(net4),
    .X(_038_));
 sky130_fd_sc_hd__nor2_1 _095_ (.A(_037_),
    .B(_038_),
    .Y(_039_));
 sky130_fd_sc_hd__or3_2 _096_ (.A(_036_),
    .B(_037_),
    .C(_038_),
    .X(_040_));
 sky130_fd_sc_hd__xnor2_1 _097_ (.A(_036_),
    .B(_039_),
    .Y(_041_));
 sky130_fd_sc_hd__or3_1 _098_ (.A(_014_),
    .B(_022_),
    .C(_041_),
    .X(_042_));
 sky130_fd_sc_hd__o21a_1 _099_ (.A1(_014_),
    .A2(_022_),
    .B1(_041_),
    .X(_043_));
 sky130_fd_sc_hd__inv_2 _100_ (.A(_043_),
    .Y(_044_));
 sky130_fd_sc_hd__nand2_1 _101_ (.A(_042_),
    .B(_044_),
    .Y(_045_));
 sky130_fd_sc_hd__a21o_1 _102_ (.A1(_032_),
    .A2(_035_),
    .B1(_031_),
    .X(_046_));
 sky130_fd_sc_hd__xnor2_1 _103_ (.A(_045_),
    .B(_046_),
    .Y(net14));
 sky130_fd_sc_hd__nand2_1 _104_ (.A(net8),
    .B(net4),
    .Y(_047_));
 sky130_fd_sc_hd__a21oi_2 _105_ (.A1(_012_),
    .A2(_040_),
    .B1(_047_),
    .Y(_048_));
 sky130_fd_sc_hd__a21oi_2 _106_ (.A1(_040_),
    .A2(_047_),
    .B1(_048_),
    .Y(_049_));
 sky130_fd_sc_hd__a21o_1 _107_ (.A1(_042_),
    .A2(_046_),
    .B1(_043_),
    .X(_050_));
 sky130_fd_sc_hd__xor2_1 _108_ (.A(_049_),
    .B(_050_),
    .X(net15));
 sky130_fd_sc_hd__a21oi_1 _109_ (.A1(_029_),
    .A2(_034_),
    .B1(_010_),
    .Y(_051_));
 sky130_fd_sc_hd__nor2_1 _110_ (.A(_035_),
    .B(_051_),
    .Y(net12));
 sky130_fd_sc_hd__a21o_1 _111_ (.A1(_049_),
    .A2(_050_),
    .B1(_048_),
    .X(net16));
 sky130_fd_sc_hd__buf_2 input1 (.A(io_in[0]),
    .X(net1));
 sky130_fd_sc_hd__buf_2 input2 (.A(io_in[1]),
    .X(net2));
 sky130_fd_sc_hd__buf_6 input3 (.A(io_in[2]),
    .X(net3));
 sky130_fd_sc_hd__buf_4 input4 (.A(io_in[3]),
    .X(net4));
 sky130_fd_sc_hd__buf_4 input5 (.A(io_in[4]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_4 input6 (.A(io_in[5]),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_4 input7 (.A(io_in[6]),
    .X(net7));
 sky130_fd_sc_hd__clkbuf_4 input8 (.A(io_in[7]),
    .X(net8));
 sky130_fd_sc_hd__buf_4 output10 (.A(net10),
    .X(io_out[1]));
 sky130_fd_sc_hd__buf_4 output11 (.A(net11),
    .X(io_out[2]));
 sky130_fd_sc_hd__buf_4 output12 (.A(net12),
    .X(io_out[3]));
 sky130_fd_sc_hd__buf_4 output13 (.A(net13),
    .X(io_out[4]));
 sky130_fd_sc_hd__buf_4 output14 (.A(net14),
    .X(io_out[5]));
 sky130_fd_sc_hd__buf_4 output15 (.A(net15),
    .X(io_out[6]));
 sky130_fd_sc_hd__buf_4 output16 (.A(net16),
    .X(io_out[7]));
 sky130_fd_sc_hd__buf_4 output9 (.A(net9),
    .X(io_out[0]));
endmodule

