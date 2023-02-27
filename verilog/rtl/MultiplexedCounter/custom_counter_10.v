/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : custom_counter_10                                            **
 **                                                                          **
 *****************************************************************************/

module custom_counter_10( CLK,
                          COUNT,
                          OVF,
                          RST );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input RST;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [9:0] COUNT;
   output       OVF;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [9:0] s_logisimBus21;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet10;
   wire       s_logisimNet11;
   wire       s_logisimNet12;
   wire       s_logisimNet13;
   wire       s_logisimNet14;
   wire       s_logisimNet15;
   wire       s_logisimNet16;
   wire       s_logisimNet17;
   wire       s_logisimNet18;
   wire       s_logisimNet19;
   wire       s_logisimNet2;
   wire       s_logisimNet20;
   wire       s_logisimNet22;
   wire       s_logisimNet3;
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
   assign s_logisimNet2 = RST;
   assign s_logisimNet3 = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign COUNT = s_logisimBus21[9:0];
   assign OVF   = s_logisimNet5;

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet3),
                .d(s_logisimNet10),
                .preset(1'b0),
                .q(s_logisimBus21[0]),
                .qBar(s_logisimNet10),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet10),
                .d(s_logisimNet15),
                .preset(1'b0),
                .q(s_logisimBus21[1]),
                .qBar(s_logisimNet15),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet15),
                .d(s_logisimNet16),
                .preset(1'b0),
                .q(s_logisimBus21[2]),
                .qBar(s_logisimNet16),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet16),
                .d(s_logisimNet6),
                .preset(1'b0),
                .q(s_logisimBus21[3]),
                .qBar(s_logisimNet6),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_5 (.clock(s_logisimNet6),
                .d(s_logisimNet13),
                .preset(1'b0),
                .q(s_logisimBus21[4]),
                .qBar(s_logisimNet13),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_6 (.clock(s_logisimNet11),
                .d(s_logisimNet5),
                .preset(1'b0),
                .q(s_logisimBus21[9]),
                .qBar(s_logisimNet5),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_7 (.clock(s_logisimNet7),
                .d(s_logisimNet14),
                .preset(1'b0),
                .q(s_logisimBus21[6]),
                .qBar(s_logisimNet14),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_8 (.clock(s_logisimNet14),
                .d(s_logisimNet1),
                .preset(1'b0),
                .q(s_logisimBus21[7]),
                .qBar(s_logisimNet1),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_9 (.clock(s_logisimNet13),
                .d(s_logisimNet7),
                .preset(1'b0),
                .q(s_logisimBus21[5]),
                .qBar(s_logisimNet7),
                .reset(s_logisimNet2),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_10 (.clock(s_logisimNet1),
                 .d(s_logisimNet11),
                 .preset(1'b0),
                 .q(s_logisimBus21[8]),
                 .qBar(s_logisimNet11),
                 .reset(s_logisimNet2),
                 .tick(1'b1));


endmodule
