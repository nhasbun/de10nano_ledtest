module top(
  input clock,
  output reg led,

  output wire        hps_io_hps_io_emac1_inst_TX_CLK,  // hps_io.hps_io_emac1_inst_TX_CLK
  output wire        hps_io_hps_io_emac1_inst_TXD0,    // .hps_io_emac1_inst_TXD0
  output wire        hps_io_hps_io_emac1_inst_TXD1,    // .hps_io_emac1_inst_TXD1
  output wire        hps_io_hps_io_emac1_inst_TXD2,    // .hps_io_emac1_inst_TXD2
  output wire        hps_io_hps_io_emac1_inst_TXD3,    // .hps_io_emac1_inst_TXD3
  input  wire        hps_io_hps_io_emac1_inst_RXD0,    // .hps_io_emac1_inst_RXD0
  inout  wire        hps_io_hps_io_emac1_inst_MDIO,    // .hps_io_emac1_inst_MDIO
  output wire        hps_io_hps_io_emac1_inst_MDC,     // .hps_io_emac1_inst_MDC
  input  wire        hps_io_hps_io_emac1_inst_RX_CTL,  // .hps_io_emac1_inst_RX_CTL
  output wire        hps_io_hps_io_emac1_inst_TX_CTL,  // .hps_io_emac1_inst_TX_CTL
  input  wire        hps_io_hps_io_emac1_inst_RX_CLK,  // .hps_io_emac1_inst_RX_CLK
  input  wire        hps_io_hps_io_emac1_inst_RXD1,    // .hps_io_emac1_inst_RXD1
  input  wire        hps_io_hps_io_emac1_inst_RXD2,    // .hps_io_emac1_inst_RXD2
  input  wire        hps_io_hps_io_emac1_inst_RXD3,    // .hps_io_emac1_inst_RXD3
  output wire [14:0] memory_mem_a,                     // memory.mem_a
  output wire [2:0]  memory_mem_ba,                    // .mem_ba
  output wire        memory_mem_ck,                    // .mem_ck
  output wire        memory_mem_ck_n,                  // .mem_ck_n
  output wire        memory_mem_cke,                   // .mem_cke
  output wire        memory_mem_cs_n,                  // .mem_cs_n
  output wire        memory_mem_ras_n,                 // .mem_ras_n
  output wire        memory_mem_cas_n,                 // .mem_cas_n
  output wire        memory_mem_we_n,                  // .mem_we_n
  output wire        memory_mem_reset_n,               // .mem_reset_n
  inout  wire [31:0] memory_mem_dq,                    // .mem_dq
  inout  wire [3:0]  memory_mem_dqs,                   // .mem_dqs
  inout  wire [3:0]  memory_mem_dqs_n,                 // .mem_dqs_n
  output wire        memory_mem_odt,                   // .mem_odt
  output wire [3:0]  memory_mem_dm,                    // .mem_dm
  input  wire        memory_oct_rzqin  
  );

initial led = 0;
wire led_hps, clk_clk;

assign clk_clk = clock;
assign led_hps = pio_0_external_connection_export;

ledtest inst_ledtest
(
  .clk_clk                          (clk_clk),
  .hps_io_hps_io_emac1_inst_TX_CLK  (hps_io_hps_io_emac1_inst_TX_CLK),
  .hps_io_hps_io_emac1_inst_TXD0    (hps_io_hps_io_emac1_inst_TXD0),
  .hps_io_hps_io_emac1_inst_TXD1    (hps_io_hps_io_emac1_inst_TXD1),
  .hps_io_hps_io_emac1_inst_TXD2    (hps_io_hps_io_emac1_inst_TXD2),
  .hps_io_hps_io_emac1_inst_TXD3    (hps_io_hps_io_emac1_inst_TXD3),
  .hps_io_hps_io_emac1_inst_RXD0    (hps_io_hps_io_emac1_inst_RXD0),
  .hps_io_hps_io_emac1_inst_MDIO    (hps_io_hps_io_emac1_inst_MDIO),
  .hps_io_hps_io_emac1_inst_MDC     (hps_io_hps_io_emac1_inst_MDC),
  .hps_io_hps_io_emac1_inst_RX_CTL  (hps_io_hps_io_emac1_inst_RX_CTL),
  .hps_io_hps_io_emac1_inst_TX_CTL  (hps_io_hps_io_emac1_inst_TX_CTL),
  .hps_io_hps_io_emac1_inst_RX_CLK  (hps_io_hps_io_emac1_inst_RX_CLK),
  .hps_io_hps_io_emac1_inst_RXD1    (hps_io_hps_io_emac1_inst_RXD1),
  .hps_io_hps_io_emac1_inst_RXD2    (hps_io_hps_io_emac1_inst_RXD2),
  .hps_io_hps_io_emac1_inst_RXD3    (hps_io_hps_io_emac1_inst_RXD3),
  .memory_mem_a                     (memory_mem_a),
  .memory_mem_ba                    (memory_mem_ba),
  .memory_mem_ck                    (memory_mem_ck),
  .memory_mem_ck_n                  (memory_mem_ck_n),
  .memory_mem_cke                   (memory_mem_cke),
  .memory_mem_cs_n                  (memory_mem_cs_n),
  .memory_mem_ras_n                 (memory_mem_ras_n),
  .memory_mem_cas_n                 (memory_mem_cas_n),
  .memory_mem_we_n                  (memory_mem_we_n),
  .memory_mem_reset_n               (memory_mem_reset_n),
  .memory_mem_dq                    (memory_mem_dq),
  .memory_mem_dqs                   (memory_mem_dqs),
  .memory_mem_dqs_n                 (memory_mem_dqs_n),
  .memory_mem_odt                   (memory_mem_odt),
  .memory_mem_dm                    (memory_mem_dm),
  .memory_oct_rzqin                 (memory_oct_rzqin),
  .pio_0_external_connection_export (pio_0_external_connection_export)
);

always @(posedge clock) led <= led_hps;

endmodule