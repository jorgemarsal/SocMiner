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
  wire [1:0] M00_AXI_ARBURST;
  wire [3:0] M00_AXI_ARCACHE;
  wire [11:0] M00_AXI_ARID;
(* mark_debug = "true" *) wire [3:0] M00_AXI_ARLEN;
 wire [1:0] M00_AXI_ARLOCK;
 wire [2:0] M00_AXI_ARPROT;
 wire [3:0] M00_AXI_ARQOS;
(* mark_debug = "true" *) wire [0:0] M00_AXI_ARREADY;
 wire [2:0] M00_AXI_ARSIZE;
(* mark_debug = "true" *) wire [0:0] M00_AXI_ARVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_AWADDR;
 wire [1:0] M00_AXI_AWBURST;
 wire [3:0] M00_AXI_AWCACHE;
 wire [11:0] M00_AXI_AWID;
(* mark_debug = "true" *) wire [3:0] M00_AXI_AWLEN;
 wire [1:0] M00_AXI_AWLOCK;
 wire [2:0] M00_AXI_AWPROT;
 wire [3:0] M00_AXI_AWQOS;
(* mark_debug = "true" *) wire [0:0] M00_AXI_AWREADY;
wire [2:0] M00_AXI_AWSIZE;
(* mark_debug = "true" *) wire [0:0] M00_AXI_AWVALID;
wire [11:0] M00_AXI_BID;
(* mark_debug = "true" *) assign M00_AXI_BID = M00_AXI_AWID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_BREADY;
(* mark_debug = "true" *) wire [1:0] M00_AXI_BRESP;
(* mark_debug = "true" *) wire [0:0] M00_AXI_BVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_RDATA;
 wire [11:0] M00_AXI_RID;
 assign M00_AXI_RID = M00_AXI_ARID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RLAST;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RREADY;
 wire [1:0] M00_AXI_RRESP;
(* mark_debug = "true" *) wire [0:0] M00_AXI_RVALID;
(* mark_debug = "true" *) wire [31:0] M00_AXI_WDATA;
 wire [11:0] M00_AXI_WID;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WLAST;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WREADY;
(* mark_debug = "true" *) wire [3:0] M00_AXI_WSTRB;
(* mark_debug = "true" *) wire [0:0] M00_AXI_WVALID;

(* mark_debug = "true" *) wire [31:0] S00_AXI_ARADDR;
 wire [1:0] S00_AXI_ARBURST;
 wire [3:0] S00_AXI_ARCACHE;
 wire [5:0] S00_AXI_ARID;
(* mark_debug = "true" *) wire [3:0] S00_AXI_ARLEN;
 wire [1:0] S00_AXI_ARLOCK;
 wire [2:0] S00_AXI_ARPROT;
 wire [3:0] S00_AXI_ARQOS;
(* mark_debug = "true" *) wire [0:0] S00_AXI_ARREADY;
wire [2:0] S00_AXI_ARSIZE;
(* mark_debug = "true" *) wire [0:0] S00_AXI_ARVALID;
(* mark_debug = "true" *) wire [31:0] S00_AXI_AWADDR;
 wire [1:0] S00_AXI_AWBURST;
 wire [3:0] S00_AXI_AWCACHE;
 wire [5:0] S00_AXI_AWID;
(* mark_debug = "true" *) wire [3:0] S00_AXI_AWLEN;
 wire [1:0] S00_AXI_AWLOCK;
 wire [2:0] S00_AXI_AWPROT;
 wire [3:0] S00_AXI_AWQOS;
(* mark_debug = "true" *) wire [0:0] S00_AXI_AWREADY;
wire [2:0] S00_AXI_AWSIZE;
(* mark_debug = "true" *) wire [0:0] S00_AXI_AWVALID;
 wire [5:0] S00_AXI_BID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_BREADY;
