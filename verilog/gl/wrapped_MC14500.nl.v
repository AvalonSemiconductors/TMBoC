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

 wire _000_;
 wire _001_;
 wire _002_;
 wire _003_;
 wire _004_;
 wire _005_;
 wire net10;
 wire net11;
 wire net12;
 wire clknet_0_clk;
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
 wire net8;
 wire \mc14500.IEN_l ;
 wire \mc14500.OEN_l ;
 wire \mc14500.instr[0] ;
 wire \mc14500.instr[1] ;
 wire \mc14500.instr[2] ;
 wire \mc14500.instr[3] ;
 wire \mc14500.skip ;
 wire net1;
 wire net2;
 wire net3;
 wire net4;
 wire net5;
 wire net6;
 wire net7;
 wire net9;
 wire clknet_1_0__leaf_clk;
 wire clknet_1_1__leaf_clk;

 sky130_fd_sc_hd__inv_2 _043_ (.A(\mc14500.instr[1] ),
    .Y(_012_));
 sky130_fd_sc_hd__inv_2 _044_ (.A(\mc14500.instr[3] ),
    .Y(_013_));
 sky130_fd_sc_hd__or2_1 _045_ (.A(_013_),
    .B(\mc14500.instr[2] ),
    .X(_014_));
 sky130_fd_sc_hd__or3_1 _046_ (.A(\mc14500.instr[0] ),
    .B(_012_),
    .C(_014_),
    .X(_015_));
 sky130_fd_sc_hd__mux2_1 _047_ (.A0(net5),
    .A1(\mc14500.IEN_l ),
    .S(_015_),
    .X(_016_));
 sky130_fd_sc_hd__clkbuf_1 _048_ (.A(_016_),
    .X(_011_));
 sky130_fd_sc_hd__nand2_1 _049_ (.A(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .Y(_017_));
 sky130_fd_sc_hd__nor2_1 _050_ (.A(_014_),
    .B(_017_),
    .Y(_018_));
 sky130_fd_sc_hd__mux2_1 _051_ (.A0(\mc14500.OEN_l ),
    .A1(net5),
    .S(_018_),
    .X(_019_));
 sky130_fd_sc_hd__clkbuf_1 _052_ (.A(_019_),
    .X(_010_));
 sky130_fd_sc_hd__or3b_1 _053_ (.A(\mc14500.instr[1] ),
    .B(_014_),
    .C_N(\mc14500.OEN_l ),
    .X(_020_));
 sky130_fd_sc_hd__clkbuf_4 _054_ (.A(_020_),
    .X(io_oeb));
 sky130_fd_sc_hd__inv_2 _055_ (.A(\mc14500.skip ),
    .Y(_021_));
 sky130_fd_sc_hd__or2_2 _056_ (.A(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .X(_022_));
 sky130_fd_sc_hd__nor2_1 _057_ (.A(\mc14500.instr[2] ),
    .B(_022_),
    .Y(_023_));
 sky130_fd_sc_hd__and3_1 _058_ (.A(_013_),
    .B(_021_),
    .C(_023_),
    .X(_024_));
 sky130_fd_sc_hd__buf_2 _059_ (.A(_024_),
    .X(io_out[6]));
 sky130_fd_sc_hd__and2b_1 _060_ (.A_N(\mc14500.instr[0] ),
    .B(\mc14500.instr[1] ),
    .X(_025_));
 sky130_fd_sc_hd__and2b_1 _061_ (.A_N(io_out[3]),
    .B(\mc14500.instr[1] ),
    .X(_026_));
 sky130_fd_sc_hd__and2b_1 _062_ (.A_N(\mc14500.instr[0] ),
    .B(io_out[3]),
    .X(_027_));
 sky130_fd_sc_hd__nand2_1 _063_ (.A(\mc14500.IEN_l ),
    .B(net5),
    .Y(_028_));
 sky130_fd_sc_hd__o221a_1 _064_ (.A1(\mc14500.instr[2] ),
    .A2(_025_),
    .B1(_026_),
    .B2(_027_),
    .C1(_028_),
    .X(_029_));
 sky130_fd_sc_hd__and4b_1 _065_ (.A_N(_026_),
    .B(\mc14500.instr[0] ),
    .C(net5),
    .D(\mc14500.IEN_l ),
    .X(_030_));
 sky130_fd_sc_hd__o221a_1 _066_ (.A1(\mc14500.instr[2] ),
    .A2(_022_),
    .B1(_029_),
    .B2(_030_),
    .C1(_013_),
    .X(_031_));
 sky130_fd_sc_hd__and3_1 _067_ (.A(\mc14500.instr[2] ),
    .B(_017_),
    .C(_022_),
    .X(_032_));
 sky130_fd_sc_hd__o31a_1 _068_ (.A1(\mc14500.instr[3] ),
    .A2(_023_),
    .A3(_032_),
    .B1(io_out[3]),
    .X(_033_));
 sky130_fd_sc_hd__o21ba_1 _069_ (.A1(_031_),
    .A2(_033_),
    .B1_N(net6),
    .X(_000_));
 sky130_fd_sc_hd__inv_2 _070_ (.A(io_out[3]),
    .Y(_034_));
 sky130_fd_sc_hd__a41o_1 _071_ (.A1(\mc14500.instr[3] ),
    .A2(\mc14500.instr[2] ),
    .A3(_034_),
    .A4(_025_),
    .B1(net6),
    .X(_005_));
 sky130_fd_sc_hd__inv_2 _090__3 (.A(clknet_1_1__leaf_clk),
    .Y(net10));
 sky130_fd_sc_hd__nor2_2 _073_ (.A(net9),
    .B(io_oeb),
    .Y(io_out[2]));
 sky130_fd_sc_hd__and2_1 _074_ (.A(_021_),
    .B(net1),
    .X(_035_));
 sky130_fd_sc_hd__clkbuf_1 _075_ (.A(_035_),
    .X(_001_));
 sky130_fd_sc_hd__and2_1 _076_ (.A(_021_),
    .B(net2),
    .X(_036_));
 sky130_fd_sc_hd__clkbuf_1 _077_ (.A(_036_),
    .X(_002_));
 sky130_fd_sc_hd__and2_1 _078_ (.A(_021_),
    .B(net3),
    .X(_037_));
 sky130_fd_sc_hd__clkbuf_1 _079_ (.A(_037_),
    .X(_003_));
 sky130_fd_sc_hd__and2_1 _080_ (.A(_021_),
    .B(net4),
    .X(_038_));
 sky130_fd_sc_hd__clkbuf_1 _081_ (.A(_038_),
    .X(_004_));
 sky130_fd_sc_hd__o21ai_1 _082_ (.A1(io_out[3]),
    .A2(_022_),
    .B1(\mc14500.OEN_l ),
    .Y(_039_));
 sky130_fd_sc_hd__a21oi_4 _083_ (.A1(io_out[3]),
    .A2(_022_),
    .B1(_039_),
    .Y(io_out[0]));
 sky130_fd_sc_hd__and4_1 _084_ (.A(\mc14500.instr[3] ),
    .B(\mc14500.instr[2] ),
    .C(\mc14500.instr[0] ),
    .D(\mc14500.instr[1] ),
    .X(_040_));
 sky130_fd_sc_hd__buf_2 _085_ (.A(_040_),
    .X(io_out[7]));
 sky130_fd_sc_hd__and4_1 _086_ (.A(\mc14500.instr[3] ),
    .B(\mc14500.instr[2] ),
    .C(\mc14500.instr[0] ),
    .D(_012_),
    .X(_041_));
 sky130_fd_sc_hd__buf_2 _087_ (.A(_041_),
    .X(io_out[5]));
 sky130_fd_sc_hd__and4b_1 _088_ (.A_N(\mc14500.instr[0] ),
    .B(_012_),
    .C(\mc14500.instr[3] ),
    .D(\mc14500.instr[2] ),
    .X(_042_));
 sky130_fd_sc_hd__buf_2 _089_ (.A(_042_),
    .X(io_out[4]));
 sky130_fd_sc_hd__inv_2 _091__4 (.A(clknet_1_1__leaf_clk),
    .Y(net11));
 sky130_fd_sc_hd__inv_2 _092__5 (.A(clknet_1_1__leaf_clk),
    .Y(net12));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_0_clk (.A(clk),
    .X(clknet_0_clk));
 sky130_fd_sc_hd__dfxtp_1 _093_ (.CLK(net8),
    .D(_010_),
    .Q(\mc14500.OEN_l ));
 sky130_fd_sc_hd__dfxtp_1 _094_ (.CLK(clknet_1_0__leaf_clk),
    .D(_001_),
    .Q(\mc14500.instr[0] ));
 sky130_fd_sc_hd__dfxtp_1 _095_ (.CLK(clknet_1_0__leaf_clk),
    .D(_002_),
    .Q(\mc14500.instr[1] ));
 sky130_fd_sc_hd__dfxtp_1 _096_ (.CLK(clknet_1_1__leaf_clk),
    .D(_003_),
    .Q(\mc14500.instr[2] ));
 sky130_fd_sc_hd__dfxtp_1 _097_ (.CLK(clknet_1_1__leaf_clk),
    .D(_004_),
    .Q(\mc14500.instr[3] ));
 sky130_fd_sc_hd__dfxtp_4 _098_ (.CLK(net10),
    .D(_000_),
    .Q(io_out[3]));
 sky130_fd_sc_hd__dfxtp_1 _099_ (.CLK(net11),
    .D(_011_),
    .Q(\mc14500.IEN_l ));
 sky130_fd_sc_hd__dfxtp_1 _100_ (.CLK(net12),
    .D(_005_),
    .Q(\mc14500.skip ));
 sky130_fd_sc_hd__inv_2 _072__1 (.A(clknet_1_0__leaf_clk),
    .Y(net8));
 sky130_fd_sc_hd__buf_2 _102_ (.A(clknet_1_0__leaf_clk),
    .X(io_out[1]));
 sky130_fd_sc_hd__decap_3 PHY_0 ();
 sky130_fd_sc_hd__decap_3 PHY_1 ();
 sky130_fd_sc_hd__decap_3 PHY_2 ();
 sky130_fd_sc_hd__decap_3 PHY_3 ();
 sky130_fd_sc_hd__decap_3 PHY_4 ();
 sky130_fd_sc_hd__decap_3 PHY_5 ();
 sky130_fd_sc_hd__decap_3 PHY_6 ();
 sky130_fd_sc_hd__decap_3 PHY_7 ();
 sky130_fd_sc_hd__decap_3 PHY_8 ();
 sky130_fd_sc_hd__decap_3 PHY_9 ();
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
 sky130_fd_sc_hd__clkbuf_1 input1 (.A(io_in[0]),
    .X(net1));
 sky130_fd_sc_hd__clkbuf_1 input2 (.A(io_in[1]),
    .X(net2));
 sky130_fd_sc_hd__clkbuf_1 input3 (.A(io_in[2]),
    .X(net3));
 sky130_fd_sc_hd__clkbuf_1 input4 (.A(io_in[3]),
    .X(net4));
 sky130_fd_sc_hd__dlymetal6s2s_1 input5 (.A(io_in[4]),
    .X(net5));
 sky130_fd_sc_hd__clkbuf_1 input6 (.A(rst),
    .X(net6));
 sky130_fd_sc_hd__conb_1 wrapped_MC14500_7 (.LO(net7));
 sky130_fd_sc_hd__inv_2 _072__2 (.A(clknet_1_0__leaf_clk),
    .Y(net9));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_0__f_clk (.A(clknet_0_clk),
    .X(clknet_1_0__leaf_clk));
 sky130_fd_sc_hd__clkbuf_16 clkbuf_1_1__f_clk (.A(clknet_0_clk),
    .X(clknet_1_1__leaf_clk));
 sky130_fd_sc_hd__diode_2 ANTENNA_clkbuf_0_clk_A (.DIODE(clk));
 sky130_fd_sc_hd__diode_2 ANTENNA_input1_A (.DIODE(io_in[0]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input2_A (.DIODE(io_in[1]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input3_A (.DIODE(io_in[2]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input4_A (.DIODE(io_in[3]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input5_A (.DIODE(io_in[4]));
 sky130_fd_sc_hd__diode_2 ANTENNA_input6_A (.DIODE(rst));
 sky130_fd_sc_hd__decap_4 FILLER_0_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_11 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_26 ();
 sky130_fd_sc_hd__decap_8 FILLER_0_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_44 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_54 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_57 ();
 sky130_fd_sc_hd__decap_4 FILLER_0_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_0_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_0_85 ();
 sky130_fd_sc_hd__fill_1 FILLER_0_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_0_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_25 ();
 sky130_fd_sc_hd__decap_4 FILLER_1_45 ();
 sky130_fd_sc_hd__decap_3 FILLER_1_53 ();
 sky130_fd_sc_hd__fill_2 FILLER_1_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_61 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_73 ();
 sky130_ef_sc_hd__decap_12 FILLER_1_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_1_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_2_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_11 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_22 ();
 sky130_fd_sc_hd__fill_2 FILLER_2_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_44 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_55 ();
 sky130_fd_sc_hd__decap_4 FILLER_2_63 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_2_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_2_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_2_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_25 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_38 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_50 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_57 ();
 sky130_fd_sc_hd__fill_1 FILLER_3_61 ();
 sky130_fd_sc_hd__decap_4 FILLER_3_66 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_73 ();
 sky130_ef_sc_hd__decap_12 FILLER_3_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_3_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_4_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_11 ();
 sky130_fd_sc_hd__fill_2 FILLER_4_19 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_24 ();
 sky130_fd_sc_hd__decap_8 FILLER_4_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_42 ();
 sky130_fd_sc_hd__decap_4 FILLER_4_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_60 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_72 ();
 sky130_ef_sc_hd__decap_12 FILLER_4_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_4_97 ();
 sky130_fd_sc_hd__decap_6 FILLER_5_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_26 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_33 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_42 ();
 sky130_fd_sc_hd__decap_4 FILLER_5_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_5_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_5_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_64 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_76 ();
 sky130_ef_sc_hd__decap_12 FILLER_5_88 ();
 sky130_fd_sc_hd__decap_3 FILLER_5_100 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_12 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_21 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_6_29 ();
 sky130_fd_sc_hd__decap_8 FILLER_6_33 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_48 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_67 ();
 sky130_fd_sc_hd__decap_4 FILLER_6_79 ();
 sky130_fd_sc_hd__fill_1 FILLER_6_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_6_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_6_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_3 ();
 sky130_fd_sc_hd__decap_6 FILLER_7_8 ();
 sky130_fd_sc_hd__decap_4 FILLER_7_17 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_7_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_7_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_7_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_7_101 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_8_9 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_8_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_8_40 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_49 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_61 ();
 sky130_fd_sc_hd__decap_8 FILLER_8_73 ();
 sky130_fd_sc_hd__decap_3 FILLER_8_81 ();
 sky130_ef_sc_hd__decap_12 FILLER_8_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_8_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_3 ();
 sky130_fd_sc_hd__decap_8 FILLER_9_7 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_36 ();
 sky130_fd_sc_hd__decap_6 FILLER_9_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_55 ();
 sky130_fd_sc_hd__fill_2 FILLER_9_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_62 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_74 ();
 sky130_ef_sc_hd__decap_12 FILLER_9_86 ();
 sky130_fd_sc_hd__decap_4 FILLER_9_98 ();
 sky130_fd_sc_hd__fill_1 FILLER_9_102 ();
 sky130_fd_sc_hd__decap_3 FILLER_10_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_9 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_16 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_26 ();
 sky130_fd_sc_hd__fill_2 FILLER_10_29 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_37 ();
 sky130_fd_sc_hd__decap_4 FILLER_10_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_60 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_72 ();
 sky130_ef_sc_hd__decap_12 FILLER_10_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_10_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_3 ();
 sky130_fd_sc_hd__decap_3 FILLER_11_15 ();
 sky130_fd_sc_hd__decap_4 FILLER_11_37 ();
 sky130_fd_sc_hd__decap_6 FILLER_11_49 ();
 sky130_fd_sc_hd__fill_1 FILLER_11_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_11_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_11_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_11_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_8 ();
 sky130_fd_sc_hd__decap_4 FILLER_12_14 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_18 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_22 ();
 sky130_fd_sc_hd__decap_8 FILLER_12_29 ();
 sky130_fd_sc_hd__fill_2 FILLER_12_37 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_47 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_59 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_12_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_12_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_12_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_13_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_13_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_18 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_42 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_54 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_13_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_13_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_13_101 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_9 ();
 sky130_fd_sc_hd__fill_2 FILLER_14_26 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_29 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_35 ();
 sky130_fd_sc_hd__decap_4 FILLER_14_44 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_51 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_63 ();
 sky130_fd_sc_hd__decap_8 FILLER_14_75 ();
 sky130_fd_sc_hd__fill_1 FILLER_14_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_14_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_14_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_3 ();
 sky130_fd_sc_hd__fill_1 FILLER_15_15 ();
 sky130_fd_sc_hd__decap_6 FILLER_15_32 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_15_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_15_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_15_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_15_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_27 ();
 sky130_fd_sc_hd__fill_2 FILLER_16_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_47 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_59 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_71 ();
 sky130_fd_sc_hd__fill_1 FILLER_16_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_16_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_16_97 ();
 sky130_fd_sc_hd__decap_3 FILLER_17_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_17_11 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_18 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_30 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_35 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_47 ();
 sky130_fd_sc_hd__fill_1 FILLER_17_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_17_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_17_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_17_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_18_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_18_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_18_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_3 ();
 sky130_fd_sc_hd__decap_4 FILLER_19_8 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_14 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_26 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_38 ();
 sky130_fd_sc_hd__decap_6 FILLER_19_50 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_19_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_19_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_19_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_20_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_20_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_20_97 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_15 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_39 ();
 sky130_fd_sc_hd__decap_4 FILLER_21_51 ();
 sky130_fd_sc_hd__fill_1 FILLER_21_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_21_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_21_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_21_101 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_41 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_65 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_77 ();
 sky130_fd_sc_hd__fill_1 FILLER_22_83 ();
 sky130_ef_sc_hd__decap_12 FILLER_22_85 ();
 sky130_fd_sc_hd__decap_6 FILLER_22_97 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_7 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_19 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_31 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_43 ();
 sky130_fd_sc_hd__fill_1 FILLER_23_55 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_69 ();
 sky130_ef_sc_hd__decap_12 FILLER_23_81 ();
 sky130_fd_sc_hd__decap_8 FILLER_23_93 ();
 sky130_fd_sc_hd__fill_2 FILLER_23_101 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_3 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_15 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_27 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_29 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_41 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_53 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_57 ();
 sky130_ef_sc_hd__decap_12 FILLER_24_69 ();
 sky130_fd_sc_hd__decap_3 FILLER_24_81 ();
 sky130_fd_sc_hd__fill_2 FILLER_24_85 ();
 sky130_fd_sc_hd__decap_4 FILLER_24_90 ();
 sky130_fd_sc_hd__decap_6 FILLER_24_96 ();
 sky130_fd_sc_hd__fill_1 FILLER_24_102 ();
 assign io_out[8] = net7;
endmodule

