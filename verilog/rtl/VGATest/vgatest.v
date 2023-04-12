module vgatest(
	output reg [7:0] pixel,
	output hsync,
	output vsync,
	input pattern_sel,
	
	input clk,
	input rst
);

reg [9:0] hcounter;
reg [8:0] vcounter;
reg [5:0] framecounter;

wire [3:0] hc = framecounter[5:2] + hcounter[3:0];

assign hsync = hcounter < 756 || hcounter >= 828;
assign vsync = vcounter < 401 || vcounter > 404;

reg [16:0] bitmapColAddr;
wire [14:0] fullBitmapAddr = bitmapColAddr + hcounter[9:2];
wire bitmapVal;

bitmap bitmap(fullBitmapAddr, bitmapVal);

always @(posedge clk) begin
	if(rst) begin
		pixel <= 0;
		hcounter <= 0;
		vcounter <= 0;
		framecounter <= 0;
		bitmapColAddr <= 0;
	end else begin
		hcounter <= hcounter + 1;
		if(hcounter >= 720 || vcounter >= 400) pixel <= 0;
		else begin
			if(pattern_sel) begin
				pixel <= {vcounter[3:0], hc[3:0]};
			end else begin
				pixel <= {8{bitmapVal}};
			end
		end
		if(hcounter == 935) begin
			hcounter <= 0;
			bitmapColAddr <= bitmapColAddr + (vcounter[1:0] == 2'b11 ? 180 : 0);
			if(vcounter == 445) begin
				vcounter <= 0;
				framecounter <= framecounter + 1;
				bitmapColAddr <= 0;
			end else begin
				vcounter <= vcounter + 1;
			end
		end
	end
end

endmodule
