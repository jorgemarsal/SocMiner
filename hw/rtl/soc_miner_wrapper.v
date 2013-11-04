//`default_nettype none



module soc_miner_wrapper #(
    parameter MEMORY_DATA_WIDTH=64, 
              MEMORY_ADDR_WIDTH=32, 
              MEMORY_BUS_LEN_WIDTH=4, 
              MEMORY_ID_WIDTH=6, 
              REGS_DATA_WIDTH=32, 
              REGS_ADDR_WIDTH=32
)(

input wire [0:0] ACLK,
input wire [0:0] ARESET_N,

output wire [0:0] M_MEMORY_AWVALID,
input wire [0:0] M_MEMORY_AWREADY,
output wire [MEMORY_ADDR_WIDTH-1:0] M_MEMORY_AWADDR,
output wire [MEMORY_BUS_LEN_WIDTH-1:0] M_MEMORY_AWLEN,
output wire [MEMORY_ID_WIDTH-1:0] M_MEMORY_AWID,
output wire [2:0] M_MEMORY_AWSIZE,
output wire [1:0] M_MEMORY_AWBURST,
output wire [1:0] M_MEMORY_AWLOCK,
output wire [3:0] M_MEMORY_AWCACHE,
output wire [2:0] M_MEMORY_AWPROT,
output wire [3:0] M_MEMORY_AWQOS,
output wire [0:0] M_MEMORY_WVALID,
input wire [0:0] M_MEMORY_WREADY,
output wire [MEMORY_DATA_WIDTH-1:0] M_MEMORY_WDATA,
output wire [(MEMORY_DATA_WIDTH/8)-1:0] M_MEMORY_WSTRB,
output wire [0:0] M_MEMORY_WLAST,
output wire [MEMORY_ID_WIDTH-1:0] M_MEMORY_WID,
input wire [0:0] M_MEMORY_BVALID,
output wire [0:0] M_MEMORY_BREADY,
input wire [1:0] M_MEMORY_BRESP,
input wire [MEMORY_ID_WIDTH-1:0] M_MEMORY_BID,
output wire [0:0] M_MEMORY_ARVALID,
input wire [0:0] M_MEMORY_ARREADY,
output wire [MEMORY_ADDR_WIDTH-1:0] M_MEMORY_ARADDR,
output wire [MEMORY_BUS_LEN_WIDTH-1:0] M_MEMORY_ARLEN,
output wire [MEMORY_ID_WIDTH-1:0] M_MEMORY_ARID,
output wire [2:0] M_MEMORY_ARSIZE,
output wire [1:0] M_MEMORY_ARBURST,
output wire [1:0] M_MEMORY_ARLOCK,
output wire [3:0] M_MEMORY_ARCACHE,
output wire [2:0] M_MEMORY_ARPROT,
output wire [3:0] M_MEMORY_ARQOS,
input wire [0:0] M_MEMORY_RVALID,
output wire [0:0] M_MEMORY_RREADY,
input wire [MEMORY_DATA_WIDTH-1:0] M_MEMORY_RDATA,
input wire [0:0] M_MEMORY_RLAST,
input wire [1:0] M_MEMORY_RRESP,
input wire [MEMORY_ID_WIDTH-1:0] M_MEMORY_RID,

input wire [0:0] S_REGS_AWVALID,
output wire [0:0] S_REGS_AWREADY,
input wire [REGS_ADDR_WIDTH-1:0] S_REGS_AWADDR,
input wire [2:0] S_REGS_AWPROT,
input wire [0:0] S_REGS_WVALID,
output wire [0:0] S_REGS_WREADY,
input wire [REGS_DATA_WIDTH-1:0] S_REGS_WDATA,
input wire [(REGS_DATA_WIDTH/8)-1:0] S_REGS_WSTRB,
output wire [0:0] S_REGS_BVALID,
input wire [0:0] S_REGS_BREADY,
output wire [1:0] S_REGS_BRESP,
input wire [0:0] S_REGS_ARVALID,
output wire [0:0] S_REGS_ARREADY,
input wire [REGS_ADDR_WIDTH-1:0] S_REGS_ARADDR,
input wire [2:0] S_REGS_ARPROT,
output wire [0:0] S_REGS_RVALID,
input wire [0:0] S_REGS_RREADY,
output wire [REGS_DATA_WIDTH-1:0] S_REGS_RDATA,
output wire [1:0] S_REGS_RRESP

);