(* mark_debug = "true" *) wire [1:0] S00_AXI_BRESP;
(* mark_debug = "true" *) wire [0:0] S00_AXI_BVALID;
(* mark_debug = "true" *) wire [63:0] S00_AXI_RDATA;
wire [5:0] S00_AXI_RID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RLAST;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RREADY;
(* mark_debug = "true" *) wire [1:0] S00_AXI_RRESP;
(* mark_debug = "true" *) wire [0:0] S00_AXI_RVALID;
(* mark_debug = "true" *) wire [63:0] S00_AXI_WDATA;
 wire [5:0] S00_AXI_WID;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WLAST;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WREADY;
(* mark_debug = "true" *) wire [7:0] S00_AXI_WSTRB;
(* mark_debug = "true" *) wire [0:0] S00_AXI_WVALID;

wire [31:0] S_AXI_ACP_ARADDR;                   
wire [ 1:0] S_AXI_ACP_ARBURST;                  
wire [ 3:0] S_AXI_ACP_ARCACHE;                  
wire [ 2:0] S_AXI_ACP_ARID;                     
wire [ 3:0] S_AXI_ACP_ARLEN;                    
wire [ 1:0] S_AXI_ACP_ARLOCK;                   
wire [ 2:0] S_AXI_ACP_ARPROT;                   
wire [ 3:0] S_AXI_ACP_ARQOS;                    
wire        S_AXI_ACP_ARREADY;                  
wire [2:0]  S_AXI_ACP_ARSIZE;                   
wire [4:0]  S_AXI_ACP_ARUSER;                   
wire        S_AXI_ACP_ARVALID;                  
wire [31:0] S_AXI_ACP_AWADDR;                   
wire [1:0]  S_AXI_ACP_AWBURST;                  
wire [3:0]  S_AXI_ACP_AWCACHE;                  
wire [2:0]  S_AXI_ACP_AWID;                     
wire [3:0]  S_AXI_ACP_AWLEN;                    
wire [1:0]  S_AXI_ACP_AWLOCK;                   
wire [2:0]  S_AXI_ACP_AWPROT;                   
wire [3:0]  S_AXI_ACP_AWQOS;                    
wire        S_AXI_ACP_AWREADY;                  
wire [2:0]  S_AXI_ACP_AWSIZE;                   
wire [4:0]  S_AXI_ACP_AWUSER;                   
wire        S_AXI_ACP_AWVALID;                  
wire  [2:0] S_AXI_ACP_BID;                      
wire        S_AXI_ACP_BREADY;                   
wire  [1:0] S_AXI_ACP_BRESP;                    
wire        S_AXI_ACP_BVALID;                   
wire  [63:0]S_AXI_ACP_RDATA;                    
wire  [2:0] S_AXI_ACP_RID;                      
wire        S_AXI_ACP_RLAST;                    
wire        S_AXI_ACP_RREADY;                   
wire  [1:0] S_AXI_ACP_RRESP;                    
wire        S_AXI_ACP_RVALID;                   
wire [63:0] S_AXI_ACP_WDATA;                    
wire [2:0]  S_AXI_ACP_WID;                      
wire        S_AXI_ACP_WLAST;                    
wire        S_AXI_ACP_WREADY;                   
wire [7:0]  S_AXI_ACP_WSTRB;                    
wire        S_AXI_ACP_WVALID;                   


