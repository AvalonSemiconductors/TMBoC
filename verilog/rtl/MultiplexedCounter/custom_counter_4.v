/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : custom_counter_4                                             **
 **                                                                          **
 *****************************************************************************/

module custom_counter_4( CLK,
                         COUNT,
                         RST );

   /*******************************************************************************
   ** The inputs are defined here                                                **
   *******************************************************************************/
   input CLK;
   input RST;

   /*******************************************************************************
   ** The outputs are defined here                                               **
   *******************************************************************************/
   output [3:0] COUNT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [3:0] s_logisimBus10;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet2;
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
   assign s_logisimNet1 = RST;
   assign s_logisimNet7 = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign COUNT = s_logisimBus10[3:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet7),
                .d(s_logisimNet3),
                .preset(1'b0),
                .q(s_logisimBus10[0]),
                .qBar(s_logisimNet3),
                .reset(s_logisimNet1),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet3),
                .d(s_logisimNet5),
                .preset(1'b0),
                .q(s_logisimBus10[1]),
                .qBar(s_logisimNet5),
                .reset(s_logisimNet1),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet5),
                .d(s_logisimNet4),
                .preset(1'b0),
                .q(s_logisimBus10[2]),
                .qBar(s_logisimNet4),
                .reset(s_logisimNet1),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_4 (.clock(s_logisimNet4),
                .d(s_logisimNet6),
                .preset(1'b0),
                .q(s_logisimBus10[3]),
                .qBar(s_logisimNet6),
                .reset(s_logisimNet1),
                .tick(1'b1));


endmodule
