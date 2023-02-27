/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : full_counter                                                 **
 **                                                                          **
 *****************************************************************************/

module full_counter( CLK,
                     FCLK,
                     M_ONES,
                     M_TENS,
                     RST,
                     S_ONES,
                     S_TENS );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input FCLK;
   input RST;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] M_ONES;
   output [3:0] M_TENS;
   output [3:0] S_ONES;
   output [2:0] S_TENS;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus12;
   wire [3:0] s_logisimBus13;
   wire [3:0] s_logisimBus14;
   wire [3:0] s_logisimBus7;
   wire [3:0] s_logisimBus8;
   wire [3:0] s_logisimBus9;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0  = RST;
   assign s_logisimNet11 = FCLK;
   assign s_logisimNet6  = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign M_ONES = s_logisimBus8[3:0];
   assign M_TENS = s_logisimBus7[3:0];
   assign S_ONES = s_logisimBus9[3:0];
   assign S_TENS = s_logisimBus12[2:0];

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimBus13[3:0]  =  4'hA;


   // Constant
   assign  s_logisimBus14[3:0]  =  4'hA;


   // NOT Gate
   assign s_logisimNet10 = ~s_logisimNet11;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   Comparator #(.nrOfBits(4),
                .twosComplement(0))
      ARITH_1 (.aEqualsB(s_logisimNet3),
               .aGreaterThanB(),
               .aLessThanB(),
               .dataA(s_logisimBus8[3:0]),
               .dataB(s_logisimBus13[3:0]));

   Comparator #(.nrOfBits(4),
                .twosComplement(0))
      ARITH_2 (.aEqualsB(s_logisimNet2),
               .aGreaterThanB(),
               .aLessThanB(),
               .dataA(s_logisimBus7[3:0]),
               .dataB(s_logisimBus14[3:0]));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet10),
                .d(s_logisimNet3),
                .preset(1'b0),
                .q(s_logisimNet4),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_4 (.input1(s_logisimNet0),
               .input2(s_logisimNet4),
               .result(s_logisimNet15));

   OR_GATE #(.BubblesMask(2'b00))
      GATES_5 (.input1(s_logisimNet0),
               .input2(s_logisimNet5),
               .result(s_logisimNet16));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet10),
                .d(s_logisimNet2),
                .preset(1'b0),
                .q(s_logisimNet5),
                .qBar(),
                .reset(1'b0),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   seconds_counter   seconds_counter_1 (.CLK(s_logisimNet6),
                                        .FCLK(s_logisimNet11),
                                        .ONES(s_logisimBus9[3:0]),
                                        .OVF(s_logisimNet1),
                                        .RST(s_logisimNet0),
                                        .TENS(s_logisimBus12[2:0]));

   custom_counter_4   custom_counter_4_1 (.CLK(s_logisimNet1),
                                          .COUNT(s_logisimBus8[3:0]),
                                          .RST(s_logisimNet15));

   custom_counter_4   custom_counter_4_2 (.CLK(s_logisimNet4),
                                          .COUNT(s_logisimBus7[3:0]),
                                          .RST(s_logisimNet16));

endmodule