(* mark_debug = "true" *) wire [15:0] interrupts;   


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
    .S_AXI_HP0_wvalid(S00_AXI_WVALID),
    //ACP
    .S_AXI_ACP_araddr (S_AXI_ACP_araddr ),
    .S_AXI_ACP_arburst(S_AXI_ACP_arburst),
    .S_AXI_ACP_arcache(S_AXI_ACP_arcache),
    .S_AXI_ACP_arid   (S_AXI_ACP_arid   ),
    .S_AXI_ACP_arlen  (S_AXI_ACP_arlen  ),
    .S_AXI_ACP_arlock (S_AXI_ACP_arlock ),
    .S_AXI_ACP_arprot (S_AXI_ACP_arprot ),
    .S_AXI_ACP_arqos  (S_AXI_ACP_arqos  ),
    .S_AXI_ACP_arready(S_AXI_ACP_arready),
    .S_AXI_ACP_arsize (S_AXI_ACP_arsize ),
    .S_AXI_ACP_aruser (S_AXI_ACP_aruser ),
    .S_AXI_ACP_arvalid(S_AXI_ACP_arvalid),
    .S_AXI_ACP_awaddr (S_AXI_ACP_awaddr ),
    .S_AXI_ACP_awburst(S_AXI_ACP_awburst),
    .S_AXI_ACP_awcache(S_AXI_ACP_awcache),
    .S_AXI_ACP_awid   (S_AXI_ACP_awid   ),
    .S_AXI_ACP_awlen  (S_AXI_ACP_awlen  ),
    .S_AXI_ACP_awlock (S_AXI_ACP_awlock ),
    .S_AXI_ACP_awprot (S_AXI_ACP_awprot ),
    .S_AXI_ACP_awqos  (S_AXI_ACP_awqos  ),
    .S_AXI_ACP_awready(S_AXI_ACP_awready),
    .S_AXI_ACP_awsize (S_AXI_ACP_awsize ),
    .S_AXI_ACP_awuser (S_AXI_ACP_awuser ),
    .S_AXI_ACP_awvalid(S_AXI_ACP_awvalid),
    .S_AXI_ACP_bid    (S_AXI_ACP_bid    ),
    .S_AXI_ACP_bready (S_AXI_ACP_bready ),
    .S_AXI_ACP_bresp  (S_AXI_ACP_bresp  ),
    .S_AXI_ACP_bvalid (S_AXI_ACP_bvalid ),
    .S_AXI_ACP_rdata  (S_AXI_ACP_rdata  ),
    .S_AXI_ACP_rid    (S_AXI_ACP_rid    ),
    .S_AXI_ACP_rlast  (S_AXI_ACP_rlast  ),
    .S_AXI_ACP_rready (S_AXI_ACP_rready ),
    .S_AXI_ACP_rresp  (S_AXI_ACP_rresp  ),
    .S_AXI_ACP_rvalid (S_AXI_ACP_rvalid ),
    .S_AXI_ACP_wdata  (S_AXI_ACP_wdata  ),
    .S_AXI_ACP_wid    (S_AXI_ACP_wid    ),
    .S_AXI_ACP_wlast  (S_AXI_ACP_wlast  ),
    .S_AXI_ACP_wready (S_AXI_ACP_wready ),
    .S_AXI_ACP_wstrb  (S_AXI_ACP_wstrb  ),
    .S_AXI_ACP_wvalid (S_AXI_ACP_wvalid ),
    .In0  (interrupts[0]),
    .In1  (interrupts[1]),  
    .In2  (interrupts[2]),
    .In3  (interrupts[3]),
    .In4  (interrupts[4]),
    .In5  (interrupts[5]),
    .In6  (interrupts[6]),
    .In7  (interrupts[7]),
    .In8  (interrupts[8]),
    .In9  (interrupts[9]),
    .In10 (interrupts[10]),
    .In11 (interrupts[11]),
    .In12 (interrupts[12]),
    .In13 (interrupts[13]),
    .In14 (interrupts[14]),
    .In15 (interrupts[15])

);

