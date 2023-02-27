/******************************************************************************
 ** Logisim-evolution goes FPGA automatic generated Verilog code             **
 ** https://github.com/logisim-evolution/                                    **
 **                                                                          **
 ** Component : custom_counter_3                                             **
 **                                                                          **
 *****************************************************************************/

module custom_counter_3( CLK,
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
   output [2:0] COUNT;

   /*******************************************************************************
   ** The wires are defined here                                                 **
   *******************************************************************************/
   wire [2:0] s_logisimBus8;
   wire       s_logisimNet0;
   wire       s_logisimNet1;
   wire       s_logisimNet2;
   wire       s_logisimNet3;
   wire       s_logisimNet4;
   wire       s_logisimNet5;
   wire       s_logisimNet6;
   wire       s_logisimNet7;

   /*******************************************************************************
   ** The module functionality is described here                                 **
   *******************************************************************************/

   /*******************************************************************************
   ** Here all input connections are defined                                     **
   *******************************************************************************/
   assign s_logisimNet0 = RST;
   assign s_logisimNet4 = CLK;

   /*******************************************************************************
   ** Here all output connections are defined                                    **
   *******************************************************************************/
   assign COUNT = s_logisimBus8[2:0];

   /*******************************************************************************
   ** Here all normal components are defined                                     **
   *******************************************************************************/
   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_1 (.clock(s_logisimNet4),
                .d(s_logisimNet1),
                .preset(1'b0),
                .q(s_logisimBus8[0]),
                .qBar(s_logisimNet1),
                .reset(s_logisimNet0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_2 (.clock(s_logisimNet1),
                .d(s_logisimNet2),
                .preset(1'b0),
                .q(s_logisimBus8[1]),
                .qBar(s_logisimNet2),
                .reset(s_logisimNet0),
                .tick(1'b1));

   D_FLIPFLOP #(.invertClockEnable(0))
      MEMORY_3 (.clock(s_logisimNet2),
                .d(s_logisimNet3),
                .preset(1'b0),
                .q(s_logisimBus8[2]),
                .qBar(s_logisimNet3),
                .reset(s_logisimNet0),
                .tick(1'b1));


endmodule
