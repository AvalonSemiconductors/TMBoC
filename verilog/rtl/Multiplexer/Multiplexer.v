`default_nettype none
module multiplexer(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input [37:0] io_in,
	output [37:0] io_out,
	output [37:0] io_oeb,

	input wb_clk_i,
	input wb_rst_i,
	
	input [31:0] wbs_adr_i,
	input [31:0] wbs_dat_i,
	output [31:0] wbs_dat_o,
	input wbs_we_i,
	input wbs_cyc_i,
	input wbs_stb_i,
	output wbs_ack_o,
	
	output [27:0] dsi_all,

	input [7:0] dso_multiplier,
	
	input [26:0] dso_as5401,
	input oeb_as5401,
	output rst_as5401,
	
	input [7:0] dso_diceroll,
	output rst_diceroll,
	
	input [7:0] dso_LCD,
	output rst_LCD,
	
	input [8:0] dso_mc14500,
	input oeb_mc14500,
	output rst_mc14500,
	
	input [11:0] dso_counter,
	output rst_counter,
	
	input [7:0] dso_tbb1143,
	output rst_tbb1143,
	
	input [26:0] dso_as2650,
	input oeb_as2650,
	output rst_as2650,
	
	input [26:0] dso_6502,
	input oeb_6502,
	output rst_6502,
	
	input [26:0] dso_as1802,
	input oeb_as1802,
	output rst_as1802,
	
	input dso_tune,
	output rst_tune,
	
	input [3:0] dso_posit,
	output rst_posit,
	
	input [27:0] dso_as512512512,
	input oeb_as512512512,
	output rst_as512512512,
	
	output [1:0] nand_dsi,
	input dso_nand,
	
	input [9:0] dso_vgatest,
	output rst_vgatest,
	
	output design_clk_o
);

reg wb_rst_override;
reg wb_clk_override;
reg wb_single_step;
reg wb_override;
reg [3:0] wb_design_addr_override;
reg [31:0] wbs_o_buff;
reg wb_feedback_delay;
reg wb_ready;
reg [23:0] wb_counter;
reg [27:0] wb_io_override;
assign wbs_dat_o = wbs_o_buff;
assign wbs_ack_o = wb_ready;

wire wb_valid = wbs_cyc_i && wbs_stb_i;

reg [3:0] design_addr;

wire design_rst = wb_override ? wb_rst_override : io_in[9];
wire design_clk = wb_override ? (wb_single_step ? wb_clk_override : wb_clk_i) : io_in[10];
assign design_clk_o = design_clk;
reg [27:0] design_outs;
reg [27:0] design_oebs;
wire [27:0] design_ins = wb_override ? (wb_io_override & design_oebs) : {io_in[0], io_in[37:11]};
assign dsi_all = design_ins;
assign nand_dsi = design_ins[1:0];

assign io_oeb = {design_oebs[26:0], 2'b11, 4'b1111, 4'b0000, design_oebs[27]};
//assign io_out = {design_outs, 2'b00, 4'b0000, 5'b00000};
assign io_out = {design_outs[26:0], 2'b00, 4'b0000, wb_counter[4:1], design_outs[27]};

always @(posedge design_clk) begin
	if(!wb_rst_i) begin
		wb_counter <= wb_counter + 1;
	end
end

always @(posedge wb_clk_i) begin
	if(wb_rst_i) begin
		wb_override <= 0;
		wb_rst_override <= 0;
		wb_design_addr_override <= 0;
		wb_feedback_delay <= 0;
		wb_ready <= 0;
		wbs_o_buff <= 0;
		wb_counter <= 0;
	end else begin
		if(wb_valid) begin
			if(wbs_adr_i[23]) begin
				if(wbs_we_i) begin
					wb_override <= wbs_dat_i[0];
					wb_rst_override <= wbs_dat_i[1];
					wb_single_step <= wbs_dat_i[2];
					wb_clk_override <= wbs_dat_i[3];
					wb_design_addr_override <= wbs_dat_i[7:4];
				end
				wbs_o_buff <= {26'b0, wb_design_addr_override, wb_rst_override, wb_override};
			end else if(wbs_adr_i[22]) begin
				if(wbs_we_i) begin
					wb_io_override <= wbs_dat_i[27:0];
				end
				wbs_o_buff <= {4'b0000, design_outs & ~design_oebs};
			end else if(wbs_adr_i[21]) begin
				if(wbs_we_i) begin
					wb_counter <= wbs_dat_i[23:0];
				end else begin
					wbs_o_buff <= {8'h00, wb_counter};
				end
			end
		end
		design_addr <= wb_override ? wb_design_addr_override : io_in[8:5];
		#5; //TODO: Do not depend on this anymore
		wb_feedback_delay <= wb_valid;
		wb_ready <= wb_feedback_delay;
	end
end

always @(*) begin
	case(design_addr)
		0: begin
			design_outs = {12'h000, dso_multiplier, 8'h00};
			design_oebs = {12'hFFF, 8'h00, 8'hFF};
		end
		1: begin
			design_outs = {1'b0, dso_as5401};
			design_oebs = {1'b1, 17'b0, 6'b111111, oeb_as5401, oeb_as5401, oeb_as5401, oeb_as5401};
		end
		2: begin
			design_outs = {19'h1AAAA, dso_diceroll, 1'b0};
			design_oebs = {27'b0, 1'b1};
		end
		3: begin
			design_outs = {20'b0, dso_LCD};
			design_oebs = {20'hFFFFF, 8'h00};
		end
		4: begin
			design_outs = {15'b0, dso_mc14500, 4'b0000};
			design_oebs = {15'h7FFF, 8'h00, oeb_mc14500, 4'b1111};
		end
		5: begin
			design_outs = {16'b0, dso_counter};
			design_oebs = {16'hFFFF, 12'b0};
		end
		6: begin
			design_outs = {14'b0, dso_tbb1143, 6'b0};
			design_oebs = {14'h3FFF, 8'h00, 6'b111111};
		end
		7: begin
			design_outs = {1'b0, dso_as2650};
			design_oebs = {1'b1, 19'h00000, {8{oeb_as2650}}};
		end
		8: begin
			design_outs = {1'b1, dso_6502};
			design_oebs = {18'h00000, 2'b11, {8{oeb_6502}}};
		end
		9: begin
			design_outs = {1'b1, dso_as1802};
			design_oebs = {15'h0000, 5'b11111, {8{oeb_as1802}}};
		end
		10: begin
			design_outs = {29{dso_tune}};
			design_oebs = 0;
		end
		11: begin
			design_outs = {1'b1, 24'h000000, dso_posit};
			design_oebs = {1'b0, 24'hFFFFFF, 1'b0, 3'b111};
		end
		12: begin
			design_outs = dso_as512512512;
			design_oebs = {1'b0, 1'b1, 2'b00, 1'b1, 1'b0, 1'b1, 5'b00000, {16{oeb_as512512512}}};
		end
		13: begin
			design_outs = {18'h00000, dso_vgatest, 1'b0};
			design_oebs = {18'h3FFFF, 10'h000, 1'b1};
		end
		
		//Invalid address
		default: begin
			design_outs = 28'b0000010001010011000101001100; //'RTFM' in base64
			design_oebs = 28'b0;
		end
	endcase
end

assign rst_as5401 = design_rst || (design_addr != 1);

assign rst_diceroll = design_rst || (design_addr != 2);

assign rst_LCD = design_rst || (design_addr != 3);

assign rst_mc14500 = design_rst || (design_addr != 4);

assign rst_counter = design_rst || (design_addr != 5);

assign rst_tbb1143 = design_rst || (design_addr != 6);

assign rst_as2650 = design_rst || (design_addr != 7);

assign rst_6502 = design_rst || (design_addr != 8);

assign rst_as1802 = design_rst || (design_addr != 9);

assign rst_tune = design_rst || (design_addr != 10);

assign rst_posit = design_rst || (design_addr != 11);

assign rst_as512512512 = design_rst || (design_addr != 12);

assign rst_vgatest = design_rst || (design_addr != 13);

endmodule
