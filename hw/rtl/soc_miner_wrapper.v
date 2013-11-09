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
(* mark_debug = "true" *) wire [31:0] M00_AXI_ARADDR;
(* mark_debug = "true" *) wire [1:0] M00_AXI_ARBURST;
(* mark_debug = "true" *) wire [3:0] M00_AXI_ARCACHE;
(* mark_debug = "true" *) wire [11:0] M00_AXI_ARID;
(* mark_debug = "true" *) wire [3:0] M00_AXI_ARLEN;
(* mark_debug = "true" *) wire [1:0] M00_AXI_ARLOCK;
(* mark_debug = "true" *) wire [2:0] M00_AXI_ARPROT;
(* mark_debug = "true" *) wire [3:0] M00_AXI_ARQOS;
(* mark_debug = "true" *) wire [0:0] M00_AXI_ARREADY;
(* mark_debug = "true" *) wire [2:0] M00_AXI_ARSIZE;
(* mark_debug = "true" *) wire [0:0] M00_AXI_ARVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_AWADDR;
(* mark_debug = "true" *) wire [1:0] M00_AXI_AWBURST;
(* mark_debug = "true" *) wire [3:0] M00_AXI_AWCACHE;
(* mark_debug = "true" *) wire [11:0] M00_AXI_AWID;
(* mark_debug = "true" *) wire [3:0] M00_AXI_AWLEN;
(* mark_debug = "true" *) wire [1:0] M00_AXI_AWLOCK;
(* mark_debug = "true" *) wire [2:0] M00_AXI_AWPROT;
(* mark_debug = "true" *) wire [3:0] M00_AXI_AWQOS;
(* mark_debug = "true" *) wire [0:0] M00_AXI_AWREADY;
(* mark_debug = "true" *) wire [2:0] M00_AXI_AWSIZE;
(* mark_debug = "true" *) wire [0:0] M00_AXI_AWVALID;
(* mark_debug = "true" *) wire [11:0] M00_AXI_BID;
assign M00_AXI_BID = M00_AXI_AWID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_BREADY;
(* mark_debug = "true" *) wire [1:0] M00_AXI_BRESP;
(* mark_debug = "true" *) wire [0:0] M00_AXI_BVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_RDATA;
(* mark_debug = "true" *) wire [11:0] M00_AXI_RID;
assign M00_AXI_RID = M00_AXI_ARID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RLAST;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RREADY;
(* mark_debug = "true" *) wire [1:0] M00_AXI_RRESP;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_WDATA;
(* mark_debug = "true" *) wire [11:0] M00_AXI_WID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WLAST;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WREADY;
(* mark_debug = "true" *) wire [3:0] M00_AXI_WSTRB;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WVALID;
wire [31:0] S00_AXI_ARADDR;
wire [1:0] S00_AXI_ARBURST;
wire [3:0] S00_AXI_ARCACHE;
wire [5:0] S00_AXI_ARID;
wire [3:0] S00_AXI_ARLEN;
wire [1:0] S00_AXI_ARLOCK;
wire [2:0] S00_AXI_ARPROT;
wire [3:0] S00_AXI_ARQOS;
wire [0:0] S00_AXI_ARREADY;
wire [2:0] S00_AXI_ARSIZE;
wire [0:0] S00_AXI_ARVALID;
wire [31:0] S00_AXI_AWADDR;
wire [1:0] S00_AXI_AWBURST;
wire [3:0] S00_AXI_AWCACHE;
wire [5:0] S00_AXI_AWID;
wire [3:0] S00_AXI_AWLEN;
wire [1:0] S00_AXI_AWLOCK;
wire [2:0] S00_AXI_AWPROT;
wire [3:0] S00_AXI_AWQOS;
wire [0:0] S00_AXI_AWREADY;
wire [2:0] S00_AXI_AWSIZE;
wire [0:0] S00_AXI_AWVALID;
wire [5:0] S00_AXI_BID;
wire [0:0] S00_AXI_BREADY;
wire [1:0] S00_AXI_BRESP;
wire [0:0] S00_AXI_BVALID;
wire [63:0] S00_AXI_RDATA;
wire [5:0] S00_AXI_RID;
wire [0:0] S00_AXI_RLAST;
wire [0:0] S00_AXI_RREADY;
wire [1:0] S00_AXI_RRESP;
wire [0:0] S00_AXI_RVALID;
wire [63:0] S00_AXI_WDATA;
wire [5:0] S00_AXI_WID;
wire [0:0] S00_AXI_WLAST;
wire [0:0] S00_AXI_WREADY;
wire [7:0] S00_AXI_WSTRB;
wire [0:0] S00_AXI_WVALID;