//axi4_if #(.DATA_WIDTH(MEMORY_DATA_WIDTH),
//          .ADDR_WIDTH(MEMORY_ADDR_WIDTH), 
//          .BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH), 
//          .ID_WIDTH(MEMORY_ID_WIDTH)) m_axi4_if(ACLK, ARESET_N);
//axi4lite_if #(.DATA_WIDTH(REGS_DATA_WIDTH),
//              .ADDR_WIDTH(REGS_ADDR_WIDTH)) m_axi4lite_if(ACLK, ARESET_N);

soc_miner #(.MEMORY_DATA_WIDTH(MEMORY_DATA_WIDTH),
          .MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH), 
          .MEMORY_BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH), 
          .MEMORY_ID_WIDTH(MEMORY_ID_WIDTH),
            .REGS_DATA_WIDTH(REGS_DATA_WIDTH),
              .REGS_ADDR_WIDTH(REGS_ADDR_WIDTH)
            ) I_SOC_MINER(
    .Clk(ACLK), 
    .Rst_n(ARESET_N), 
//                      .Axi4_if(m_axi4_if), .Axi4lite_if(m_axi4lite_if)
.m_memory_awvalid(M_MEMORY_AWVALID),
.m_memory_awready(M_MEMORY_AWREADY),
.m_memory_awaddr(M_MEMORY_AWADDR),
.m_memory_awlen(M_MEMORY_AWLEN),
.m_memory_awid(M_MEMORY_AWID),
.m_memory_awsize(M_MEMORY_AWSIZE),
.m_memory_awburst(M_MEMORY_AWBURST),
.m_memory_awlock(M_MEMORY_AWLOCK),
.m_memory_awcache(M_MEMORY_AWCACHE),
.m_memory_awprot(M_MEMORY_AWPROT),
.m_memory_awqos(M_MEMORY_AWQOS),
.m_memory_wvalid(M_MEMORY_WVALID),
.m_memory_wready(M_MEMORY_WREADY),
.m_memory_wdata(M_MEMORY_WDATA),
.m_memory_wstrb(M_MEMORY_WSTRB),
.m_memory_wlast(M_MEMORY_WLAST),
.m_memory_wid(M_MEMORY_WID),
.m_memory_bvalid(M_MEMORY_BVALID),
.m_memory_bready(M_MEMORY_BREADY),
.m_memory_bresp(M_MEMORY_BRESP),
.m_memory_bid(M_MEMORY_BID),
.m_memory_arvalid(M_MEMORY_ARVALID),
.m_memory_arready(M_MEMORY_ARREADY),
.m_memory_araddr(M_MEMORY_ARADDR),
.m_memory_arlen(M_MEMORY_ARLEN),
.m_memory_arid(M_MEMORY_ARID),
.m_memory_arsize(M_MEMORY_ARSIZE),
.m_memory_arburst(M_MEMORY_ARBURST),
.m_memory_arlock(M_MEMORY_ARLOCK),
.m_memory_arcache(M_MEMORY_ARCACHE),
.m_memory_arprot(M_MEMORY_ARPROT),
.m_memory_arqos(M_MEMORY_ARQOS),
.m_memory_rvalid(M_MEMORY_RVALID),
.m_memory_rready(M_MEMORY_RREADY),
.m_memory_rdata(M_MEMORY_RDATA),
.m_memory_rlast(M_MEMORY_RLAST),
.m_memory_rresp(M_MEMORY_RRESP),
.m_memory_rid(M_MEMORY_RID),
.s_regs_awvalid(S_REGS_AWVALID),
.s_regs_awready(S_REGS_AWREADY),
.s_regs_awaddr(S_REGS_AWADDR),
.s_regs_awprot(S_REGS_AWPROT),
.s_regs_wvalid(S_REGS_WVALID),
.s_regs_wready(S_REGS_WREADY),
.s_regs_wdata(S_REGS_WDATA),
.s_regs_wstrb(S_REGS_WSTRB),
.s_regs_bvalid(S_REGS_BVALID),
.s_regs_bready(S_REGS_BREADY),
.s_regs_bresp(S_REGS_BRESP),
.s_regs_arvalid(S_REGS_ARVALID),
.s_regs_arready(S_REGS_ARREADY),
.s_regs_araddr(S_REGS_ARADDR),
.s_regs_arprot(S_REGS_ARPROT),
.s_regs_rvalid(S_REGS_RVALID),
.s_regs_rready(S_REGS_RREADY),
.s_regs_rdata(S_REGS_RDATA),
.s_regs_rresp(S_REGS_RRESP)

                      );
