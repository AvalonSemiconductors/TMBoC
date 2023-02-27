/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : main                                                         **
 **                                                                          **
 *****************************************************************************/

module main_mul( A0,
             A1,
             A2,
             A3,
             B0,
             B1,
             B2,
             B3,
             R0,
             R1,
             R2,
             R3,
             R4,
             R5,
             R6,
             R7 );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input A0;
   input A1;
   input A2;
   input A3;
   input B0;
   input B1;
   input B2;
   input B3;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output R0;
   output R1;
   output R2;
   output R3;
   output R4;
   output R5;
   output R6;
   output R7;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [7:0] s_logisimBus0;
   wire [5:0] s_logisimBus12;
   wire [7:0] s_logisimBus16;
   wire [5:0] s_logisimBus20;
   wire [7:0] s_logisimBus24;
   wire [7:0] s_logisimBus27;
   wire [7:0] s_logisimBus29;
   wire [5:0] s_logisimBus30;
   wire [5:0] s_logisimBus31;
   wire [5:0] s_logisimBus34;
   wire [7:0] s_logisimBus35;
   wire [7:0] s_logisimBus36;
   wire [7:0] s_logisimBus37;
   wire [7:0] s_logisimBus7;
   wire [5:0] s_logisimBus8;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet21;
   wire       s_logisimNet22;
   wire       s_logisimNet23;
   wire       s_logisimNet26;
   wire       s_logisimNet28;
   wire       s_logisimNet3;
   wire       s_logisimNet32;
   wire       s_logisimNet33;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all wiring is defined                                                 **
   *******************************************************************************/
   assign s_logisimBus12[0] = s_logisimNet10;
   assign s_logisimBus12[1] = s_logisimNet6;
   assign s_logisimBus12[2] = s_logisimNet9;
   assign s_logisimBus12[3] = s_logisimNet23;
   assign s_logisimBus12[4] = s_logisimNet3;
   assign s_logisimBus12[5] = s_logisimNet3;
   assign s_logisimBus16[6] = s_logisimNet28;
   assign s_logisimBus16[7] = s_logisimNet28;
   assign s_logisimBus29[0] = s_logisimNet13;
   assign s_logisimBus29[1] = s_logisimNet13;
   assign s_logisimBus29[2] = s_logisimNet10;
   assign s_logisimBus29[3] = s_logisimNet6;
   assign s_logisimBus29[4] = s_logisimNet9;
   assign s_logisimBus29[5] = s_logisimNet23;
   assign s_logisimBus29[6] = s_logisimNet13;
   assign s_logisimBus29[7] = s_logisimNet13;
   assign s_logisimBus30[1] = s_logisimNet10;
   assign s_logisimBus30[2] = s_logisimNet6;
   assign s_logisimBus30[3] = s_logisimNet9;
   assign s_logisimBus30[4] = s_logisimNet23;
   assign s_logisimBus31[0] = s_logisimNet1;
   assign s_logisimBus31[1] = s_logisimNet1;
   assign s_logisimBus31[2] = s_logisimNet1;
   assign s_logisimBus31[3] = s_logisimNet1;
   assign s_logisimBus31[4] = s_logisimNet1;
   assign s_logisimBus31[5] = s_logisimNet1;
   assign s_logisimBus34[0] = s_logisimNet4;
   assign s_logisimBus34[1] = s_logisimNet4;
   assign s_logisimBus34[2] = s_logisimNet4;
   assign s_logisimBus34[3] = s_logisimNet4;
   assign s_logisimBus34[4] = s_logisimNet4;
   assign s_logisimBus34[5] = s_logisimNet4;
   assign s_logisimBus35[0] = s_logisimNet2;
   assign s_logisimBus35[1] = s_logisimNet2;
   assign s_logisimBus35[2] = s_logisimNet2;
   assign s_logisimBus35[3] = s_logisimNet2;
   assign s_logisimBus35[4] = s_logisimNet2;
   assign s_logisimBus35[5] = s_logisimNet2;
   assign s_logisimBus35[6] = s_logisimNet2;
   assign s_logisimBus35[7] = s_logisimNet2;
   assign s_logisimBus36[0] = s_logisimNet5;
   assign s_logisimBus36[1] = s_logisimNet5;
   assign s_logisimBus36[2] = s_logisimNet5;
   assign s_logisimBus36[3] = s_logisimNet5;
   assign s_logisimBus36[4] = s_logisimNet5;
   assign s_logisimBus36[5] = s_logisimNet5;
   assign s_logisimBus36[6] = s_logisimNet5;
   assign s_logisimBus36[7] = s_logisimNet5;
   assign s_logisimBus37[0] = s_logisimNet14;
   assign s_logisimBus37[1] = s_logisimNet14;
   assign s_logisimBus37[2] = s_logisimNet14;
   assign s_logisimBus37[3] = s_logisimNet10;
   assign s_logisimBus37[4] = s_logisimNet6;
   assign s_logisimBus37[5] = s_logisimNet9;
   assign s_logisimBus37[6] = s_logisimNet23;
   assign s_logisimBus37[7] = s_logisimNet14;

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet1  = B0;
   assign s_logisimNet10 = A0;
   assign s_logisimNet2  = B2;
   assign s_logisimNet23 = A3;
   assign s_logisimNet4  = B1;
   assign s_logisimNet5  = B3;
   assign s_logisimNet6  = A1;
   assign s_logisimNet9  = A2;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign R0 = s_logisimBus27[0];
   assign R1 = s_logisimBus27[1];
   assign R2 = s_logisimBus27[2];
   assign R3 = s_logisimBus27[3];
   assign R4 = s_logisimBus27[4];
   assign R5 = s_logisimBus27[5];
   assign R6 = s_logisimBus27[6];
   assign R7 = s_logisimBus27[7];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimNet3  =  1'b0;


   // Constant
   assign  s_logisimBus30[0]  =  1'b0;


   // Constant
   assign  s_logisimBus30[5]  =  1'b0;


   // Constant
   assign  s_logisimNet28  =  1'b0;


   // Constant
   assign  s_logisimNet13  =  1'b0;


   // Constant
   assign  s_logisimNet14  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Adder #(.extendedBits(7),
           .nrOfBits(6))
      ARITH_1 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus8[5:0]),
               .dataB(s_logisimBus20[5:0]),
               .result(s_logisimBus16[5:0]));

   AND_GATE_BUS #(.BubblesMask(2'b00),
                  .NrOfBits(6))
      GATES_2 (.input1(s_logisimBus12[5:0]),
               .input2(s_logisimBus31[5:0]),
               .result(s_logisimBus8[5:0]));

   AND_GATE_BUS #(.BubblesMask(2'b00),
                  .NrOfBits(6))
      GATES_3 (.input1(s_logisimBus30[5:0]),
               .input2(s_logisimBus34[5:0]),
               .result(s_logisimBus20[5:0]));

   Adder #(.extendedBits(9),
           .nrOfBits(8))
      ARITH_4 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus16[7:0]),
               .dataB(s_logisimBus24[7:0]),
               .result(s_logisimBus7[7:0]));

   AND_GATE_BUS #(.BubblesMask(2'b00),
                  .NrOfBits(8))
      GATES_5 (.input1(s_logisimBus29[7:0]),
               .input2(s_logisimBus35[7:0]),
               .result(s_logisimBus24[7:0]));

   Adder #(.extendedBits(9),
           .nrOfBits(8))
      ARITH_6 (.carryIn(1'b0),
               .carryOut(),
               .dataA(s_logisimBus7[7:0]),
               .dataB(s_logisimBus0[7:0]),
               .result(s_logisimBus27[7:0]));

   AND_GATE_BUS #(.BubblesMask(2'b00),
                  .NrOfBits(8))
      GATES_7 (.input1(s_logisimBus37[7:0]),
               .input2(s_logisimBus36[7:0]),
               .result(s_logisimBus0[7:0]));


endmodule