design_1_wrapper I_SOC_MINER_IO_WRAPPER(
    .FCLK_CLK0(ACLK),
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
    .M_AXI_GP0_araddr(M00_AXI_ARADDR),
    .M_AXI_GP0_arburst(M00_AXI_ARBURST),
    .M_AXI_GP0_arcache(M00_AXI_ARCACHE),
    .M_AXI_GP0_arid(M00_AXI_ARID),
    .M_AXI_GP0_arlen(M00_AXI_ARLEN),
    .M_AXI_GP0_arlock(M00_AXI_ARLOCK),
    .M_AXI_GP0_arprot(M00_AXI_ARPROT),
    .M_AXI_GP0_arqos(M00_AXI_ARQOS),
    .M_AXI_GP0_arready(M00_AXI_ARREADY),
    .M_AXI_GP0_arsize(M00_AXI_ARSIZE),
    .M_AXI_GP0_arvalid(M00_AXI_ARVALID),
    .M_AXI_GP0_awaddr(M00_AXI_AWADDR),
    .M_AXI_GP0_awburst(M00_AXI_AWBURST),
    .M_AXI_GP0_awcache(M00_AXI_AWCACHE),
    .M_AXI_GP0_awid(M00_AXI_AWID),
    .M_AXI_GP0_awlen(M00_AXI_AWLEN),
    .M_AXI_GP0_awlock(M00_AXI_AWLOCK),
    .M_AXI_GP0_awprot(M00_AXI_AWPROT),
    .M_AXI_GP0_awqos(M00_AXI_AWQOS),
    .M_AXI_GP0_awready(M00_AXI_AWREADY),
    .M_AXI_GP0_awsize(M00_AXI_AWSIZE),
    .M_AXI_GP0_awvalid(M00_AXI_AWVALID),
    .M_AXI_GP0_bid(M00_AXI_BID),
    .M_AXI_GP0_bready(M00_AXI_BREADY),
    .M_AXI_GP0_bresp(M00_AXI_BRESP),
    .M_AXI_GP0_bvalid(M00_AXI_BVALID),
    .M_AXI_GP0_rdata(M00_AXI_RDATA),
    .M_AXI_GP0_rid(M00_AXI_RID),
    .M_AXI_GP0_rlast(M00_AXI_RLAST),
    .M_AXI_GP0_rready(M00_AXI_RREADY),
    .M_AXI_GP0_rresp(M00_AXI_RRESP),
    .M_AXI_GP0_rvalid(M00_AXI_RVALID),
    .M_AXI_GP0_wdata(M00_AXI_WDATA),
    .M_AXI_GP0_wid(M00_AXI_WID),
    .M_AXI_GP0_wlast(M00_AXI_WLAST),
    .M_AXI_GP0_wready(M00_AXI_WREADY),
    .M_AXI_GP0_wstrb(M00_AXI_WSTRB),
    .M_AXI_GP0_wvalid(M00_AXI_WVALID),
    .S_AXI_HP0_araddr(S00_AXI_ARADDR),
    .S_AXI_HP0_arburst(S00_AXI_ARBURST),
    .S_AXI_HP0_arcache(S00_AXI_ARCACHE),
    .S_AXI_HP0_arid(S00_AXI_ARID),
    .S_AXI_HP0_arlen(S00_AXI_ARLEN),
    .S_AXI_HP0_arlock(S00_AXI_ARLOCK),
    .S_AXI_HP0_arprot(S00_AXI_ARPROT),
    .S_AXI_HP0_arqos(S00_AXI_ARQOS),
    .S_AXI_HP0_arready(S00_AXI_ARREADY),
    .S_AXI_HP0_arsize(S00_AXI_ARSIZE),
    .S_AXI_HP0_arvalid(S00_AXI_ARVALID),
    .S_AXI_HP0_awaddr(S00_AXI_AWADDR),
    .S_AXI_HP0_awburst(S00_AXI_AWBURST),
    .S_AXI_HP0_awcache(S00_AXI_AWCACHE),
    .S_AXI_HP0_awid(S00_AXI_AWID),
    .S_AXI_HP0_awlen(S00_AXI_AWLEN),
    .S_AXI_HP0_awlock(S00_AXI_AWLOCK),
    .S_AXI_HP0_awprot(S00_AXI_AWPROT),
    .S_AXI_HP0_awqos(S00_AXI_AWQOS),
    .S_AXI_HP0_awready(S00_AXI_AWREADY),
    .S_AXI_HP0_awsize(S00_AXI_AWSIZE),
    .S_AXI_HP0_awvalid(S00_AXI_AWVALID),
    .S_AXI_HP0_bid(S00_AXI_BID),
    .S_AXI_HP0_bready(S00_AXI_BREADY),
    .S_AXI_HP0_bresp(S00_AXI_BRESP),
    .S_AXI_HP0_bvalid(S00_AXI_BVALID),
    .S_AXI_HP0_rdata(S00_AXI_RDATA),
    .S_AXI_HP0_rid(S00_AXI_RID),
    .S_AXI_HP0_rlast(S00_AXI_RLAST),
    .S_AXI_HP0_rready(S00_AXI_RREADY),
    .S_AXI_HP0_rresp(S00_AXI_RRESP),
    .S_AXI_HP0_rvalid(S00_AXI_RVALID),
    .S_AXI_HP0_wdata(S00_AXI_WDATA),
    .S_AXI_HP0_wid(S00_AXI_WID),
    .S_AXI_HP0_wlast(S00_AXI_WLAST),
    .S_AXI_HP0_wready(S00_AXI_WREADY),
    .S_AXI_HP0_wstrb(S00_AXI_WSTRB),
    .S_AXI_HP0_wvalid(S00_AXI_WVALID)
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
    .s_regs_rlast(M00_AXI_RLAST),
    .s_regs_rready(M00_AXI_RREADY),
    .s_regs_rdata(M00_AXI_RDATA),
    .s_regs_rresp(M00_AXI_RRESP)

);

endmodule

`default_nettype wire
