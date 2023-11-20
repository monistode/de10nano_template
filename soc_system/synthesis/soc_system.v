// soc_system.v

// Generated using ACDS version 22.1 922

`timescale 1 ps / 1 ps
module soc_system (
		input  wire        clk_clk,                 //             clk.clk
		output wire        hps_0_h2f_reset_reset_n, // hps_0_h2f_reset.reset_n
		output wire [14:0] memory_mem_a,            //          memory.mem_a
		output wire [2:0]  memory_mem_ba,           //                .mem_ba
		output wire        memory_mem_ck,           //                .mem_ck
		output wire        memory_mem_ck_n,         //                .mem_ck_n
		output wire        memory_mem_cke,          //                .mem_cke
		output wire        memory_mem_cs_n,         //                .mem_cs_n
		output wire        memory_mem_ras_n,        //                .mem_ras_n
		output wire        memory_mem_cas_n,        //                .mem_cas_n
		output wire        memory_mem_we_n,         //                .mem_we_n
		output wire        memory_mem_reset_n,      //                .mem_reset_n
		inout  wire [31:0] memory_mem_dq,           //                .mem_dq
		inout  wire [3:0]  memory_mem_dqs,          //                .mem_dqs
		inout  wire [3:0]  memory_mem_dqs_n,        //                .mem_dqs_n
		output wire        memory_mem_odt,          //                .mem_odt
		output wire [3:0]  memory_mem_dm,           //                .mem_dm
		input  wire        memory_oct_rzqin,        //                .oct_rzqin
		input  wire        reset_reset_n,           //           reset.reset_n
		input  wire [15:0] sdram_address,           //           sdram.address
		input  wire [3:0]  sdram_byte_enable,       //                .byte_enable
		input  wire        sdram_read,              //                .read
		input  wire        sdram_write,             //                .write
		input  wire [31:0] sdram_write_data,        //                .write_data
		output wire        sdram_acknowledge,       //                .acknowledge
		output wire [31:0] sdram_read_data,         //                .read_data
		input  wire        uart_RXD,                //            uart.RXD
		output wire        uart_TXD,                //                .TXD
		input  wire [7:0]  uart_in_data,            //         uart_in.data
		input  wire        uart_in_error,           //                .error
		input  wire        uart_in_valid,           //                .valid
		output wire        uart_in_ready,           //                .ready
		input  wire        uart_out_ready,          //        uart_out.ready
		output wire [7:0]  uart_out_data,           //                .data
		output wire        uart_out_error,          //                .error
		output wire        uart_out_valid           //                .valid
	);

	wire  [31:0] bridge_0_avalon_master_readdata;                                        // mm_interconnect_0:bridge_0_avalon_master_readdata -> bridge_0:avalon_readdata
	wire         bridge_0_avalon_master_waitrequest;                                     // mm_interconnect_0:bridge_0_avalon_master_waitrequest -> bridge_0:avalon_waitrequest
	wire   [3:0] bridge_0_avalon_master_byteenable;                                      // bridge_0:avalon_byteenable -> mm_interconnect_0:bridge_0_avalon_master_byteenable
	wire         bridge_0_avalon_master_read;                                            // bridge_0:avalon_read -> mm_interconnect_0:bridge_0_avalon_master_read
	wire  [15:0] bridge_0_avalon_master_address;                                         // bridge_0:avalon_address -> mm_interconnect_0:bridge_0_avalon_master_address
	wire         bridge_0_avalon_master_write;                                           // bridge_0:avalon_write -> mm_interconnect_0:bridge_0_avalon_master_write
	wire  [31:0] bridge_0_avalon_master_writedata;                                       // bridge_0:avalon_writedata -> mm_interconnect_0:bridge_0_avalon_master_writedata
	wire  [31:0] mm_interconnect_0_address_span_extender_0_windowed_slave_readdata;      // address_span_extender_0:avs_s0_readdata -> mm_interconnect_0:address_span_extender_0_windowed_slave_readdata
	wire         mm_interconnect_0_address_span_extender_0_windowed_slave_waitrequest;   // address_span_extender_0:avs_s0_waitrequest -> mm_interconnect_0:address_span_extender_0_windowed_slave_waitrequest
	wire  [13:0] mm_interconnect_0_address_span_extender_0_windowed_slave_address;       // mm_interconnect_0:address_span_extender_0_windowed_slave_address -> address_span_extender_0:avs_s0_address
	wire         mm_interconnect_0_address_span_extender_0_windowed_slave_read;          // mm_interconnect_0:address_span_extender_0_windowed_slave_read -> address_span_extender_0:avs_s0_read
	wire   [3:0] mm_interconnect_0_address_span_extender_0_windowed_slave_byteenable;    // mm_interconnect_0:address_span_extender_0_windowed_slave_byteenable -> address_span_extender_0:avs_s0_byteenable
	wire         mm_interconnect_0_address_span_extender_0_windowed_slave_readdatavalid; // address_span_extender_0:avs_s0_readdatavalid -> mm_interconnect_0:address_span_extender_0_windowed_slave_readdatavalid
	wire         mm_interconnect_0_address_span_extender_0_windowed_slave_write;         // mm_interconnect_0:address_span_extender_0_windowed_slave_write -> address_span_extender_0:avs_s0_write
	wire  [31:0] mm_interconnect_0_address_span_extender_0_windowed_slave_writedata;     // mm_interconnect_0:address_span_extender_0_windowed_slave_writedata -> address_span_extender_0:avs_s0_writedata
	wire   [0:0] mm_interconnect_0_address_span_extender_0_windowed_slave_burstcount;    // mm_interconnect_0:address_span_extender_0_windowed_slave_burstcount -> address_span_extender_0:avs_s0_burstcount
	wire         address_span_extender_0_expanded_master_waitrequest;                    // mm_interconnect_1:address_span_extender_0_expanded_master_waitrequest -> address_span_extender_0:avm_m0_waitrequest
	wire  [31:0] address_span_extender_0_expanded_master_readdata;                       // mm_interconnect_1:address_span_extender_0_expanded_master_readdata -> address_span_extender_0:avm_m0_readdata
	wire  [31:0] address_span_extender_0_expanded_master_address;                        // address_span_extender_0:avm_m0_address -> mm_interconnect_1:address_span_extender_0_expanded_master_address
	wire         address_span_extender_0_expanded_master_read;                           // address_span_extender_0:avm_m0_read -> mm_interconnect_1:address_span_extender_0_expanded_master_read
	wire   [3:0] address_span_extender_0_expanded_master_byteenable;                     // address_span_extender_0:avm_m0_byteenable -> mm_interconnect_1:address_span_extender_0_expanded_master_byteenable
	wire         address_span_extender_0_expanded_master_readdatavalid;                  // mm_interconnect_1:address_span_extender_0_expanded_master_readdatavalid -> address_span_extender_0:avm_m0_readdatavalid
	wire         address_span_extender_0_expanded_master_write;                          // address_span_extender_0:avm_m0_write -> mm_interconnect_1:address_span_extender_0_expanded_master_write
	wire  [31:0] address_span_extender_0_expanded_master_writedata;                      // address_span_extender_0:avm_m0_writedata -> mm_interconnect_1:address_span_extender_0_expanded_master_writedata
	wire   [0:0] address_span_extender_0_expanded_master_burstcount;                     // address_span_extender_0:avm_m0_burstcount -> mm_interconnect_1:address_span_extender_0_expanded_master_burstcount
	wire  [63:0] mm_interconnect_1_hps_0_f2h_sdram0_data_readdata;                       // hps_0:f2h_sdram0_READDATA -> mm_interconnect_1:hps_0_f2h_sdram0_data_readdata
	wire         mm_interconnect_1_hps_0_f2h_sdram0_data_waitrequest;                    // hps_0:f2h_sdram0_WAITREQUEST -> mm_interconnect_1:hps_0_f2h_sdram0_data_waitrequest
	wire  [28:0] mm_interconnect_1_hps_0_f2h_sdram0_data_address;                        // mm_interconnect_1:hps_0_f2h_sdram0_data_address -> hps_0:f2h_sdram0_ADDRESS
	wire         mm_interconnect_1_hps_0_f2h_sdram0_data_read;                           // mm_interconnect_1:hps_0_f2h_sdram0_data_read -> hps_0:f2h_sdram0_READ
	wire   [7:0] mm_interconnect_1_hps_0_f2h_sdram0_data_byteenable;                     // mm_interconnect_1:hps_0_f2h_sdram0_data_byteenable -> hps_0:f2h_sdram0_BYTEENABLE
	wire         mm_interconnect_1_hps_0_f2h_sdram0_data_readdatavalid;                  // hps_0:f2h_sdram0_READDATAVALID -> mm_interconnect_1:hps_0_f2h_sdram0_data_readdatavalid
	wire         mm_interconnect_1_hps_0_f2h_sdram0_data_write;                          // mm_interconnect_1:hps_0_f2h_sdram0_data_write -> hps_0:f2h_sdram0_WRITE
	wire  [63:0] mm_interconnect_1_hps_0_f2h_sdram0_data_writedata;                      // mm_interconnect_1:hps_0_f2h_sdram0_data_writedata -> hps_0:f2h_sdram0_WRITEDATA
	wire   [7:0] mm_interconnect_1_hps_0_f2h_sdram0_data_burstcount;                     // mm_interconnect_1:hps_0_f2h_sdram0_data_burstcount -> hps_0:f2h_sdram0_BURSTCOUNT
	wire         rst_controller_reset_out_reset;                                         // rst_controller:reset_out -> [address_span_extender_0:reset, bridge_0:reset, mm_interconnect_0:bridge_0_reset_reset_bridge_in_reset_reset, mm_interconnect_1:address_span_extender_0_reset_reset_bridge_in_reset_reset, rs232_0:reset]
	wire         rst_controller_001_reset_out_reset;                                     // rst_controller_001:reset_out -> mm_interconnect_1:hps_0_f2h_sdram0_data_translator_reset_reset_bridge_in_reset_reset

	altera_address_span_extender #(
		.DATA_WIDTH           (32),
		.BYTEENABLE_WIDTH     (4),
		.MASTER_ADDRESS_WIDTH (32),
		.SLAVE_ADDRESS_WIDTH  (14),
		.SLAVE_ADDRESS_SHIFT  (2),
		.BURSTCOUNT_WIDTH     (1),
		.CNTL_ADDRESS_WIDTH   (1),
		.SUB_WINDOW_COUNT     (1),
		.MASTER_ADDRESS_DEF   (64'b0000000000000000000000000000000000100000000000000000000000000000)
	) address_span_extender_0 (
		.clk                  (clk_clk),                                                                //           clock.clk
		.reset                (rst_controller_reset_out_reset),                                         //           reset.reset
		.avs_s0_address       (mm_interconnect_0_address_span_extender_0_windowed_slave_address),       //  windowed_slave.address
		.avs_s0_read          (mm_interconnect_0_address_span_extender_0_windowed_slave_read),          //                .read
		.avs_s0_readdata      (mm_interconnect_0_address_span_extender_0_windowed_slave_readdata),      //                .readdata
		.avs_s0_write         (mm_interconnect_0_address_span_extender_0_windowed_slave_write),         //                .write
		.avs_s0_writedata     (mm_interconnect_0_address_span_extender_0_windowed_slave_writedata),     //                .writedata
		.avs_s0_readdatavalid (mm_interconnect_0_address_span_extender_0_windowed_slave_readdatavalid), //                .readdatavalid
		.avs_s0_waitrequest   (mm_interconnect_0_address_span_extender_0_windowed_slave_waitrequest),   //                .waitrequest
		.avs_s0_byteenable    (mm_interconnect_0_address_span_extender_0_windowed_slave_byteenable),    //                .byteenable
		.avs_s0_burstcount    (mm_interconnect_0_address_span_extender_0_windowed_slave_burstcount),    //                .burstcount
		.avm_m0_address       (address_span_extender_0_expanded_master_address),                        // expanded_master.address
		.avm_m0_read          (address_span_extender_0_expanded_master_read),                           //                .read
		.avm_m0_waitrequest   (address_span_extender_0_expanded_master_waitrequest),                    //                .waitrequest
		.avm_m0_readdata      (address_span_extender_0_expanded_master_readdata),                       //                .readdata
		.avm_m0_write         (address_span_extender_0_expanded_master_write),                          //                .write
		.avm_m0_writedata     (address_span_extender_0_expanded_master_writedata),                      //                .writedata
		.avm_m0_readdatavalid (address_span_extender_0_expanded_master_readdatavalid),                  //                .readdatavalid
		.avm_m0_byteenable    (address_span_extender_0_expanded_master_byteenable),                     //                .byteenable
		.avm_m0_burstcount    (address_span_extender_0_expanded_master_burstcount),                     //                .burstcount
		.avs_cntl_address     (1'b0),                                                                   //     (terminated)
		.avs_cntl_read        (1'b0),                                                                   //     (terminated)
		.avs_cntl_readdata    (),                                                                       //     (terminated)
		.avs_cntl_write       (1'b0),                                                                   //     (terminated)
		.avs_cntl_writedata   (64'b0000000000000000000000000000000000000000000000000000000000000000),   //     (terminated)
		.avs_cntl_byteenable  (8'b00000000)                                                             //     (terminated)
	);

	soc_system_bridge_0 bridge_0 (
		.clk                (clk_clk),                            //                clk.clk
		.reset              (rst_controller_reset_out_reset),     //              reset.reset
		.avalon_readdata    (bridge_0_avalon_master_readdata),    //      avalon_master.readdata
		.avalon_waitrequest (bridge_0_avalon_master_waitrequest), //                   .waitrequest
		.avalon_byteenable  (bridge_0_avalon_master_byteenable),  //                   .byteenable
		.avalon_read        (bridge_0_avalon_master_read),        //                   .read
		.avalon_write       (bridge_0_avalon_master_write),       //                   .write
		.avalon_writedata   (bridge_0_avalon_master_writedata),   //                   .writedata
		.avalon_address     (bridge_0_avalon_master_address),     //                   .address
		.address            (sdram_address),                      // external_interface.export
		.byte_enable        (sdram_byte_enable),                  //                   .export
		.read               (sdram_read),                         //                   .export
		.write              (sdram_write),                        //                   .export
		.write_data         (sdram_write_data),                   //                   .export
		.acknowledge        (sdram_acknowledge),                  //                   .export
		.read_data          (sdram_read_data)                     //                   .export
	);

	soc_system_hps_0 #(
		.F2S_Width (0),
		.S2F_Width (0)
	) hps_0 (
		.mem_a                    (memory_mem_a),                                          //           memory.mem_a
		.mem_ba                   (memory_mem_ba),                                         //                 .mem_ba
		.mem_ck                   (memory_mem_ck),                                         //                 .mem_ck
		.mem_ck_n                 (memory_mem_ck_n),                                       //                 .mem_ck_n
		.mem_cke                  (memory_mem_cke),                                        //                 .mem_cke
		.mem_cs_n                 (memory_mem_cs_n),                                       //                 .mem_cs_n
		.mem_ras_n                (memory_mem_ras_n),                                      //                 .mem_ras_n
		.mem_cas_n                (memory_mem_cas_n),                                      //                 .mem_cas_n
		.mem_we_n                 (memory_mem_we_n),                                       //                 .mem_we_n
		.mem_reset_n              (memory_mem_reset_n),                                    //                 .mem_reset_n
		.mem_dq                   (memory_mem_dq),                                         //                 .mem_dq
		.mem_dqs                  (memory_mem_dqs),                                        //                 .mem_dqs
		.mem_dqs_n                (memory_mem_dqs_n),                                      //                 .mem_dqs_n
		.mem_odt                  (memory_mem_odt),                                        //                 .mem_odt
		.mem_dm                   (memory_mem_dm),                                         //                 .mem_dm
		.oct_rzqin                (memory_oct_rzqin),                                      //                 .oct_rzqin
		.h2f_rst_n                (hps_0_h2f_reset_reset_n),                               //        h2f_reset.reset_n
		.f2h_sdram0_clk           (clk_clk),                                               // f2h_sdram0_clock.clk
		.f2h_sdram0_ADDRESS       (mm_interconnect_1_hps_0_f2h_sdram0_data_address),       //  f2h_sdram0_data.address
		.f2h_sdram0_BURSTCOUNT    (mm_interconnect_1_hps_0_f2h_sdram0_data_burstcount),    //                 .burstcount
		.f2h_sdram0_WAITREQUEST   (mm_interconnect_1_hps_0_f2h_sdram0_data_waitrequest),   //                 .waitrequest
		.f2h_sdram0_READDATA      (mm_interconnect_1_hps_0_f2h_sdram0_data_readdata),      //                 .readdata
		.f2h_sdram0_READDATAVALID (mm_interconnect_1_hps_0_f2h_sdram0_data_readdatavalid), //                 .readdatavalid
		.f2h_sdram0_READ          (mm_interconnect_1_hps_0_f2h_sdram0_data_read),          //                 .read
		.f2h_sdram0_WRITEDATA     (mm_interconnect_1_hps_0_f2h_sdram0_data_writedata),     //                 .writedata
		.f2h_sdram0_BYTEENABLE    (mm_interconnect_1_hps_0_f2h_sdram0_data_byteenable),    //                 .byteenable
		.f2h_sdram0_WRITE         (mm_interconnect_1_hps_0_f2h_sdram0_data_write)          //                 .write
	);

	soc_system_rs232_0 rs232_0 (
		.clk             (clk_clk),                        //                        clk.clk
		.reset           (rst_controller_reset_out_reset), //                      reset.reset
		.from_uart_ready (uart_out_ready),                 // avalon_data_receive_source.ready
		.from_uart_data  (uart_out_data),                  //                           .data
		.from_uart_error (uart_out_error),                 //                           .error
		.from_uart_valid (uart_out_valid),                 //                           .valid
		.to_uart_data    (uart_in_data),                   //  avalon_data_transmit_sink.data
		.to_uart_error   (uart_in_error),                  //                           .error
		.to_uart_valid   (uart_in_valid),                  //                           .valid
		.to_uart_ready   (uart_in_ready),                  //                           .ready
		.UART_RXD        (uart_RXD),                       //         external_interface.export
		.UART_TXD        (uart_TXD)                        //                           .export
	);

	soc_system_mm_interconnect_0 mm_interconnect_0 (
		.clk_0_clk_clk                                        (clk_clk),                                                                //                              clk_0_clk.clk
		.bridge_0_reset_reset_bridge_in_reset_reset           (rst_controller_reset_out_reset),                                         //   bridge_0_reset_reset_bridge_in_reset.reset
		.bridge_0_avalon_master_address                       (bridge_0_avalon_master_address),                                         //                 bridge_0_avalon_master.address
		.bridge_0_avalon_master_waitrequest                   (bridge_0_avalon_master_waitrequest),                                     //                                       .waitrequest
		.bridge_0_avalon_master_byteenable                    (bridge_0_avalon_master_byteenable),                                      //                                       .byteenable
		.bridge_0_avalon_master_read                          (bridge_0_avalon_master_read),                                            //                                       .read
		.bridge_0_avalon_master_readdata                      (bridge_0_avalon_master_readdata),                                        //                                       .readdata
		.bridge_0_avalon_master_write                         (bridge_0_avalon_master_write),                                           //                                       .write
		.bridge_0_avalon_master_writedata                     (bridge_0_avalon_master_writedata),                                       //                                       .writedata
		.address_span_extender_0_windowed_slave_address       (mm_interconnect_0_address_span_extender_0_windowed_slave_address),       // address_span_extender_0_windowed_slave.address
		.address_span_extender_0_windowed_slave_write         (mm_interconnect_0_address_span_extender_0_windowed_slave_write),         //                                       .write
		.address_span_extender_0_windowed_slave_read          (mm_interconnect_0_address_span_extender_0_windowed_slave_read),          //                                       .read
		.address_span_extender_0_windowed_slave_readdata      (mm_interconnect_0_address_span_extender_0_windowed_slave_readdata),      //                                       .readdata
		.address_span_extender_0_windowed_slave_writedata     (mm_interconnect_0_address_span_extender_0_windowed_slave_writedata),     //                                       .writedata
		.address_span_extender_0_windowed_slave_burstcount    (mm_interconnect_0_address_span_extender_0_windowed_slave_burstcount),    //                                       .burstcount
		.address_span_extender_0_windowed_slave_byteenable    (mm_interconnect_0_address_span_extender_0_windowed_slave_byteenable),    //                                       .byteenable
		.address_span_extender_0_windowed_slave_readdatavalid (mm_interconnect_0_address_span_extender_0_windowed_slave_readdatavalid), //                                       .readdatavalid
		.address_span_extender_0_windowed_slave_waitrequest   (mm_interconnect_0_address_span_extender_0_windowed_slave_waitrequest)    //                                       .waitrequest
	);

	soc_system_mm_interconnect_1 mm_interconnect_1 (
		.clk_0_clk_clk                                                      (clk_clk),                                               //                                                    clk_0_clk.clk
		.address_span_extender_0_reset_reset_bridge_in_reset_reset          (rst_controller_reset_out_reset),                        //          address_span_extender_0_reset_reset_bridge_in_reset.reset
		.hps_0_f2h_sdram0_data_translator_reset_reset_bridge_in_reset_reset (rst_controller_001_reset_out_reset),                    // hps_0_f2h_sdram0_data_translator_reset_reset_bridge_in_reset.reset
		.address_span_extender_0_expanded_master_address                    (address_span_extender_0_expanded_master_address),       //                      address_span_extender_0_expanded_master.address
		.address_span_extender_0_expanded_master_waitrequest                (address_span_extender_0_expanded_master_waitrequest),   //                                                             .waitrequest
		.address_span_extender_0_expanded_master_burstcount                 (address_span_extender_0_expanded_master_burstcount),    //                                                             .burstcount
		.address_span_extender_0_expanded_master_byteenable                 (address_span_extender_0_expanded_master_byteenable),    //                                                             .byteenable
		.address_span_extender_0_expanded_master_read                       (address_span_extender_0_expanded_master_read),          //                                                             .read
		.address_span_extender_0_expanded_master_readdata                   (address_span_extender_0_expanded_master_readdata),      //                                                             .readdata
		.address_span_extender_0_expanded_master_readdatavalid              (address_span_extender_0_expanded_master_readdatavalid), //                                                             .readdatavalid
		.address_span_extender_0_expanded_master_write                      (address_span_extender_0_expanded_master_write),         //                                                             .write
		.address_span_extender_0_expanded_master_writedata                  (address_span_extender_0_expanded_master_writedata),     //                                                             .writedata
		.hps_0_f2h_sdram0_data_address                                      (mm_interconnect_1_hps_0_f2h_sdram0_data_address),       //                                        hps_0_f2h_sdram0_data.address
		.hps_0_f2h_sdram0_data_write                                        (mm_interconnect_1_hps_0_f2h_sdram0_data_write),         //                                                             .write
		.hps_0_f2h_sdram0_data_read                                         (mm_interconnect_1_hps_0_f2h_sdram0_data_read),          //                                                             .read
		.hps_0_f2h_sdram0_data_readdata                                     (mm_interconnect_1_hps_0_f2h_sdram0_data_readdata),      //                                                             .readdata
		.hps_0_f2h_sdram0_data_writedata                                    (mm_interconnect_1_hps_0_f2h_sdram0_data_writedata),     //                                                             .writedata
		.hps_0_f2h_sdram0_data_burstcount                                   (mm_interconnect_1_hps_0_f2h_sdram0_data_burstcount),    //                                                             .burstcount
		.hps_0_f2h_sdram0_data_byteenable                                   (mm_interconnect_1_hps_0_f2h_sdram0_data_byteenable),    //                                                             .byteenable
		.hps_0_f2h_sdram0_data_readdatavalid                                (mm_interconnect_1_hps_0_f2h_sdram0_data_readdatavalid), //                                                             .readdatavalid
		.hps_0_f2h_sdram0_data_waitrequest                                  (mm_interconnect_1_hps_0_f2h_sdram0_data_waitrequest)    //                                                             .waitrequest
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller (
		.reset_in0      (~reset_reset_n),                 // reset_in0.reset
		.clk            (clk_clk),                        //       clk.clk
		.reset_out      (rst_controller_reset_out_reset), // reset_out.reset
		.reset_req      (),                               // (terminated)
		.reset_req_in0  (1'b0),                           // (terminated)
		.reset_in1      (1'b0),                           // (terminated)
		.reset_req_in1  (1'b0),                           // (terminated)
		.reset_in2      (1'b0),                           // (terminated)
		.reset_req_in2  (1'b0),                           // (terminated)
		.reset_in3      (1'b0),                           // (terminated)
		.reset_req_in3  (1'b0),                           // (terminated)
		.reset_in4      (1'b0),                           // (terminated)
		.reset_req_in4  (1'b0),                           // (terminated)
		.reset_in5      (1'b0),                           // (terminated)
		.reset_req_in5  (1'b0),                           // (terminated)
		.reset_in6      (1'b0),                           // (terminated)
		.reset_req_in6  (1'b0),                           // (terminated)
		.reset_in7      (1'b0),                           // (terminated)
		.reset_req_in7  (1'b0),                           // (terminated)
		.reset_in8      (1'b0),                           // (terminated)
		.reset_req_in8  (1'b0),                           // (terminated)
		.reset_in9      (1'b0),                           // (terminated)
		.reset_req_in9  (1'b0),                           // (terminated)
		.reset_in10     (1'b0),                           // (terminated)
		.reset_req_in10 (1'b0),                           // (terminated)
		.reset_in11     (1'b0),                           // (terminated)
		.reset_req_in11 (1'b0),                           // (terminated)
		.reset_in12     (1'b0),                           // (terminated)
		.reset_req_in12 (1'b0),                           // (terminated)
		.reset_in13     (1'b0),                           // (terminated)
		.reset_req_in13 (1'b0),                           // (terminated)
		.reset_in14     (1'b0),                           // (terminated)
		.reset_req_in14 (1'b0),                           // (terminated)
		.reset_in15     (1'b0),                           // (terminated)
		.reset_req_in15 (1'b0)                            // (terminated)
	);

	altera_reset_controller #(
		.NUM_RESET_INPUTS          (1),
		.OUTPUT_RESET_SYNC_EDGES   ("deassert"),
		.SYNC_DEPTH                (2),
		.RESET_REQUEST_PRESENT     (0),
		.RESET_REQ_WAIT_TIME       (1),
		.MIN_RST_ASSERTION_TIME    (3),
		.RESET_REQ_EARLY_DSRT_TIME (1),
		.USE_RESET_REQUEST_IN0     (0),
		.USE_RESET_REQUEST_IN1     (0),
		.USE_RESET_REQUEST_IN2     (0),
		.USE_RESET_REQUEST_IN3     (0),
		.USE_RESET_REQUEST_IN4     (0),
		.USE_RESET_REQUEST_IN5     (0),
		.USE_RESET_REQUEST_IN6     (0),
		.USE_RESET_REQUEST_IN7     (0),
		.USE_RESET_REQUEST_IN8     (0),
		.USE_RESET_REQUEST_IN9     (0),
		.USE_RESET_REQUEST_IN10    (0),
		.USE_RESET_REQUEST_IN11    (0),
		.USE_RESET_REQUEST_IN12    (0),
		.USE_RESET_REQUEST_IN13    (0),
		.USE_RESET_REQUEST_IN14    (0),
		.USE_RESET_REQUEST_IN15    (0),
		.ADAPT_RESET_REQUEST       (0)
	) rst_controller_001 (
		.reset_in0      (~hps_0_h2f_reset_reset_n),           // reset_in0.reset
		.clk            (clk_clk),                            //       clk.clk
		.reset_out      (rst_controller_001_reset_out_reset), // reset_out.reset
		.reset_req      (),                                   // (terminated)
		.reset_req_in0  (1'b0),                               // (terminated)
		.reset_in1      (1'b0),                               // (terminated)
		.reset_req_in1  (1'b0),                               // (terminated)
		.reset_in2      (1'b0),                               // (terminated)
		.reset_req_in2  (1'b0),                               // (terminated)
		.reset_in3      (1'b0),                               // (terminated)
		.reset_req_in3  (1'b0),                               // (terminated)
		.reset_in4      (1'b0),                               // (terminated)
		.reset_req_in4  (1'b0),                               // (terminated)
		.reset_in5      (1'b0),                               // (terminated)
		.reset_req_in5  (1'b0),                               // (terminated)
		.reset_in6      (1'b0),                               // (terminated)
		.reset_req_in6  (1'b0),                               // (terminated)
		.reset_in7      (1'b0),                               // (terminated)
		.reset_req_in7  (1'b0),                               // (terminated)
		.reset_in8      (1'b0),                               // (terminated)
		.reset_req_in8  (1'b0),                               // (terminated)
		.reset_in9      (1'b0),                               // (terminated)
		.reset_req_in9  (1'b0),                               // (terminated)
		.reset_in10     (1'b0),                               // (terminated)
		.reset_req_in10 (1'b0),                               // (terminated)
		.reset_in11     (1'b0),                               // (terminated)
		.reset_req_in11 (1'b0),                               // (terminated)
		.reset_in12     (1'b0),                               // (terminated)
		.reset_req_in12 (1'b0),                               // (terminated)
		.reset_in13     (1'b0),                               // (terminated)
		.reset_req_in13 (1'b0),                               // (terminated)
		.reset_in14     (1'b0),                               // (terminated)
		.reset_req_in14 (1'b0),                               // (terminated)
		.reset_in15     (1'b0),                               // (terminated)
		.reset_req_in15 (1'b0)                                // (terminated)
	);

endmodule
