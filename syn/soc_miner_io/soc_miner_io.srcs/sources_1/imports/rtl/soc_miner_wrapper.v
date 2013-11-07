/**
 * @file   soc_miner_wrapper.v
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   110413
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

//synthesis translate_off
`default_nettype none
//synthesis translate_on


module soc_miner_wrapper #(
    parameter MEMORY_DATA_WIDTH=64, 
              MEMORY_ADDR_WIDTH=32, 
              MEMORY_BUS_LEN_WIDTH=4, 
              MEMORY_ID_WIDTH=6, 
              REGS_DATA_WIDTH=32, 
              REGS_ADDR_WIDTH=32
)(

inout  wire [14:0]DDR_addr,  
inout  wire [2:0] DDR_ba,          
inout  wire       DDR_cas_n,           
inout  wire       DDR_ck_n,              
inout  wire       DDR_ck_p,              
inout  wire       DDR_cke,               
inout  wire       DDR_cs_n,              
inout  wire [3:0] DDR_dm,                
inout  wire [31:0]DDR_dq,                
inout  wire [3:0] DDR_dqs_n,             
inout  wire [3:0] DDR_dqs_p,             
inout  wire       DDR_odt,               
inout  wire       DDR_ras_n,             
inout  wire       DDR_reset_n,           
inout  wire       DDR_we_n,              
inout  wire       FIXED_IO_ddr_vrn,      
inout  wire       FIXED_IO_ddr_vrp,      
inout  wire [53:0]FIXED_IO_mio,          
inout  wire       FIXED_IO_ps_clk,       
inout  wire       FIXED_IO_ps_porb,      
inout  wire       FIXED_IO_ps_srstb     
);
  
  

wire [0:0] ACLK;
wire FCLK_RESET0_N;
wire [31:0] M00_AXI_ARADDR;
wire [1:0] M00_AXI_ARBURST;
wire [3:0] M00_AXI_ARCACHE;
wire [11:0] M00_AXI_ARID;
wire [3:0] M00_AXI_ARLEN;
wire [1:0] M00_AXI_ARLOCK;
wire [2:0] M00_AXI_ARPROT;
wire [3:0] M00_AXI_ARQOS;
wire [0:0] M00_AXI_ARREADY;
wire [2:0] M00_AXI_ARSIZE;
wire [0:0] M00_AXI_ARVALID;
wire [31:0] M00_AXI_AWADDR;
wire [1:0] M00_AXI_AWBURST;
wire [3:0] M00_AXI_AWCACHE;
wire [11:0] M00_AXI_AWID;
wire [3:0] M00_AXI_AWLEN;
wire [1:0] M00_AXI_AWLOCK;
wire [2:0] M00_AXI_AWPROT;
wire [3:0] M00_AXI_AWQOS;
wire [0:0] M00_AXI_AWREADY;
wire [2:0] M00_AXI_AWSIZE;
wire [0:0] M00_AXI_AWVALID;
wire [11:0] M00_AXI_BID;
wire [0:0] M00_AXI_BREADY;
wire [1:0] M00_AXI_BRESP;
wire [0:0] M00_AXI_BVALID;
wire [31:0] M00_AXI_RDATA;
wire [11:0] M00_AXI_RID;
wire [0:0] M00_AXI_RLAST;
wire [0:0] M00_AXI_RREADY;
wire [1:0] M00_AXI_RRESP;
wire [0:0] M00_AXI_RVALID;
wire [31:0] M00_AXI_WDATA;
wire [11:0] M00_AXI_WID;
wire [0:0] M00_AXI_WLAST;
wire [0:0] M00_AXI_WREADY;
wire [3:0] M00_AXI_WSTRB;
wire [0:0] M00_AXI_WVALID;
(* mark_debug = "true" *) wire [31:0] S00_AXI_ARADDR;
(* mark_debug = "true" *) wire [1:0] S00_AXI_ARBURST;
(* mark_debug = "true" *) wire [3:0] S00_AXI_ARCACHE;
(* mark_debug = "true" *) wire [5:0] S00_AXI_ARID;
(* mark_debug = "true" *) wire [3:0] S00_AXI_ARLEN;
(* mark_debug = "true" *) wire [1:0] S00_AXI_ARLOCK;
(* mark_debug = "true" *) wire [2:0] S00_AXI_ARPROT;
(* mark_debug = "true" *) wire [3:0] S00_AXI_ARQOS;
(* mark_debug = "true" *) wire [0:0] S00_AXI_ARREADY;
(* mark_debug = "true" *) wire [2:0] S00_AXI_ARSIZE;
(* mark_debug = "true" *) wire [0:0] S00_AXI_ARVALID;
(* mark_debug = "true" *) wire [31:0] S00_AXI_AWADDR;
(* mark_debug = "true" *) wire [1:0] S00_AXI_AWBURST;
(* mark_debug = "true" *) wire [3:0] S00_AXI_AWCACHE;
(* mark_debug = "true" *) wire [5:0] S00_AXI_AWID;
(* mark_debug = "true" *) wire [3:0] S00_AXI_AWLEN;
(* mark_debug = "true" *) wire [1:0] S00_AXI_AWLOCK;
(* mark_debug = "true" *) wire [2:0] S00_AXI_AWPROT;
(* mark_debug = "true" *) wire [3:0] S00_AXI_AWQOS;
(* mark_debug = "true" *) wire [0:0] S00_AXI_AWREADY;
(* mark_debug = "true" *) wire [2:0] S00_AXI_AWSIZE;
(* mark_debug = "true" *) wire [0:0] S00_AXI_AWVALID;
(* mark_debug = "true" *) wire [5:0] S00_AXI_BID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_BREADY;
(* mark_debug = "true" *) wire [1:0] S00_AXI_BRESP;
(* mark_debug = "true" *) wire [0:0] S00_AXI_BVALID;
(* mark_debug = "true" *) wire [63:0] S00_AXI_RDATA;
(* mark_debug = "true" *) wire [5:0] S00_AXI_RID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RLAST;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RREADY;
(* mark_debug = "true" *) wire [1:0] S00_AXI_RRESP;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RVALID;
(* mark_debug = "true" *) wire [63:0] S00_AXI_WDATA;
(* mark_debug = "true" *) wire [5:0] S00_AXI_WID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WLAST;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WREADY;
(* mark_debug = "true" *) wire [7:0] S00_AXI_WSTRB;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WVALID;

soc_miner_io_wrapper I_SOC_MINER_IO_WRAPPER(
    .ACLK(ACLK),
    .FCLK_RESET0_N(FCLK_RESET0_N),    
    .DDR_addr          (DDR_addr         ),
    .DDR_ba            (DDR_ba           ),
    .DDR_cas_n         (DDR_cas_n        ),
    .DDR_ck_n          (DDR_ck_n         ),
    .DDR_ck_p          (DDR_ck_p         ),
    .DDR_cke           (DDR_cke          ),
    .DDR_cs_n          (DDR_cs_n         ),
    .DDR_dm            (DDR_dm           ),
    .DDR_dq            (DDR_dq           ),
    .DDR_dqs_n         (DDR_dqs_n        ),
    .DDR_dqs_p         (DDR_dqs_p        ),
    .DDR_odt           (DDR_odt          ),
    .DDR_ras_n         (DDR_ras_n        ),
    .DDR_reset_n       (DDR_reset_n      ),
    .DDR_we_n          (DDR_we_n         ),
    .FIXED_IO_ddr_vrn  (FIXED_IO_ddr_vrn ),
    .FIXED_IO_ddr_vrp  (FIXED_IO_ddr_vrp ),
    .FIXED_IO_mio      (FIXED_IO_mio     ),
    .FIXED_IO_ps_clk   (FIXED_IO_ps_clk  ),
    .FIXED_IO_ps_porb  (FIXED_IO_ps_porb ),
    .FIXED_IO_ps_srstb (FIXED_IO_ps_srstb),
    .M00_AXI_araddr(M00_AXI_ARADDR),
    .M00_AXI_arburst(M00_AXI_ARBURST),
    .M00_AXI_arcache(M00_AXI_ARCACHE),
    .M00_AXI_arid(M00_AXI_ARID),
    .M00_AXI_arlen(M00_AXI_ARLEN),
    .M00_AXI_arlock(M00_AXI_ARLOCK),
    .M00_AXI_arprot(M00_AXI_ARPROT),
    .M00_AXI_arqos(M00_AXI_ARQOS),
    .M00_AXI_arready(M00_AXI_ARREADY),
    .M00_AXI_arsize(M00_AXI_ARSIZE),
    .M00_AXI_arvalid(M00_AXI_ARVALID),
    .M00_AXI_awaddr(M00_AXI_AWADDR),
    .M00_AXI_awburst(M00_AXI_AWBURST),
    .M00_AXI_awcache(M00_AXI_AWCACHE),
    .M00_AXI_awid(M00_AXI_AWID),
    .M00_AXI_awlen(M00_AXI_AWLEN),
    .M00_AXI_awlock(M00_AXI_AWLOCK),
    .M00_AXI_awprot(M00_AXI_AWPROT),
    .M00_AXI_awqos(M00_AXI_AWQOS),
    .M00_AXI_awready(M00_AXI_AWREADY),
    .M00_AXI_awsize(M00_AXI_AWSIZE),
    .M00_AXI_awvalid(M00_AXI_AWVALID),
    .M00_AXI_bid(M00_AXI_BID),
    .M00_AXI_bready(M00_AXI_BREADY),
    .M00_AXI_bresp(M00_AXI_BRESP),
    .M00_AXI_bvalid(M00_AXI_BVALID),
    .M00_AXI_rdata(M00_AXI_RDATA),
    .M00_AXI_rid(M00_AXI_RID),
    .M00_AXI_rlast(M00_AXI_RLAST),
    .M00_AXI_rready(M00_AXI_RREADY),
    .M00_AXI_rresp(M00_AXI_RRESP),
    .M00_AXI_rvalid(M00_AXI_RVALID),
    .M00_AXI_wdata(M00_AXI_WDATA),
    .M00_AXI_wid(M00_AXI_WID),
    .M00_AXI_wlast(M00_AXI_WLAST),
    .M00_AXI_wready(M00_AXI_WREADY),
    .M00_AXI_wstrb(M00_AXI_WSTRB),
    .M00_AXI_wvalid(M00_AXI_WVALID),
    .S00_AXI_araddr(S00_AXI_ARADDR),
    .S00_AXI_arburst(S00_AXI_ARBURST),
    .S00_AXI_arcache(S00_AXI_ARCACHE),
    .S00_AXI_arid(S00_AXI_ARID),
    .S00_AXI_arlen(S00_AXI_ARLEN),
    .S00_AXI_arlock(S00_AXI_ARLOCK),
    .S00_AXI_arprot(S00_AXI_ARPROT),
    .S00_AXI_arqos(S00_AXI_ARQOS),
    .S00_AXI_arready(S00_AXI_ARREADY),
    .S00_AXI_arsize(S00_AXI_ARSIZE),
    .S00_AXI_arvalid(S00_AXI_ARVALID),
    .S00_AXI_awaddr(S00_AXI_AWADDR),
    .S00_AXI_awburst(S00_AXI_AWBURST),
    .S00_AXI_awcache(S00_AXI_AWCACHE),
    .S00_AXI_awid(S00_AXI_AWID),
    .S00_AXI_awlen(S00_AXI_AWLEN),
    .S00_AXI_awlock(S00_AXI_AWLOCK),
    .S00_AXI_awprot(S00_AXI_AWPROT),
    .S00_AXI_awqos(S00_AXI_AWQOS),
    .S00_AXI_awready(S00_AXI_AWREADY),
    .S00_AXI_awsize(S00_AXI_AWSIZE),
    .S00_AXI_awvalid(S00_AXI_AWVALID),
    .S00_AXI_bid(S00_AXI_BID),
    .S00_AXI_bready(S00_AXI_BREADY),
    .S00_AXI_bresp(S00_AXI_BRESP),
    .S00_AXI_bvalid(S00_AXI_BVALID),
    .S00_AXI_rdata(S00_AXI_RDATA),
    .S00_AXI_rid(S00_AXI_RID),
    .S00_AXI_rlast(S00_AXI_RLAST),
    .S00_AXI_rready(S00_AXI_RREADY),
    .S00_AXI_rresp(S00_AXI_RRESP),
    .S00_AXI_rvalid(S00_AXI_RVALID),
    .S00_AXI_wdata(S00_AXI_WDATA),
    .S00_AXI_wid(S00_AXI_WID),
    .S00_AXI_wlast(S00_AXI_WLAST),
    .S00_AXI_wready(S00_AXI_WREADY),
    .S00_AXI_wstrb(S00_AXI_WSTRB),
    .S00_AXI_wvalid(S00_AXI_WVALID)
);



soc_miner #(.MEMORY_DATA_WIDTH(MEMORY_DATA_WIDTH),
            .MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), 
            .MEMORY_BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH), 
            .MEMORY_ID_WIDTH(MEMORY_ID_WIDTH),
            .REGS_DATA_WIDTH(REGS_DATA_WIDTH),
            .REGS_ADDR_WIDTH(REGS_ADDR_WIDTH)) 
    I_SOC_MINER(

    .Clk(ACLK), 
    .Rst_n(FCLK_RESET0_N), 
    .m_memory_awvalid(S00_AXI_AWVALID),
    .m_memory_awready(S00_AXI_AWREADY),
    .m_memory_awaddr(S00_AXI_AWADDR),
    .m_memory_awlen(S00_AXI_AWLEN),
    .m_memory_awid(S00_AXI_AWID),
    .m_memory_awsize(S00_AXI_AWSIZE),
    .m_memory_awburst(S00_AXI_AWBURST),
    .m_memory_awlock(S00_AXI_AWLOCK),
    .m_memory_awcache(S00_AXI_AWCACHE),
    .m_memory_awprot(S00_AXI_AWPROT),
    .m_memory_awqos(S00_AXI_AWQOS),
    .m_memory_wvalid(S00_AXI_WVALID),
    .m_memory_wready(S00_AXI_WREADY),
    .m_memory_wdata(S00_AXI_WDATA),
    .m_memory_wstrb(S00_AXI_WSTRB),
    .m_memory_wlast(S00_AXI_WLAST),
    .m_memory_wid(S00_AXI_WID),
    .m_memory_bvalid(S00_AXI_BVALID),
    .m_memory_bready(S00_AXI_BREADY),
    .m_memory_bresp(S00_AXI_BRESP),
    .m_memory_bid(S00_AXI_BID),
    .m_memory_arvalid(S00_AXI_ARVALID),
    .m_memory_arready(S00_AXI_ARREADY),
    .m_memory_araddr(S00_AXI_ARADDR),
    .m_memory_arlen(S00_AXI_ARLEN),
    .m_memory_arid(S00_AXI_ARID),
    .m_memory_arsize(S00_AXI_ARSIZE),
    .m_memory_arburst(S00_AXI_ARBURST),
    .m_memory_arlock(S00_AXI_ARLOCK),
    .m_memory_arcache(S00_AXI_ARCACHE),
    .m_memory_arprot(S00_AXI_ARPROT),
    .m_memory_arqos(S00_AXI_ARQOS),
    .m_memory_rvalid(S00_AXI_RVALID),
    .m_memory_rready(S00_AXI_RREADY),
    .m_memory_rdata(S00_AXI_RDATA),
    .m_memory_rlast(S00_AXI_RLAST),
    .m_memory_rresp(S00_AXI_RRESP),
    .m_memory_rid(S00_AXI_RID),
    .s_regs_awvalid(M00_AXI_AWVALID),
    .s_regs_awready(M00_AXI_AWREADY),
    .s_regs_awaddr(M00_AXI_AWADDR),
    .s_regs_awprot(M00_AXI_AWPROT),
    .s_regs_wvalid(M00_AXI_WVALID),
    .s_regs_wready(M00_AXI_WREADY),
    .s_regs_wdata(M00_AXI_WDATA),
    .s_regs_wstrb(M00_AXI_WSTRB),
    .s_regs_bvalid(M00_AXI_BVALID),
    .s_regs_bready(M00_AXI_BREADY),
    .s_regs_bresp(M00_AXI_BRESP),
    .s_regs_arvalid(M00_AXI_ARVALID),
    .s_regs_arready(M00_AXI_ARREADY),
    .s_regs_araddr(M00_AXI_ARADDR),
    .s_regs_arprot(M00_AXI_ARPROT),
    .s_regs_rvalid(M00_AXI_RVALID),
    .s_regs_rready(M00_AXI_RREADY),
    .s_regs_rdata(M00_AXI_RDATA),
    .s_regs_rresp(M00_AXI_RRESP)

);

endmodule

`default_nettype wire
