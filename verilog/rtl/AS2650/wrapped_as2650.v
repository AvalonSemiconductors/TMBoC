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

`default_nettype none

module wrapped_as2650(
`ifdef USE_POWER_PINS
	inout vccd1,
	inout vssd1,
`endif
	input wire clk,
	input wire rst,

	input wire [7:0] io_in,
	output wire [26:0] io_out,
	output wire io_oeb
);

	reg [15:0] lfsr;
	
	always @(posedge clk) begin
		if(rst) begin
			lfsr <= 16'hAAAA;
		end else begin
			lfsr <= {lfsr[0], lfsr[15], lfsr[14] ^ lfsr[0], lfsr[13] ^ lfsr[0], lfsr[12] ,lfsr[11] ^ lfsr[0], lfsr[10:1]};
		end
	end

	as2650 as2650(
		.clk(clk),
		.reset(rst),
		.adr(io_out[20:8]),
		.dbus_in(io_in[7:0]),
		.dbus_out(io_out[7:0]),
		.oeb(io_oeb),
		.sense(lfsr[5]),
		.d_c(io_out[25]),
		.m_io(io_out[24]),
		.wrp(io_out[23]),
		.opreq(io_out[22]),
		.rw(io_out[21]),
		.flag(io_out[26])
	);
endmodule
`default_nettype wire
