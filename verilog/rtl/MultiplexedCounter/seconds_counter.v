/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : seconds_counter                                              **
 **                                                                          **
 *****************************************************************************/

module seconds_counter( CLK,
                        FCLK,
                        ONES,
                        OVF,
                        RST,
                        TENS );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input FCLK;
   input RST;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] ONES;
   output       OVF;
   output [2:0] TENS;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus10;
   wire [2:0] s_logisimBus11;
   wire [2:0] s_logisimBus2;
   wire [3:0] s_logisimBus3;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet6 = RST;
   assign s_logisimNet7 = FCLK;
   assign s_logisimNet9 = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign ONES = s_logisimBus3[3:0];
   assign OVF  = s_logisimNet0;
   assign TENS = s_logisimBus2[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimBus10[3:0]  =  4'hA;


   // Constant
   assign  s_logisimBus11[2:0]  =  3'b110;


   // NOT Gate
   assign s_logisimNet8 = ~s_logisimNet7;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Comparator #(.nrOfBits(4),
                .twosComplement(0))
      ARITH_1 (.aEqualsB(s_logisimNet4),
               .aGreaterThanB(),
               .aLessThanB(),
               .dataA(s_logisimBus3[3:0]),
               .dataB(s_logisimBus10[3:0]));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_2 (.input1(s_logisimNet6),
               .input2(s_logisimNet5),
               .result(s_logisimNet12));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_3 (.input1(s_logisimNet6),
               .input2(s_logisimNet0),
               .result(s_logisimNet13));

   Comparator #(.nrOfBits(3),
                .twosComplement(0))
      ARITH_4 (.aEqualsB(s_logisimNet1),
               .aGreaterThanB(),
               .aLessThanB(),
               .dataA(s_logisimBus2[2:0]),
               .dataB(s_logisimBus11[2:0]));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet8),
                .d(s_logisimNet4),
                .preset(1'b0),
                .q(s_logisimNet5),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet8),
                .d(s_logisimNet1),
                .preset(1'b0),
                .q(s_logisimNet0),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   custom_counter_4   custom_counter_4_1 (.CLK(s_logisimNet9),
                                          .COUNT(s_logisimBus3[3:0]),
                                          .RST(s_logisimNet12));

   custom_counter_3   custom_counter_4_2 (.CLK(s_logisimNet5),
                                          .COUNT(s_logisimBus2[2:0]),
                                          .RST(s_logisimNet13));

endmodule
