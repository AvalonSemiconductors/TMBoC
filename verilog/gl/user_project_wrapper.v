module user_project_wrapper (user_clock2,
    vccd1,
    vccd2,
    vdda1,
    vdda2,
    vssa1,
    vssa2,
    vssd1,
    vssd2,
    wb_clk_i,
    wb_rst_i,
    wbs_ack_o,
    wbs_cyc_i,
    wbs_stb_i,
    wbs_we_i,
    analog_io,
    io_in,
    io_oeb,
    io_out,
    la_data_in,
    la_data_out,
    la_oenb,
    user_irq,
    wbs_adr_i,
    wbs_dat_i,
    wbs_dat_o,
    wbs_sel_i);
 input user_clock2;
 input vccd1;
 input vccd2;
 input vdda1;
 input vdda2;
 input vssa1;
 input vssa2;
 input vssd1;
 input vssd2;
 input wb_clk_i;
 input wb_rst_i;
 output wbs_ack_o;
 input wbs_cyc_i;
 input wbs_stb_i;
 input wbs_we_i;
 inout [28:0] analog_io;
 input [37:0] io_in;
 output [37:0] io_oeb;
 output [37:0] io_out;
 input [127:0] la_data_in;
 output [127:0] la_data_out;
 input [127:0] la_oenb;
 output [2:0] user_irq;
 input [31:0] wbs_adr_i;
 input [31:0] wbs_dat_i;
 output [31:0] wbs_dat_o;
 input [3:0] wbs_sel_i;

 wire design_clk;
 wire \dsi_all[0] ;
 wire \dsi_all[10] ;
 wire \dsi_all[11] ;
 wire \dsi_all[12] ;
 wire \dsi_all[13] ;
 wire \dsi_all[14] ;
 wire \dsi_all[15] ;
 wire \dsi_all[16] ;
 wire \dsi_all[17] ;
 wire \dsi_all[18] ;
 wire \dsi_all[19] ;
 wire \dsi_all[1] ;
 wire \dsi_all[20] ;
 wire \dsi_all[21] ;
 wire \dsi_all[22] ;
 wire \dsi_all[23] ;
 wire \dsi_all[24] ;
 wire \dsi_all[25] ;
 wire \dsi_all[26] ;
 wire \dsi_all[27] ;
 wire \dsi_all[2] ;
 wire \dsi_all[3] ;
 wire \dsi_all[4] ;
 wire \dsi_all[5] ;
 wire \dsi_all[6] ;
 wire \dsi_all[7] ;
 wire \dsi_all[8] ;
 wire \dsi_all[9] ;
 wire \dso_6502[0] ;
 wire \dso_6502[10] ;
 wire \dso_6502[11] ;
 wire \dso_6502[12] ;
 wire \dso_6502[13] ;
 wire \dso_6502[14] ;
 wire \dso_6502[15] ;
 wire \dso_6502[16] ;
 wire \dso_6502[17] ;
 wire \dso_6502[18] ;
 wire \dso_6502[19] ;
 wire \dso_6502[1] ;
 wire \dso_6502[20] ;
 wire \dso_6502[21] ;
 wire \dso_6502[22] ;
 wire \dso_6502[23] ;
 wire \dso_6502[24] ;
 wire \dso_6502[25] ;
 wire \dso_6502[26] ;
 wire \dso_6502[2] ;
 wire \dso_6502[3] ;
 wire \dso_6502[4] ;
 wire \dso_6502[5] ;
 wire \dso_6502[6] ;
 wire \dso_6502[7] ;
 wire \dso_6502[8] ;
 wire \dso_6502[9] ;
 wire \dso_LCD[0] ;
 wire \dso_LCD[1] ;
 wire \dso_LCD[2] ;
 wire \dso_LCD[3] ;
 wire \dso_LCD[4] ;
 wire \dso_LCD[5] ;
 wire \dso_LCD[6] ;
 wire \dso_LCD[7] ;
 wire \dso_as1802[0] ;
 wire \dso_as1802[10] ;
 wire \dso_as1802[11] ;
 wire \dso_as1802[12] ;
 wire \dso_as1802[13] ;
 wire \dso_as1802[14] ;
 wire \dso_as1802[15] ;
 wire \dso_as1802[16] ;
 wire \dso_as1802[17] ;
 wire \dso_as1802[18] ;
 wire \dso_as1802[19] ;
 wire \dso_as1802[1] ;
 wire \dso_as1802[20] ;
 wire \dso_as1802[21] ;
 wire \dso_as1802[22] ;
 wire \dso_as1802[23] ;
 wire \dso_as1802[24] ;
 wire \dso_as1802[25] ;
 wire \dso_as1802[26] ;
 wire \dso_as1802[2] ;
 wire \dso_as1802[3] ;
 wire \dso_as1802[4] ;
 wire \dso_as1802[5] ;
 wire \dso_as1802[6] ;
 wire \dso_as1802[7] ;
 wire \dso_as1802[8] ;
 wire \dso_as1802[9] ;
 wire \dso_as2650[0] ;
 wire \dso_as2650[10] ;
 wire \dso_as2650[11] ;
 wire \dso_as2650[12] ;
 wire \dso_as2650[13] ;
 wire \dso_as2650[14] ;
 wire \dso_as2650[15] ;
 wire \dso_as2650[16] ;
 wire \dso_as2650[17] ;
 wire \dso_as2650[18] ;
 wire \dso_as2650[19] ;
 wire \dso_as2650[1] ;
 wire \dso_as2650[20] ;
 wire \dso_as2650[21] ;
 wire \dso_as2650[22] ;
 wire \dso_as2650[23] ;
 wire \dso_as2650[24] ;
 wire \dso_as2650[25] ;
 wire \dso_as2650[26] ;
 wire \dso_as2650[2] ;
 wire \dso_as2650[3] ;
 wire \dso_as2650[4] ;
 wire \dso_as2650[5] ;
 wire \dso_as2650[6] ;
 wire \dso_as2650[7] ;
 wire \dso_as2650[8] ;
 wire \dso_as2650[9] ;
 wire \dso_as512512512[0] ;
 wire \dso_as512512512[10] ;
 wire \dso_as512512512[11] ;
 wire \dso_as512512512[12] ;
 wire \dso_as512512512[13] ;
 wire \dso_as512512512[14] ;
 wire \dso_as512512512[15] ;
 wire \dso_as512512512[16] ;
 wire \dso_as512512512[17] ;
 wire \dso_as512512512[18] ;
 wire \dso_as512512512[19] ;
 wire \dso_as512512512[1] ;
 wire \dso_as512512512[20] ;
 wire \dso_as512512512[21] ;
 wire \dso_as512512512[22] ;
 wire \dso_as512512512[23] ;
 wire \dso_as512512512[24] ;
 wire \dso_as512512512[25] ;
 wire \dso_as512512512[26] ;
 wire \dso_as512512512[27] ;
 wire \dso_as512512512[2] ;
 wire \dso_as512512512[3] ;
 wire \dso_as512512512[4] ;
 wire \dso_as512512512[5] ;
 wire \dso_as512512512[6] ;
 wire \dso_as512512512[7] ;
 wire \dso_as512512512[8] ;
 wire \dso_as512512512[9] ;
 wire \dso_as5401[0] ;
 wire \dso_as5401[10] ;
 wire \dso_as5401[11] ;
 wire \dso_as5401[12] ;
 wire \dso_as5401[13] ;
 wire \dso_as5401[14] ;
 wire \dso_as5401[15] ;
 wire \dso_as5401[16] ;
 wire \dso_as5401[17] ;
 wire \dso_as5401[18] ;
 wire \dso_as5401[19] ;
 wire \dso_as5401[1] ;
 wire \dso_as5401[20] ;
 wire \dso_as5401[21] ;
 wire \dso_as5401[22] ;
 wire \dso_as5401[23] ;
 wire \dso_as5401[24] ;
 wire \dso_as5401[25] ;
 wire \dso_as5401[26] ;
 wire \dso_as5401[2] ;
 wire \dso_as5401[3] ;
 wire \dso_as5401[4] ;
 wire \dso_as5401[5] ;
 wire \dso_as5401[6] ;
 wire \dso_as5401[7] ;
 wire \dso_as5401[8] ;
 wire \dso_as5401[9] ;
 wire \dso_counter[0] ;
 wire \dso_counter[10] ;
 wire \dso_counter[11] ;
 wire \dso_counter[1] ;
 wire \dso_counter[2] ;
 wire \dso_counter[3] ;
 wire \dso_counter[4] ;
 wire \dso_counter[5] ;
 wire \dso_counter[6] ;
 wire \dso_counter[7] ;
 wire \dso_counter[8] ;
 wire \dso_counter[9] ;
 wire \dso_diceroll[0] ;
 wire \dso_diceroll[1] ;
 wire \dso_diceroll[2] ;
 wire \dso_diceroll[3] ;
 wire \dso_diceroll[4] ;
 wire \dso_diceroll[5] ;
 wire \dso_diceroll[6] ;
 wire \dso_diceroll[7] ;
 wire \dso_mc14500[0] ;
 wire \dso_mc14500[1] ;
 wire \dso_mc14500[2] ;
 wire \dso_mc14500[3] ;
 wire \dso_mc14500[4] ;
 wire \dso_mc14500[5] ;
 wire \dso_mc14500[6] ;
 wire \dso_mc14500[7] ;
 wire \dso_mc14500[8] ;
 wire \dso_multiplier[0] ;
 wire \dso_multiplier[1] ;
 wire \dso_multiplier[2] ;
 wire \dso_multiplier[3] ;
 wire \dso_multiplier[4] ;
 wire \dso_multiplier[5] ;
 wire \dso_multiplier[6] ;
 wire \dso_multiplier[7] ;
 wire \dso_posit[0] ;
 wire \dso_posit[1] ;
 wire \dso_posit[2] ;
 wire \dso_posit[3] ;
 wire \dso_tbb1143[0] ;
 wire \dso_tbb1143[1] ;
 wire \dso_tbb1143[2] ;
 wire \dso_tbb1143[3] ;
 wire \dso_tbb1143[4] ;
 wire \dso_tbb1143[5] ;
 wire \dso_tbb1143[6] ;
 wire \dso_tbb1143[7] ;
 wire dso_tune;
 wire oeb_6502;
 wire oeb_as1802;
 wire oeb_as2650;
 wire oeb_as512512512;
 wire oeb_as5401;
 wire oeb_mc14500;
 wire rst_6502;
 wire rst_LCD;
 wire rst_as1802;
 wire rst_as2650;
 wire rst_as512512512;
 wire rst_as5401;
 wire rst_counter;
 wire rst_diceroll;
 wire rst_mc14500;
 wire rst_posit;
 wire rst_tbb1143;
 wire rst_tune;

 posit_unit posit_unit (.clk(design_clk),
    .rst(rst_posit),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_posit[3] ,
    \dso_posit[2] ,
    \dso_posit[1] ,
    \dso_posit[0] }));
 multiplexer proj_multiplexer (.design_clk_o(design_clk),
    .dso_tune(dso_tune),
    .oeb_6502(oeb_6502),
    .oeb_as1802(oeb_as1802),
    .oeb_as2650(oeb_as2650),
    .oeb_as512512512(oeb_as512512512),
    .oeb_as5401(oeb_as5401),
    .oeb_mc14500(oeb_mc14500),
    .rst_6502(rst_6502),
    .rst_LCD(rst_LCD),
    .rst_as1802(rst_as1802),
    .rst_as2650(rst_as2650),
    .rst_as512512512(rst_as512512512),
    .rst_as5401(rst_as5401),
    .rst_counter(rst_counter),
    .rst_diceroll(rst_diceroll),
    .rst_mc14500(rst_mc14500),
    .rst_posit(rst_posit),
    .rst_tbb1143(rst_tbb1143),
    .rst_tune(rst_tune),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .wb_clk_i(wb_clk_i),
    .wb_rst_i(wb_rst_i),
    .wbs_ack_o(wbs_ack_o),
    .wbs_cyc_i(wbs_cyc_i),
    .wbs_stb_i(wbs_stb_i),
    .wbs_we_i(wbs_we_i),
    .dsi_all({\dsi_all[27] ,
    \dsi_all[26] ,
    \dsi_all[25] ,
    \dsi_all[24] ,
    \dsi_all[23] ,
    \dsi_all[22] ,
    \dsi_all[21] ,
    \dsi_all[20] ,
    \dsi_all[19] ,
    \dsi_all[18] ,
    \dsi_all[17] ,
    \dsi_all[16] ,
    \dsi_all[15] ,
    \dsi_all[14] ,
    \dsi_all[13] ,
    \dsi_all[12] ,
    \dsi_all[11] ,
    \dsi_all[10] ,
    \dsi_all[9] ,
    \dsi_all[8] ,
    \dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .dso_6502({\dso_6502[26] ,
    \dso_6502[25] ,
    \dso_6502[24] ,
    \dso_6502[23] ,
    \dso_6502[22] ,
    \dso_6502[21] ,
    \dso_6502[20] ,
    \dso_6502[19] ,
    \dso_6502[18] ,
    \dso_6502[17] ,
    \dso_6502[16] ,
    \dso_6502[15] ,
    \dso_6502[14] ,
    \dso_6502[13] ,
    \dso_6502[12] ,
    \dso_6502[11] ,
    \dso_6502[10] ,
    \dso_6502[9] ,
    \dso_6502[8] ,
    \dso_6502[7] ,
    \dso_6502[6] ,
    \dso_6502[5] ,
    \dso_6502[4] ,
    \dso_6502[3] ,
    \dso_6502[2] ,
    \dso_6502[1] ,
    \dso_6502[0] }),
    .dso_LCD({\dso_LCD[7] ,
    \dso_LCD[6] ,
    \dso_LCD[5] ,
    \dso_LCD[4] ,
    \dso_LCD[3] ,
    \dso_LCD[2] ,
    \dso_LCD[1] ,
    \dso_LCD[0] }),
    .dso_as1802({\dso_as1802[26] ,
    \dso_as1802[25] ,
    \dso_as1802[24] ,
    \dso_as1802[23] ,
    \dso_as1802[22] ,
    \dso_as1802[21] ,
    \dso_as1802[20] ,
    \dso_as1802[19] ,
    \dso_as1802[18] ,
    \dso_as1802[17] ,
    \dso_as1802[16] ,
    \dso_as1802[15] ,
    \dso_as1802[14] ,
    \dso_as1802[13] ,
    \dso_as1802[12] ,
    \dso_as1802[11] ,
    \dso_as1802[10] ,
    \dso_as1802[9] ,
    \dso_as1802[8] ,
    \dso_as1802[7] ,
    \dso_as1802[6] ,
    \dso_as1802[5] ,
    \dso_as1802[4] ,
    \dso_as1802[3] ,
    \dso_as1802[2] ,
    \dso_as1802[1] ,
    \dso_as1802[0] }),
    .dso_as2650({\dso_as2650[26] ,
    \dso_as2650[25] ,
    \dso_as2650[24] ,
    \dso_as2650[23] ,
    \dso_as2650[22] ,
    \dso_as2650[21] ,
    \dso_as2650[20] ,
    \dso_as2650[19] ,
    \dso_as2650[18] ,
    \dso_as2650[17] ,
    \dso_as2650[16] ,
    \dso_as2650[15] ,
    \dso_as2650[14] ,
    \dso_as2650[13] ,
    \dso_as2650[12] ,
    \dso_as2650[11] ,
    \dso_as2650[10] ,
    \dso_as2650[9] ,
    \dso_as2650[8] ,
    \dso_as2650[7] ,
    \dso_as2650[6] ,
    \dso_as2650[5] ,
    \dso_as2650[4] ,
    \dso_as2650[3] ,
    \dso_as2650[2] ,
    \dso_as2650[1] ,
    \dso_as2650[0] }),
    .dso_as512512512({\dso_as512512512[27] ,
    \dso_as512512512[26] ,
    \dso_as512512512[25] ,
    \dso_as512512512[24] ,
    \dso_as512512512[23] ,
    \dso_as512512512[22] ,
    \dso_as512512512[21] ,
    \dso_as512512512[20] ,
    \dso_as512512512[19] ,
    \dso_as512512512[18] ,
    \dso_as512512512[17] ,
    \dso_as512512512[16] ,
    \dso_as512512512[15] ,
    \dso_as512512512[14] ,
    \dso_as512512512[13] ,
    \dso_as512512512[12] ,
    \dso_as512512512[11] ,
    \dso_as512512512[10] ,
    \dso_as512512512[9] ,
    \dso_as512512512[8] ,
    \dso_as512512512[7] ,
    \dso_as512512512[6] ,
    \dso_as512512512[5] ,
    \dso_as512512512[4] ,
    \dso_as512512512[3] ,
    \dso_as512512512[2] ,
    \dso_as512512512[1] ,
    \dso_as512512512[0] }),
    .dso_as5401({\dso_as5401[26] ,
    \dso_as5401[25] ,
    \dso_as5401[24] ,
    \dso_as5401[23] ,
    \dso_as5401[22] ,
    \dso_as5401[21] ,
    \dso_as5401[20] ,
    \dso_as5401[19] ,
    \dso_as5401[18] ,
    \dso_as5401[17] ,
    \dso_as5401[16] ,
    \dso_as5401[15] ,
    \dso_as5401[14] ,
    \dso_as5401[13] ,
    \dso_as5401[12] ,
    \dso_as5401[11] ,
    \dso_as5401[10] ,
    \dso_as5401[9] ,
    \dso_as5401[8] ,
    \dso_as5401[7] ,
    \dso_as5401[6] ,
    \dso_as5401[5] ,
    \dso_as5401[4] ,
    \dso_as5401[3] ,
    \dso_as5401[2] ,
    \dso_as5401[1] ,
    \dso_as5401[0] }),
    .dso_counter({\dso_counter[11] ,
    \dso_counter[10] ,
    \dso_counter[9] ,
    \dso_counter[8] ,
    \dso_counter[7] ,
    \dso_counter[6] ,
    \dso_counter[5] ,
    \dso_counter[4] ,
    \dso_counter[3] ,
    \dso_counter[2] ,
    \dso_counter[1] ,
    \dso_counter[0] }),
    .dso_diceroll({\dso_diceroll[7] ,
    \dso_diceroll[6] ,
    \dso_diceroll[5] ,
    \dso_diceroll[4] ,
    \dso_diceroll[3] ,
    \dso_diceroll[2] ,
    \dso_diceroll[1] ,
    \dso_diceroll[0] }),
    .dso_mc14500({\dso_mc14500[8] ,
    \dso_mc14500[7] ,
    \dso_mc14500[6] ,
    \dso_mc14500[5] ,
    \dso_mc14500[4] ,
    \dso_mc14500[3] ,
    \dso_mc14500[2] ,
    \dso_mc14500[1] ,
    \dso_mc14500[0] }),
    .dso_multiplier({\dso_multiplier[7] ,
    \dso_multiplier[6] ,
    \dso_multiplier[5] ,
    \dso_multiplier[4] ,
    \dso_multiplier[3] ,
    \dso_multiplier[2] ,
    \dso_multiplier[1] ,
    \dso_multiplier[0] }),
    .dso_posit({\dso_posit[3] ,
    \dso_posit[2] ,
    \dso_posit[1] ,
    \dso_posit[0] }),
    .dso_tbb1143({\dso_tbb1143[7] ,
    \dso_tbb1143[6] ,
    \dso_tbb1143[5] ,
    \dso_tbb1143[4] ,
    \dso_tbb1143[3] ,
    \dso_tbb1143[2] ,
    \dso_tbb1143[1] ,
    \dso_tbb1143[0] }),
    .io_in({io_in[37],
    io_in[36],
    io_in[35],
    io_in[34],
    io_in[33],
    io_in[32],
    io_in[31],
    io_in[30],
    io_in[29],
    io_in[28],
    io_in[27],
    io_in[26],
    io_in[25],
    io_in[24],
    io_in[23],
    io_in[22],
    io_in[21],
    io_in[20],
    io_in[19],
    io_in[18],
    io_in[17],
    io_in[16],
    io_in[15],
    io_in[14],
    io_in[13],
    io_in[12],
    io_in[11],
    io_in[10],
    io_in[9],
    io_in[8],
    io_in[7],
    io_in[6],
    io_in[5],
    io_in[4],
    io_in[3],
    io_in[2],
    io_in[1],
    io_in[0]}),
    .io_oeb({io_oeb[37],
    io_oeb[36],
    io_oeb[35],
    io_oeb[34],
    io_oeb[33],
    io_oeb[32],
    io_oeb[31],
    io_oeb[30],
    io_oeb[29],
    io_oeb[28],
    io_oeb[27],
    io_oeb[26],
    io_oeb[25],
    io_oeb[24],
    io_oeb[23],
    io_oeb[22],
    io_oeb[21],
    io_oeb[20],
    io_oeb[19],
    io_oeb[18],
    io_oeb[17],
    io_oeb[16],
    io_oeb[15],
    io_oeb[14],
    io_oeb[13],
    io_oeb[12],
    io_oeb[11],
    io_oeb[10],
    io_oeb[9],
    io_oeb[8],
    io_oeb[7],
    io_oeb[6],
    io_oeb[5],
    io_oeb[4],
    io_oeb[3],
    io_oeb[2],
    io_oeb[1],
    io_oeb[0]}),
    .io_out({io_out[37],
    io_out[36],
    io_out[35],
    io_out[34],
    io_out[33],
    io_out[32],
    io_out[31],
    io_out[30],
    io_out[29],
    io_out[28],
    io_out[27],
    io_out[26],
    io_out[25],
    io_out[24],
    io_out[23],
    io_out[22],
    io_out[21],
    io_out[20],
    io_out[19],
    io_out[18],
    io_out[17],
    io_out[16],
    io_out[15],
    io_out[14],
    io_out[13],
    io_out[12],
    io_out[11],
    io_out[10],
    io_out[9],
    io_out[8],
    io_out[7],
    io_out[6],
    io_out[5],
    io_out[4],
    io_out[3],
    io_out[2],
    io_out[1],
    io_out[0]}),
    .wbs_adr_i({wbs_adr_i[31],
    wbs_adr_i[30],
    wbs_adr_i[29],
    wbs_adr_i[28],
    wbs_adr_i[27],
    wbs_adr_i[26],
    wbs_adr_i[25],
    wbs_adr_i[24],
    wbs_adr_i[23],
    wbs_adr_i[22],
    wbs_adr_i[21],
    wbs_adr_i[20],
    wbs_adr_i[19],
    wbs_adr_i[18],
    wbs_adr_i[17],
    wbs_adr_i[16],
    wbs_adr_i[15],
    wbs_adr_i[14],
    wbs_adr_i[13],
    wbs_adr_i[12],
    wbs_adr_i[11],
    wbs_adr_i[10],
    wbs_adr_i[9],
    wbs_adr_i[8],
    wbs_adr_i[7],
    wbs_adr_i[6],
    wbs_adr_i[5],
    wbs_adr_i[4],
    wbs_adr_i[3],
    wbs_adr_i[2],
    wbs_adr_i[1],
    wbs_adr_i[0]}),
    .wbs_dat_i({wbs_dat_i[31],
    wbs_dat_i[30],
    wbs_dat_i[29],
    wbs_dat_i[28],
    wbs_dat_i[27],
    wbs_dat_i[26],
    wbs_dat_i[25],
    wbs_dat_i[24],
    wbs_dat_i[23],
    wbs_dat_i[22],
    wbs_dat_i[21],
    wbs_dat_i[20],
    wbs_dat_i[19],
    wbs_dat_i[18],
    wbs_dat_i[17],
    wbs_dat_i[16],
    wbs_dat_i[15],
    wbs_dat_i[14],
    wbs_dat_i[13],
    wbs_dat_i[12],
    wbs_dat_i[11],
    wbs_dat_i[10],
    wbs_dat_i[9],
    wbs_dat_i[8],
    wbs_dat_i[7],
    wbs_dat_i[6],
    wbs_dat_i[5],
    wbs_dat_i[4],
    wbs_dat_i[3],
    wbs_dat_i[2],
    wbs_dat_i[1],
    wbs_dat_i[0]}),
    .wbs_dat_o({wbs_dat_o[31],
    wbs_dat_o[30],
    wbs_dat_o[29],
    wbs_dat_o[28],
    wbs_dat_o[27],
    wbs_dat_o[26],
    wbs_dat_o[25],
    wbs_dat_o[24],
    wbs_dat_o[23],
    wbs_dat_o[22],
    wbs_dat_o[21],
    wbs_dat_o[20],
    wbs_dat_o[19],
    wbs_dat_o[18],
    wbs_dat_o[17],
    wbs_dat_o[16],
    wbs_dat_o[15],
    wbs_dat_o[14],
    wbs_dat_o[13],
    wbs_dat_o[12],
    wbs_dat_o[11],
    wbs_dat_o[10],
    wbs_dat_o[9],
    wbs_dat_o[8],
    wbs_dat_o[7],
    wbs_dat_o[6],
    wbs_dat_o[5],
    wbs_dat_o[4],
    wbs_dat_o[3],
    wbs_dat_o[2],
    wbs_dat_o[1],
    wbs_dat_o[0]}));
 tholin_avalonsemi_5401 tholin_avalonsemi_5401 (.clk(design_clk),
    .io_oeb(oeb_as5401),
    .rst(rst_as5401),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[9] ,
    \dsi_all[8] ,
    \dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_as5401[26] ,
    \dso_as5401[25] ,
    \dso_as5401[24] ,
    \dso_as5401[23] ,
    \dso_as5401[22] ,
    \dso_as5401[21] ,
    \dso_as5401[20] ,
    \dso_as5401[19] ,
    \dso_as5401[18] ,
    \dso_as5401[17] ,
    \dso_as5401[16] ,
    \dso_as5401[15] ,
    \dso_as5401[14] ,
    \dso_as5401[13] ,
    \dso_as5401[12] ,
    \dso_as5401[11] ,
    \dso_as5401[10] ,
    \dso_as5401[9] ,
    \dso_as5401[8] ,
    \dso_as5401[7] ,
    \dso_as5401[6] ,
    \dso_as5401[5] ,
    \dso_as5401[4] ,
    \dso_as5401[3] ,
    \dso_as5401[2] ,
    \dso_as5401[1] ,
    \dso_as5401[0] }));
 tholin_avalonsemi_tbb1143 tholin_avalonsemi_tbb1143 (.clk(design_clk),
    .rst(rst_tbb1143),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_tbb1143[7] ,
    \dso_tbb1143[6] ,
    \dso_tbb1143[5] ,
    \dso_tbb1143[4] ,
    \dso_tbb1143[3] ,
    \dso_tbb1143[2] ,
    \dso_tbb1143[1] ,
    \dso_tbb1143[0] }));
 tt2_tholin_diceroll tt2_tholin_diceroll (.clk(design_clk),
    .io_in(\dsi_all[0] ),
    .rst(rst_diceroll),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_out({\dso_diceroll[7] ,
    \dso_diceroll[6] ,
    \dso_diceroll[5] ,
    \dso_diceroll[4] ,
    \dso_diceroll[3] ,
    \dso_diceroll[2] ,
    \dso_diceroll[1] ,
    \dso_diceroll[0] }));
 tt2_tholin_multiplexed_counter tt2_tholin_multiplexed_counter (.clk(design_clk),
    .rst(rst_counter),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_out({\dso_counter[11] ,
    \dso_counter[10] ,
    \dso_counter[9] ,
    \dso_counter[8] ,
    \dso_counter[7] ,
    \dso_counter[6] ,
    \dso_counter[5] ,
    \dso_counter[4] ,
    \dso_counter[3] ,
    \dso_counter[2] ,
    \dso_counter[1] ,
    \dso_counter[0] }));
 tt2_tholin_multiplier tt2_tholin_multiplier (.vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_multiplier[7] ,
    \dso_multiplier[6] ,
    \dso_multiplier[5] ,
    \dso_multiplier[4] ,
    \dso_multiplier[3] ,
    \dso_multiplier[2] ,
    \dso_multiplier[1] ,
    \dso_multiplier[0] }));
 tt2_tholin_namebadge tt2_tholin_namebadge (.clk(design_clk),
    .rst(rst_LCD),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[10] ,
    \dsi_all[9] ,
    \dsi_all[8] }),
    .io_oeb({_NC1,
    _NC2,
    _NC3,
    _NC4,
    _NC5,
    _NC6,
    _NC7,
    _NC8,
    _NC9,
    _NC10,
    _NC11,
    _NC12,
    _NC13,
    _NC14,
    _NC15,
    _NC16,
    _NC17,
    _NC18,
    _NC19,
    _NC20,
    _NC21,
    _NC22,
    _NC23,
    _NC24,
    _NC25,
    _NC26,
    _NC27}),
    .io_out({\dso_LCD[7] ,
    \dso_LCD[6] ,
    \dso_LCD[5] ,
    \dso_LCD[4] ,
    \dso_LCD[3] ,
    \dso_LCD[2] ,
    \dso_LCD[1] ,
    \dso_LCD[0] }));
 tune_player tune_player (.OP(dso_tune),
    .clk(design_clk),
    .rst(rst_tune),
    .vccd1(vccd1),
    .vssd1(vssd1));
 wrapped_6502 wrapped_6502 (.clk(design_clk),
    .io_oeb(oeb_6502),
    .rst(rst_6502),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[9] ,
    \dsi_all[8] ,
    \dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_6502[26] ,
    \dso_6502[25] ,
    \dso_6502[24] ,
    \dso_6502[23] ,
    \dso_6502[22] ,
    \dso_6502[21] ,
    \dso_6502[20] ,
    \dso_6502[19] ,
    \dso_6502[18] ,
    \dso_6502[17] ,
    \dso_6502[16] ,
    \dso_6502[15] ,
    \dso_6502[14] ,
    \dso_6502[13] ,
    \dso_6502[12] ,
    \dso_6502[11] ,
    \dso_6502[10] ,
    \dso_6502[9] ,
    \dso_6502[8] ,
    \dso_6502[7] ,
    \dso_6502[6] ,
    \dso_6502[5] ,
    \dso_6502[4] ,
    \dso_6502[3] ,
    \dso_6502[2] ,
    \dso_6502[1] ,
    \dso_6502[0] }));
 wrapped_MC14500 wrapped_MC14500 (.clk(design_clk),
    .io_oeb(oeb_mc14500),
    .rst(rst_mc14500),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_mc14500[8] ,
    \dso_mc14500[7] ,
    \dso_mc14500[6] ,
    \dso_mc14500[5] ,
    \dso_mc14500[4] ,
    \dso_mc14500[3] ,
    \dso_mc14500[2] ,
    \dso_mc14500[1] ,
    \dso_mc14500[0] }));
 wrapped_as1802 wrapped_as1802 (.clk(design_clk),
    .io_oeb(oeb_as1802),
    .rst(rst_as1802),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[12] ,
    \dsi_all[11] ,
    \dsi_all[10] ,
    \dsi_all[9] ,
    \dsi_all[8] ,
    \dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_as1802[26] ,
    \dso_as1802[25] ,
    \dso_as1802[24] ,
    \dso_as1802[23] ,
    \dso_as1802[22] ,
    \dso_as1802[21] ,
    \dso_as1802[20] ,
    \dso_as1802[19] ,
    \dso_as1802[18] ,
    \dso_as1802[17] ,
    \dso_as1802[16] ,
    \dso_as1802[15] ,
    \dso_as1802[14] ,
    \dso_as1802[13] ,
    \dso_as1802[12] ,
    \dso_as1802[11] ,
    \dso_as1802[10] ,
    \dso_as1802[9] ,
    \dso_as1802[8] ,
    \dso_as1802[7] ,
    \dso_as1802[6] ,
    \dso_as1802[5] ,
    \dso_as1802[4] ,
    \dso_as1802[3] ,
    \dso_as1802[2] ,
    \dso_as1802[1] ,
    \dso_as1802[0] }));
 wrapped_as2650 wrapped_as2650 (.clk(design_clk),
    .io_oeb(oeb_as2650),
    .rst(rst_as2650),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_as2650[26] ,
    \dso_as2650[25] ,
    \dso_as2650[24] ,
    \dso_as2650[23] ,
    \dso_as2650[22] ,
    \dso_as2650[21] ,
    \dso_as2650[20] ,
    \dso_as2650[19] ,
    \dso_as2650[18] ,
    \dso_as2650[17] ,
    \dso_as2650[16] ,
    \dso_as2650[15] ,
    \dso_as2650[14] ,
    \dso_as2650[13] ,
    \dso_as2650[12] ,
    \dso_as2650[11] ,
    \dso_as2650[10] ,
    \dso_as2650[9] ,
    \dso_as2650[8] ,
    \dso_as2650[7] ,
    \dso_as2650[6] ,
    \dso_as2650[5] ,
    \dso_as2650[4] ,
    \dso_as2650[3] ,
    \dso_as2650[2] ,
    \dso_as2650[1] ,
    \dso_as2650[0] }));
 wrapped_as512512512 wrapped_as512512512 (.clk(design_clk),
    .io_oeb(oeb_as512512512),
    .rst(rst_as512512512),
    .vccd1(vccd1),
    .vssd1(vssd1),
    .io_in({\dsi_all[26] ,
    \dsi_all[25] ,
    \dsi_all[24] ,
    \dsi_all[23] ,
    \dsi_all[22] ,
    \dsi_all[21] ,
    \dsi_all[20] ,
    \dsi_all[19] ,
    \dsi_all[18] ,
    \dsi_all[17] ,
    \dsi_all[16] ,
    \dsi_all[15] ,
    \dsi_all[14] ,
    \dsi_all[13] ,
    \dsi_all[12] ,
    \dsi_all[11] ,
    \dsi_all[10] ,
    \dsi_all[9] ,
    \dsi_all[8] ,
    \dsi_all[7] ,
    \dsi_all[6] ,
    \dsi_all[5] ,
    \dsi_all[4] ,
    \dsi_all[3] ,
    \dsi_all[2] ,
    \dsi_all[1] ,
    \dsi_all[0] }),
    .io_out({\dso_as512512512[27] ,
    \dso_as512512512[26] ,
    \dso_as512512512[25] ,
    \dso_as512512512[24] ,
    \dso_as512512512[23] ,
    \dso_as512512512[22] ,
    \dso_as512512512[21] ,
    \dso_as512512512[20] ,
    \dso_as512512512[19] ,
    \dso_as512512512[18] ,
    \dso_as512512512[17] ,
    \dso_as512512512[16] ,
    \dso_as512512512[15] ,
    \dso_as512512512[14] ,
    \dso_as512512512[13] ,
    \dso_as512512512[12] ,
    \dso_as512512512[11] ,
    \dso_as512512512[10] ,
    \dso_as512512512[9] ,
    \dso_as512512512[8] ,
    \dso_as512512512[7] ,
    \dso_as512512512[6] ,
    \dso_as512512512[5] ,
    \dso_as512512512[4] ,
    \dso_as512512512[3] ,
    \dso_as512512512[2] ,
    \dso_as512512512[1] ,
    \dso_as512512512[0] }));
endmodule