assign interrupts[1] = 1'b0;
assign interrupts[2] = 1'b0;
assign interrupts[3] = 1'b0;
assign interrupts[4] = 1'b0;
assign interrupts[5] = 1'b0;
assign interrupts[6] = 1'b0;
assign interrupts[7] = 1'b0;
assign interrupts[8] = 1'b0;
assign interrupts[9] = 1'b0;
assign interrupts[10] = 1'b0;
assign interrupts[11] = 1'b0;
assign interrupts[12] = 1'b0;
assign interrupts[13] = 1'b0;
assign interrupts[14] = 1'b0;
assign interrupts[15] = 1'b0;



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
    .s_regs_awlen(M00_AXI_AWLEN),
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
    .s_regs_arlen(M00_AXI_ARLEN),    
    .s_regs_rvalid(M00_AXI_RVALID),
    .s_regs_rlast(M00_AXI_RLAST),
    .s_regs_rready(M00_AXI_RREADY),
    .s_regs_rdata(M00_AXI_RDATA),
    .s_regs_rresp(M00_AXI_RRESP),
    //acp
    .s_axi_acp_araddr (S_AXI_ACP_ARADDR ),
    .s_axi_acp_arburst(S_AXI_ACP_ARBURST),
    .s_axi_acp_arcache(S_AXI_ACP_ARCACHE),
    .s_axi_acp_arid   (S_AXI_ACP_ARID   ),
    .s_axi_acp_arlen  (S_AXI_ACP_ARLEN  ),
    .s_axi_acp_arlock (S_AXI_ACP_ARLOCK ),
    .s_axi_acp_arprot (S_AXI_ACP_ARPROT ),
    .s_axi_acp_arqos  (S_AXI_ACP_ARQOS  ),
    .s_axi_acp_arready(S_AXI_ACP_ARREADY),
    .s_axi_acp_arsize (S_AXI_ACP_ARSIZE ),
    .s_axi_acp_aruser (S_AXI_ACP_ARUSER ),
    .s_axi_acp_arvalid(S_AXI_ACP_ARVALID),
    .s_axi_acp_awaddr (S_AXI_ACP_AWADDR ),
    .s_axi_acp_awburst(S_AXI_ACP_AWBURST),
    .s_axi_acp_awcache(S_AXI_ACP_AWCACHE),
    .s_axi_acp_awid   (S_AXI_ACP_AWID   ),
    .s_axi_acp_awlen  (S_AXI_ACP_AWLEN  ),
    .s_axi_acp_awlock (S_AXI_ACP_AWLOCK ),
    .s_axi_acp_awprot (S_AXI_ACP_AWPROT ),
    .s_axi_acp_awqos  (S_AXI_ACP_AWQOS  ),
    .s_axi_acp_awready(S_AXI_ACP_AWREADY),
    .s_axi_acp_awsize (S_AXI_ACP_AWSIZE ),
    .s_axi_acp_awuser (S_AXI_ACP_AWUSER ),
    .s_axi_acp_awvalid(S_AXI_ACP_AWVALID),
    .s_axi_acp_bid    (S_AXI_ACP_BID    ),
    .s_axi_acp_bready (S_AXI_ACP_BREADY ),
    .s_axi_acp_bresp  (S_AXI_ACP_BRESP  ),
    .s_axi_acp_bvalid (S_AXI_ACP_BVALID ),
    .s_axi_acp_rdata  (S_AXI_ACP_RDATA  ),
    .s_axi_acp_rid    (S_AXI_ACP_RID    ),
    .s_axi_acp_rlast  (S_AXI_ACP_RLAST  ),
    .s_axi_acp_rready (S_AXI_ACP_RREADY ),
    .s_axi_acp_rresp  (S_AXI_ACP_RRESP  ),
    .s_axi_acp_rvalid (S_AXI_ACP_RVALID ),
    .s_axi_acp_wdata  (S_AXI_ACP_WDATA  ),
    .s_axi_acp_wid    (S_AXI_ACP_WID    ),
    .s_axi_acp_wlast  (S_AXI_ACP_WLAST  ),
    .s_axi_acp_wready (S_AXI_ACP_WREADY ),
    .s_axi_acp_wstrb  (S_AXI_ACP_WSTRB  ),
    .s_axi_acp_wvalid (S_AXI_ACP_WVALID ),
    
    .Interrupt        (interrupts[0]    )

    

);

endmodule

`default_nettype wire
