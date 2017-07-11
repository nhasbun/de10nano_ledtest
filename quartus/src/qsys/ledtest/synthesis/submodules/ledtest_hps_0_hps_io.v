// ledtest_hps_0_hps_io.v

// This file was auto-generated from altera_hps_io_hw.tcl.  If you edit it your changes
// will probably be lost.
// 
// Generated using ACDS version 17.0 595

`timescale 1 ps / 1 ps
module ledtest_hps_0_hps_io (
		output wire [14:0] mem_a,                    // memory.mem_a
		output wire [2:0]  mem_ba,                   //       .mem_ba
		output wire        mem_ck,                   //       .mem_ck
		output wire        mem_ck_n,                 //       .mem_ck_n
		output wire        mem_cke,                  //       .mem_cke
		output wire        mem_cs_n,                 //       .mem_cs_n
		output wire        mem_ras_n,                //       .mem_ras_n
		output wire        mem_cas_n,                //       .mem_cas_n
		output wire        mem_we_n,                 //       .mem_we_n
		output wire        mem_reset_n,              //       .mem_reset_n
		inout  wire [31:0] mem_dq,                   //       .mem_dq
		inout  wire [3:0]  mem_dqs,                  //       .mem_dqs
		inout  wire [3:0]  mem_dqs_n,                //       .mem_dqs_n
		output wire        mem_odt,                  //       .mem_odt
		output wire [3:0]  mem_dm,                   //       .mem_dm
		input  wire        oct_rzqin,                //       .oct_rzqin
		output wire        hps_io_emac1_inst_TX_CLK, // hps_io.hps_io_emac1_inst_TX_CLK
		output wire        hps_io_emac1_inst_TXD0,   //       .hps_io_emac1_inst_TXD0
		output wire        hps_io_emac1_inst_TXD1,   //       .hps_io_emac1_inst_TXD1
		output wire        hps_io_emac1_inst_TXD2,   //       .hps_io_emac1_inst_TXD2
		output wire        hps_io_emac1_inst_TXD3,   //       .hps_io_emac1_inst_TXD3
		input  wire        hps_io_emac1_inst_RXD0,   //       .hps_io_emac1_inst_RXD0
		inout  wire        hps_io_emac1_inst_MDIO,   //       .hps_io_emac1_inst_MDIO
		output wire        hps_io_emac1_inst_MDC,    //       .hps_io_emac1_inst_MDC
		input  wire        hps_io_emac1_inst_RX_CTL, //       .hps_io_emac1_inst_RX_CTL
		output wire        hps_io_emac1_inst_TX_CTL, //       .hps_io_emac1_inst_TX_CTL
		input  wire        hps_io_emac1_inst_RX_CLK, //       .hps_io_emac1_inst_RX_CLK
		input  wire        hps_io_emac1_inst_RXD1,   //       .hps_io_emac1_inst_RXD1
		input  wire        hps_io_emac1_inst_RXD2,   //       .hps_io_emac1_inst_RXD2
		input  wire        hps_io_emac1_inst_RXD3    //       .hps_io_emac1_inst_RXD3
	);

	ledtest_hps_0_hps_io_border border (
		.mem_a                    (mem_a),                    // memory.mem_a
		.mem_ba                   (mem_ba),                   //       .mem_ba
		.mem_ck                   (mem_ck),                   //       .mem_ck
		.mem_ck_n                 (mem_ck_n),                 //       .mem_ck_n
		.mem_cke                  (mem_cke),                  //       .mem_cke
		.mem_cs_n                 (mem_cs_n),                 //       .mem_cs_n
		.mem_ras_n                (mem_ras_n),                //       .mem_ras_n
		.mem_cas_n                (mem_cas_n),                //       .mem_cas_n
		.mem_we_n                 (mem_we_n),                 //       .mem_we_n
		.mem_reset_n              (mem_reset_n),              //       .mem_reset_n
		.mem_dq                   (mem_dq),                   //       .mem_dq
		.mem_dqs                  (mem_dqs),                  //       .mem_dqs
		.mem_dqs_n                (mem_dqs_n),                //       .mem_dqs_n
		.mem_odt                  (mem_odt),                  //       .mem_odt
		.mem_dm                   (mem_dm),                   //       .mem_dm
		.oct_rzqin                (oct_rzqin),                //       .oct_rzqin
		.hps_io_emac1_inst_TX_CLK (hps_io_emac1_inst_TX_CLK), // hps_io.hps_io_emac1_inst_TX_CLK
		.hps_io_emac1_inst_TXD0   (hps_io_emac1_inst_TXD0),   //       .hps_io_emac1_inst_TXD0
		.hps_io_emac1_inst_TXD1   (hps_io_emac1_inst_TXD1),   //       .hps_io_emac1_inst_TXD1
		.hps_io_emac1_inst_TXD2   (hps_io_emac1_inst_TXD2),   //       .hps_io_emac1_inst_TXD2
		.hps_io_emac1_inst_TXD3   (hps_io_emac1_inst_TXD3),   //       .hps_io_emac1_inst_TXD3
		.hps_io_emac1_inst_RXD0   (hps_io_emac1_inst_RXD0),   //       .hps_io_emac1_inst_RXD0
		.hps_io_emac1_inst_MDIO   (hps_io_emac1_inst_MDIO),   //       .hps_io_emac1_inst_MDIO
		.hps_io_emac1_inst_MDC    (hps_io_emac1_inst_MDC),    //       .hps_io_emac1_inst_MDC
		.hps_io_emac1_inst_RX_CTL (hps_io_emac1_inst_RX_CTL), //       .hps_io_emac1_inst_RX_CTL
		.hps_io_emac1_inst_TX_CTL (hps_io_emac1_inst_TX_CTL), //       .hps_io_emac1_inst_TX_CTL
		.hps_io_emac1_inst_RX_CLK (hps_io_emac1_inst_RX_CLK), //       .hps_io_emac1_inst_RX_CLK
		.hps_io_emac1_inst_RXD1   (hps_io_emac1_inst_RXD1),   //       .hps_io_emac1_inst_RXD1
		.hps_io_emac1_inst_RXD2   (hps_io_emac1_inst_RXD2),   //       .hps_io_emac1_inst_RXD2
		.hps_io_emac1_inst_RXD3   (hps_io_emac1_inst_RXD3)    //       .hps_io_emac1_inst_RXD3
	);

endmodule