/*
assign   M_MEMORY_AWVALID    = m_axi4_if.awvalid ;
assign   m_axi4_if.awready   = M_MEMORY_AWREADY  ;
assign   M_MEMORY_AWADDR     = m_axi4_if.awaddr  ;
assign   M_MEMORY_AWLEN      = m_axi4_if.awlen   ;
assign   M_MEMORY_AWID       = m_axi4_if.awid    ;
assign   M_MEMORY_AWSIZE     = m_axi4_if.awsize  ;
assign   M_MEMORY_AWBURST    = m_axi4_if.awburst ;
assign   M_MEMORY_AWLOCK     = m_axi4_if.awlock  ;
assign   M_MEMORY_AWCACHE    = m_axi4_if.awcache ;
assign   M_MEMORY_AWPROT     = m_axi4_if.awprot  ;
assign   M_MEMORY_AWQOS      = m_axi4_if.awqos   ;
assign   M_MEMORY_WVALID     = m_axi4_if.wvalid  ;
assign   m_axi4_if.wready    = M_MEMORY_WREADY   ;
assign   M_MEMORY_WDATA      = m_axi4_if.wdata   ;
assign   M_MEMORY_WSTRB      = m_axi4_if.wstrb   ;
assign   M_MEMORY_WLAST      = m_axi4_if.wlast   ;
assign   M_MEMORY_WID        = m_axi4_if.wid     ;
assign   m_axi4_if.bvalid    = M_MEMORY_BVALID   ;
assign   M_MEMORY_BREADY     = m_axi4_if.bready  ;
assign   m_axi4_if.bresp     = M_MEMORY_BRESP    ;
assign   m_axi4_if.bid       = M_MEMORY_BID      ;
assign   M_MEMORY_ARVALID    = m_axi4_if.arvalid ;
assign   m_axi4_if.arready   = M_MEMORY_ARREADY  ;
assign   M_MEMORY_ARADDR     = m_axi4_if.araddr  ;
assign   M_MEMORY_ARLEN      = m_axi4_if.arlen   ;
assign   M_MEMORY_ARID       = m_axi4_if.arid    ;
assign   M_MEMORY_ARSIZE     = m_axi4_if.arsize  ;
assign   M_MEMORY_ARBURST    = m_axi4_if.arburst ;
assign   M_MEMORY_ARLOCK     = m_axi4_if.arlock  ;
assign   M_MEMORY_ARCACHE    = m_axi4_if.arcache ;
assign   M_MEMORY_ARPROT     = m_axi4_if.arprot  ;
assign   M_MEMORY_ARQOS      = m_axi4_if.arqos   ;
assign   m_axi4_if.rvalid    = M_MEMORY_RVALID   ;
assign   M_MEMORY_RREADY     = m_axi4_if.rready  ;
assign   m_axi4_if.rdata     = M_MEMORY_RDATA    ;
assign   m_axi4_if.rlast     = M_MEMORY_RLAST    ;
assign   m_axi4_if.rresp     = M_MEMORY_RRESP    ;
assign   m_axi4_if.rid       = M_MEMORY_RID      ;

assign m_axi4lite_if.awvalid = S_REGS_AWVALID;
assign S_REGS_AWREADY = m_axi4lite_if.awready;
assign m_axi4lite_if.awaddr = S_REGS_AWADDR;
assign m_axi4lite_if.awprot = S_REGS_AWPROT;
assign m_axi4lite_if.wvalid = S_REGS_WVALID;
assign S_REGS_WREADY = m_axi4lite_if.wready;
assign m_axi4lite_if.wdata = S_REGS_WDATA;
assign m_axi4lite_if.wstrb = S_REGS_WSTRB;
assign S_REGS_BVALID = m_axi4lite_if.bvalid;
assign m_axi4lite_if.bready = S_REGS_BREADY;
assign S_REGS_BRESP = m_axi4lite_if.bresp;
assign m_axi4lite_if.arvalid = S_REGS_ARVALID;
assign S_REGS_ARREADY = m_axi4lite_if.arready;
assign m_axi4lite_if.araddr = S_REGS_ARADDR;
assign m_axi4lite_if.arprot = S_REGS_ARPROT;
assign S_REGS_RVALID = m_axi4lite_if.rvalid;
assign m_axi4lite_if.rready = S_REGS_RREADY;
assign S_REGS_RDATA = m_axi4lite_if.rdata;
assign S_REGS_RRESP = m_axi4lite_if.rresp;
*/



    
endmodule

//`default_nettype wire
