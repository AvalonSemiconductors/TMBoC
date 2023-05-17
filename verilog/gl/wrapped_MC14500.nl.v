// This is the unpowered netlist.
module wrapped_MC14500 (clk,
    io_oeb,
    rst,
    io_in,
    io_out);
 input clk;
 output io_oeb;
 input rst;
 input [4:0] io_in;
 output [8:0] io_out;

 wire net16;
 wire _00_;
 wire _01_;
 wire _02_;
 wire _03_;
 wire _04_;
 wire _05_;
 wire _10_;
 wire _11_;
 wire _12_;
 wire _13_;
 wire _14_;
 wire _15_;
 wire _16_;
 wire _17_;
 wire _18_;
 wire _19_;
 wire _20_;
 wire _21_;
 wire _22_;
 wire _23_;
 wire _24_;
 wire _25_;
 wire _26_;
 wire _27_;
 wire _28_;
 wire _29_;
 wire _30_;
 wire _31_;
 wire clknet_0_clk;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;
 wire \mc14500.IEN_l ;
 wire \mc14500.OEN_l ;
 wire \mc14500.instr[0] ;
 wire \mc14500.instr[1] ;
 wire \mc14500.instr[2] ;
 wire \mc14500.instr[3] ;
 wire \mc14500.skip ;
 wire net1;
 wire net10;
 wire net11;
 wire net12;
 wire net13;
 wire net14;
 wire net15;
 wire net17;
 wire net18;
 wire net19;
 wire net2;
 wire net20;
 wire net21;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net8;
 wire net9;

 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_0_clk_A (.DIODE(clk));
 sky130_fd_sc_hd__diode_2 ANTENNA_input1_A (.DIODE(io_in[0]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input2_A (.DIODE(io_in[1]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input3_A (.DIODE(io_in[2]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input4_A (.DIODE(io_in[3]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input5_A (.DIODE(io_in[4]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input6_A (.DIODE(rst));
 sky130_fd_sc_hd__fill_2 FILLER_0_101 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_11 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_19 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_33 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_40 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_46 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_53 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_57 ();
 sky130_fd_sc_hd__decap_6 FILLER_0_66 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_72 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_83 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_93 ();
 sky130_fd_sc_hd__decap_8 FILLER_10_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_26 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_10_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_46 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_67 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_80 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_92 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_34 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_46 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_58 ();
 sky130_fd_sc_hd__decap_3 FILLER_12_81 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_13_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_67 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_79 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_91 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_41 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_59 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_63 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_97 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_15_75 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_94 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_41 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_53 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_59 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_55 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_88 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_3 ();
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
 sky130_fd_sc_hd__decap_8 FILLER_19_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_89 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_12 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_36 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_1_66 ();
 sky130_fd_sc_hd__fill_1 FILLER_1_7 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_74 ();
 sky130_fd_sc_hd__decap_8 FILLER_1_81 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_91 ();
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
 sky130_ef_sc_hd__decap_12 FILLER_21_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_93 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_23_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_81 ();
 sky130_fd_sc_hd__decap_6 FILLER_23_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_57 ();
 sky130_fd_sc_hd__decap_8 FILLER_24_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_77 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_82 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_91 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_101 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_24 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_2_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_47 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_59 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_63 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_3_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_17 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_25 ();
 sky130_fd_sc_hd__decap_8 FILLER_3_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_42 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_55 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_68 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_79 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_91 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_15 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_26 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_36 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_40 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_44 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_53 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_4_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_5_100 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_31 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_35 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_47 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_52 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_88 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_41 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_49 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_55 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_67 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_75 ();
 sky130_fd_sc_hd__decap_3 FILLER_6_81 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_93 ();
 sky130_fd_sc_hd__fill_1 FILLER_7_102 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_7_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_54 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_82 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_94 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_27 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_33 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_43 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_67 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_97 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_15 ();
 sky130_fd_sc_hd__decap_3 FILLER_9_23 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_68 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_75 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_87 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_99 ();
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
 sky130_fd_sc_hd__inv_2 _32_ (.A(\mc14500.instr[3] ),
    .Y(_12_));
 sky130_fd_sc_hd__inv_2 _33_ (.A(\mc14500.instr[1] ),
    .Y(_13_));
 sky130_fd_sc_hd__inv_2 _34_ (.A(\mc14500.skip ),
    .Y(_14_));
 sky130_fd_sc_hd__inv_2 _35_ (.A(net11),
    .Y(_15_));
 sky130_fd_sc_hd__inv_2 _36__1 (.A(clknet_1_0__leaf_clk),
    .Y(net17));
 sky130_fd_sc_hd__inv_2 _36__2 (.A(clknet_1_0__leaf_clk),
    .Y(net18));
 sky130_fd_sc_hd__and2b_1 _37_ (.A_N(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .X(_16_));
 sky130_fd_sc_hd__or2_1 _38_ (.A(_12_),
    .B(\mc14500.instr[2] ),
    .X(_17_));
 sky130_fd_sc_hd__or3_1 _39_ (.A(\mc14500.instr[0] ),
    .B(_13_),
    .C(_17_),
    .X(_18_));
 sky130_fd_sc_hd__mux2_1 _40_ (.A0(net5),
    .A1(\mc14500.IEN_l ),
    .S(_18_),
    .X(_11_));
 sky130_fd_sc_hd__nand2_1 _41_ (.A(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .Y(_19_));
 sky130_fd_sc_hd__nor2_1 _42_ (.A(_17_),
    .B(_19_),
    .Y(_20_));
 sky130_fd_sc_hd__mux2_1 _43_ (.A0(\mc14500.OEN_l ),
    .A1(net5),
    .S(_20_),
    .X(_10_));
 sky130_fd_sc_hd__or3b_4 _44_ (.A(\mc14500.instr[1] ),
    .B(_17_),
    .C_N(\mc14500.OEN_l ),
    .X(net7));
 sky130_fd_sc_hd__or2_2 _45_ (.A(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .X(_21_));
 sky130_fd_sc_hd__nor2_1 _46_ (.A(\mc14500.instr[2] ),
    .B(_21_),
    .Y(_22_));
 sky130_fd_sc_hd__and3_1 _47_ (.A(_12_),
    .B(_14_),
    .C(_22_),
    .X(net14));
 sky130_fd_sc_hd__and2b_1 _48_ (.A_N(net11),
    .B(\mc14500.instr[1] ),
    .X(_23_));
 sky130_fd_sc_hd__and2b_1 _49_ (.A_N(\mc14500.instr[0] ),
    .B(net11),
    .X(_24_));
 sky130_fd_sc_hd__nand2_1 _50_ (.A(\mc14500.IEN_l ),
    .B(net5),
    .Y(_25_));
 sky130_fd_sc_hd__o221a_1 _51_ (.A1(\mc14500.instr[2] ),
    .A2(_16_),
    .B1(_23_),
    .B2(_24_),
    .C1(_25_),
    .X(_26_));
 sky130_fd_sc_hd__and4b_1 _52_ (.A_N(_23_),
    .B(\mc14500.instr[0] ),
    .C(net5),
    .D(\mc14500.IEN_l ),
    .X(_27_));
 sky130_fd_sc_hd__o221a_1 _53_ (.A1(\mc14500.instr[2] ),
    .A2(_21_),
    .B1(_26_),
    .B2(_27_),
    .C1(_12_),
    .X(_28_));
 sky130_fd_sc_hd__and3_1 _54_ (.A(\mc14500.instr[2] ),
    .B(_19_),
    .C(_21_),
    .X(_29_));
 sky130_fd_sc_hd__o31a_1 _55_ (.A1(\mc14500.instr[3] ),
    .A2(_22_),
    .A3(_29_),
    .B1(net11),
    .X(_30_));
 sky130_fd_sc_hd__o21ba_1 _56_ (.A1(_28_),
    .A2(_30_),
    .B1_N(net6),
    .X(_00_));
 sky130_fd_sc_hd__a41o_1 _57_ (.A1(\mc14500.instr[3] ),
    .A2(\mc14500.instr[2] ),
    .A3(_15_),
    .A4(_16_),
    .B1(net6),
    .X(_05_));
 sky130_fd_sc_hd__nor2_2 _58_ (.A(net18),
    .B(net7),
    .Y(net10));
 sky130_fd_sc_hd__and2_1 _59_ (.A(_14_),
    .B(net1),
    .X(_01_));
 sky130_fd_sc_hd__and2_1 _60_ (.A(_14_),
    .B(net2),
    .X(_02_));
 sky130_fd_sc_hd__and2_1 _61_ (.A(_14_),
    .B(net3),
    .X(_03_));
 sky130_fd_sc_hd__and2_1 _62_ (.A(_14_),
    .B(net4),
    .X(_04_));
 sky130_fd_sc_hd__o21ai_1 _63_ (.A1(net11),
    .A2(_21_),
    .B1(\mc14500.OEN_l ),
    .Y(_31_));
 sky130_fd_sc_hd__a21oi_1 _64_ (.A1(net11),
    .A2(_21_),
    .B1(_31_),
    .Y(net8));
 sky130_fd_sc_hd__and4_1 _65_ (.A(\mc14500.instr[3] ),
    .B(\mc14500.instr[2] ),
    .C(\mc14500.instr[0] ),
    .D(\mc14500.instr[1] ),
    .X(net15));
 sky130_fd_sc_hd__and4_1 _66_ (.A(\mc14500.instr[3] ),
    .B(\mc14500.instr[2] ),
    .C(\mc14500.instr[0] ),
    .D(_13_),
    .X(net13));
 sky130_fd_sc_hd__and4b_1 _67_ (.A_N(\mc14500.instr[0] ),
    .B(_13_),
    .C(\mc14500.instr[3] ),
    .D(\mc14500.instr[2] ),
    .X(net12));
 sky130_fd_sc_hd__inv_2 _68__3 (.A(clknet_1_1__leaf_clk),
    .Y(net19));
 sky130_fd_sc_hd__inv_2 _69__4 (.A(clknet_1_1__leaf_clk),
    .Y(net20));
 sky130_fd_sc_hd__inv_2 _70__5 (.A(clknet_1_1__leaf_clk),
    .Y(net21));
 sky130_fd_sc_hd__dfxtp_1 _71_ (.CLK(net17),
    .D(_10_),
    .Q(\mc14500.OEN_l ));
 sky130_fd_sc_hd__dfxtp_2 _72_ (.CLK(clknet_1_0__leaf_clk),
    .D(_01_),
    .Q(\mc14500.instr[0] ));
 sky130_fd_sc_hd__dfxtp_2 _73_ (.CLK(clknet_1_0__leaf_clk),
    .D(_02_),
    .Q(\mc14500.instr[1] ));
 sky130_fd_sc_hd__dfxtp_2 _74_ (.CLK(clknet_1_1__leaf_clk),
    .D(_03_),
    .Q(\mc14500.instr[2] ));
 sky130_fd_sc_hd__dfxtp_2 _75_ (.CLK(clknet_1_1__leaf_clk),
    .D(_04_),
    .Q(\mc14500.instr[3] ));
 sky130_fd_sc_hd__dfxtp_4 _76_ (.CLK(net19),
    .D(_00_),
    .Q(net11));
 sky130_fd_sc_hd__dfxtp_1 _77_ (.CLK(net20),
    .D(_11_),
    .Q(\mc14500.IEN_l ));
 sky130_fd_sc_hd__dfxtp_1 _78_ (.CLK(net21),
    .D(_05_),
    .Q(\mc14500.skip ));
 sky130_fd_sc_hd__buf_2 _80_ (.A(clknet_1_0__leaf_clk),
    .X(net9));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__clkbuf_2 input1 (.A(io_in[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_2 input2 (.A(io_in[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_2 input3 (.A(io_in[2]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_2 input4 (.A(io_in[3]),
    .X(net4));
 sky130_fd_sc_hd__clkbuf_2 input5 (.A(io_in[4]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_2 input6 (.A(rst),
    .X(net6));
 sky130_fd_sc_hd__clkbuf_2 output10 (.A(net10),
    .X(io_out[2]));
 sky130_fd_sc_hd__buf_4 output11 (.A(net11),
    .X(io_out[3]));
 sky130_fd_sc_hd__buf_4 output12 (.A(net12),
    .X(io_out[4]));
 sky130_fd_sc_hd__buf_4 output13 (.A(net13),
    .X(io_out[5]));
 sky130_fd_sc_hd__buf_4 output14 (.A(net14),
    .X(io_out[6]));
 sky130_fd_sc_hd__buf_4 output15 (.A(net15),
    .X(io_out[7]));
 sky130_fd_sc_hd__buf_4 output7 (.A(net7),
    .X(io_oeb));
 sky130_fd_sc_hd__buf_4 output8 (.A(net8),
    .X(io_out[0]));
 sky130_fd_sc_hd__clkbuf_2 output9 (.A(net9),
    .X(io_out[1]));
 sky130_fd_sc_hd__conb_1 wrapped_MC14500_16 (.LO(net16));
 assign io_out[8] = net16;
endmodule

