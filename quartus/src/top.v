module top
(
  // CLOCKS
  input CLOCK50, RESET_N,

  // SWITCH Y LEDS
  input  [3:0]SWITCH_ARRAY_IO,
  output [7:0]LED_ARRAY_IO,

  // QSYS BULLSHIT
  output wire        hps_io_hps_io_emac1_inst_TX_CLK,
  output wire        hps_io_hps_io_emac1_inst_TXD0,
  output wire        hps_io_hps_io_emac1_inst_TXD1,
  output wire        hps_io_hps_io_emac1_inst_TXD2,
  output wire        hps_io_hps_io_emac1_inst_TXD3,
  input  wire        hps_io_hps_io_emac1_inst_RXD0,
  inout  wire        hps_io_hps_io_emac1_inst_MDIO,
  output wire        hps_io_hps_io_emac1_inst_MDC,
  input  wire        hps_io_hps_io_emac1_inst_RX_CTL,
  output wire        hps_io_hps_io_emac1_inst_TX_CTL,
  input  wire        hps_io_hps_io_emac1_inst_RX_CLK,
  input  wire        hps_io_hps_io_emac1_inst_RXD1,
  input  wire        hps_io_hps_io_emac1_inst_RXD2,
  input  wire        hps_io_hps_io_emac1_inst_RXD3,
  output wire [14:0] memory_mem_a,
  output wire [2:0]  memory_mem_ba,
  output wire        memory_mem_ck,
  output wire        memory_mem_ck_n,
  output wire        memory_mem_cke,
  output wire        memory_mem_cs_n,
  output wire        memory_mem_ras_n,
  output wire        memory_mem_cas_n,
  output wire        memory_mem_we_n,
  output wire        memory_mem_reset_n,
  inout  wire [31:0] memory_mem_dq,
  inout  wire [3:0]  memory_mem_dqs,
  inout  wire [3:0]  memory_mem_dqs_n,
  output wire        memory_mem_odt,
  output wire [3:0]  memory_mem_dm,
  input  wire        memory_oct_rzqin
);

wire [7:0] led_array_io_hps;

ledtest inst_ledtest
(
  // QSYS BS
  .hps_io_hps_io_emac1_inst_TX_CLK (hps_io_hps_io_emac1_inst_TX_CLK),
  .hps_io_hps_io_emac1_inst_TXD0   (hps_io_hps_io_emac1_inst_TXD0),
  .hps_io_hps_io_emac1_inst_TXD1   (hps_io_hps_io_emac1_inst_TXD1),
  .hps_io_hps_io_emac1_inst_TXD2   (hps_io_hps_io_emac1_inst_TXD2),
  .hps_io_hps_io_emac1_inst_TXD3   (hps_io_hps_io_emac1_inst_TXD3),
  .hps_io_hps_io_emac1_inst_RXD0   (hps_io_hps_io_emac1_inst_RXD0),
  .hps_io_hps_io_emac1_inst_MDIO   (hps_io_hps_io_emac1_inst_MDIO),
  .hps_io_hps_io_emac1_inst_MDC    (hps_io_hps_io_emac1_inst_MDC),
  .hps_io_hps_io_emac1_inst_RX_CTL (hps_io_hps_io_emac1_inst_RX_CTL),
  .hps_io_hps_io_emac1_inst_TX_CTL (hps_io_hps_io_emac1_inst_TX_CTL),
  .hps_io_hps_io_emac1_inst_RX_CLK (hps_io_hps_io_emac1_inst_RX_CLK),
  .hps_io_hps_io_emac1_inst_RXD1   (hps_io_hps_io_emac1_inst_RXD1),
  .hps_io_hps_io_emac1_inst_RXD2   (hps_io_hps_io_emac1_inst_RXD2),
  .hps_io_hps_io_emac1_inst_RXD3   (hps_io_hps_io_emac1_inst_RXD3),
  .memory_mem_a                    (memory_mem_a),
  .memory_mem_ba                   (memory_mem_ba),
  .memory_mem_ck                   (memory_mem_ck),
  .memory_mem_ck_n                 (memory_mem_ck_n),
  .memory_mem_cke                  (memory_mem_cke),
  .memory_mem_cs_n                 (memory_mem_cs_n),
  .memory_mem_ras_n                (memory_mem_ras_n),
  .memory_mem_cas_n                (memory_mem_cas_n),
  .memory_mem_we_n                 (memory_mem_we_n),
  .memory_mem_reset_n              (memory_mem_reset_n),
  .memory_mem_dq                   (memory_mem_dq),
  .memory_mem_dqs                  (memory_mem_dqs),
  .memory_mem_dqs_n                (memory_mem_dqs_n),
  .memory_mem_odt                  (memory_mem_odt),
  .memory_mem_dm                   (memory_mem_dm),
  .memory_oct_rzqin                (memory_oct_rzqin),

  // USEFUL SHIT
  .clk_clk                         (CLOCK50),
  .led_array_io_export             (led_array_io_hps),
  .switch_array_io_export          (SWITCH_ARRAY_IO)
);

// ** PLL 200 ** //
wire clock200, locked200, reset;
assign reset = ~RESET_N;

pll_200 inst_pll_200(
  .refclk   (CLOCK50),
  .rst      (reset),
  .outclk_0 (clock200),
  .locked   (locked200)
);

// ** LED BEHAVIOR ** //
assign LED_ARRAY_IO[7:2] = led_array_io_hps[7:2];
assign LED_ARRAY_IO[1] = led_array_io_hps[1] || counter_max;
assign LED_ARRAY_IO[0] = led_array_io_hps[0] || locked200;

// ** DUMMY FUNCTIONALITY FOR CLOCK200 ** //
integer counter; initial counter = 0;

parameter PWM_VALUE = 10000;

always @(posedge clock200 or negedge locked200) begin
  if(~locked200) counter <= 0;
  else begin
    if(counter == PWM_VALUE)
      counter <= 0;
    else
      counter <= counter + 1'b1;
  end
end

wire counter_max;
assign counter_max = (counter == PWM_VALUE)? 1 : 0;

endmodule