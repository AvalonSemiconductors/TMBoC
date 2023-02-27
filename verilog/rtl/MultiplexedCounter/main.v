/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : main                                                         **
 **                                                                          **
 *****************************************************************************/

module main_counter( A,
             B,
             C,
             CLK,
             D,
             E,
             F,
             G,
             RST,
             SEL );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input RST;

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
   output SEL;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus12;
   wire [3:0] s_logisimBus15;
   wire [3:0] s_logisimBus22;
   wire [1:0] s_logisimBus23;
   wire [3:0] s_logisimBus24;
   wire [3:0] s_logisimBus7;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet20;
   wire       s_logisimNet21;
   wire       s_logisimNet25;
   wire       s_logisimNet26;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet8;
   wire       s_logisimNet9;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet10 = CLK;
   assign s_logisimNet25 = RST;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign A   = s_logisimNet9;
   assign B   = s_logisimNet18;
   assign C   = s_logisimNet21;
   assign D   = s_logisimNet4;
   assign E   = s_logisimNet5;
   assign F   = s_logisimNet19;
   assign G   = s_logisimNet14;
   assign SEL = s_logisimNet17;

   /*******************************************************************************
   ** Here all in-lined components are defined                                   **
   *******************************************************************************/

   // Constant
   assign  s_logisimBus24[3]  =  1'b0;


   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   AND_GATE #(.BubblesMask(2'b00))
      GATES_1 (.input1(s_logisimNet10),
               .input2(s_logisimNet25),
               .result(s_logisimNet0));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet10),
                .d(s_logisimNet16),
                .preset(1'b0),
                .q(),
                .qBar(s_logisimNet16),
                .reset(s_logisimNet0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet16),
                .d(s_logisimNet11),
                .preset(1'b0),
                .q(),
                .qBar(s_logisimNet11),
                .reset(s_logisimNet0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet11),
                .d(s_logisimNet6),
                .preset(1'b0),
                .q(s_logisimNet17),
                .qBar(s_logisimNet6),
                .reset(s_logisimNet0),
                .tick(1'b1));

   Multiplexer_bus_4 #(.nrOfBits(4))
      PLEXERS_5 (.enable(1'b1),
                 .muxIn_0(s_logisimBus7[3:0]),
                 .muxIn_1(s_logisimBus24[3:0]),
                 .muxIn_2(s_logisimBus22[3:0]),
                 .muxIn_3(s_logisimBus12[3:0]),
                 .muxOut(s_logisimBus15[3:0]),
                 .sel(s_logisimBus23[1:0]));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet6),
                .d(s_logisimNet8),
                .preset(1'b0),
                .q(s_logisimBus23[0]),
                .qBar(s_logisimNet8),
                .reset(s_logisimNet0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_logisimNet8),
                .d(s_logisimNet3),
                .preset(1'b0),
                .q(s_logisimBus23[1]),
                .qBar(s_logisimNet3),
                .reset(s_logisimNet0),
                .tick(1'b1));


   /*******************************************************************************
   ** Here all sub-circuits are defined                                          **
   *******************************************************************************/

   bcd_to_seg   bcd_to_seg_1 (.A(s_logisimNet9),
                              .B(s_logisimNet18),
                              .BCD(s_logisimBus15[3:0]),
                              .C(s_logisimNet21),
                              .D(s_logisimNet4),
                              .E(s_logisimNet5),
                              .F(s_logisimNet19),
                              .G(s_logisimNet14));

   full_counter   full_counter_1 (.CLK(s_logisimNet13),
                                  .FCLK(s_logisimNet10),
                                  .M_ONES(s_logisimBus22[3:0]),
                                  .M_TENS(s_logisimBus12[3:0]),
                                  .RST(s_logisimNet0),
                                  .S_ONES(s_logisimBus7[3:0]),
                                  .S_TENS(s_logisimBus24[2:0]));

   custom_counter_10   custom_counter_10_1 (.CLK(s_logisimNet10),
                                            .COUNT(),
                                            .OVF(s_logisimNet13),
                                            .RST(s_logisimNet0));

endmodule
