/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : bcd_to_seg                                                   **
 **                                                                          **
 *****************************************************************************/

module bcd_to_seg( A,
                   B,
                   BCD,
                   C,
                   D,
                   E,
                   F,
                   G );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input [3:0] BCD;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output A;
   output B;
   output C;
   output D;
   output E;
   output F;
   output G;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [6:0] s_logisimBus3;
   wire [3:0] s_logisimBus7;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet2;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet8;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimBus7[3:0] = BCD;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A = s_logisimBus3[0];
   assign B = s_logisimBus3[1];
   assign C = s_logisimBus3[2];
   assign D = s_logisimBus3[3];
   assign E = s_logisimBus3[4];
   assign F = s_logisimBus3[5];
   assign G = s_logisimBus3[6];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // ROM: ROM_1
   reg[6:0] s_ROM_1_reg;
      always @(*)
      begin
         case (s_logisimBus7)
         4'h0 : s_ROM_1_reg = {3'b011, 4'hF};
         4'h1 : s_ROM_1_reg = {3'b000, 4'h6};
         4'h2 : s_ROM_1_reg = {3'b101, 4'hB};
         4'h3 : s_ROM_1_reg = {3'b100, 4'hF};
         4'h4 : s_ROM_1_reg = {3'b110, 4'h6};
         4'h5 : s_ROM_1_reg = {3'b110, 4'hD};
         4'h6 : s_ROM_1_reg = {3'b111, 4'hD};
         4'h7 : s_ROM_1_reg = {3'b000, 4'h7};
         4'h8 : s_ROM_1_reg = {3'b111, 4'hF};
         4'h9 : s_ROM_1_reg = {3'b110, 4'hF};
         default : s_ROM_1_reg = {3'b000, 4'h0};
      endcase
   end

   assign s_logisimBus3 = s_ROM_1_reg;

endmodule
