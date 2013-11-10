`timescale 1 ps / 1 ps

module s00_couplers_imp_1FHMR11
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [5:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [5:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [5:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [63:0]M_AXI_rdata;
  input [5:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [63:0]M_AXI_wdata;
  output [5:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [7:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [5:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [5:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [5:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [63:0]S_AXI_rdata;
  output [5:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [63:0]S_AXI_wdata;
  input [5:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [7:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [5:0]s00_couplers_to_s00_couplers_ARID;
  wire [3:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [1:0]s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [5:0]s00_couplers_to_s00_couplers_AWID;
  wire [3:0]s00_couplers_to_s00_couplers_AWLEN;
  wire [1:0]s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [5:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [63:0]s00_couplers_to_s00_couplers_RDATA;
  wire [5:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [63:0]s00_couplers_to_s00_couplers_WDATA;
  wire [5:0]s00_couplers_to_s00_couplers_WID;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [7:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[5:0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[3:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[5:0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[3:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[63:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wid[5:0] = s00_couplers_to_s00_couplers_WID;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[7:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[5:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[63:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[5:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[5:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[5:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[5:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[63:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[5:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[63:0];
  assign s00_couplers_to_s00_couplers_WID = S_AXI_wid[5:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[7:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

module s00_couplers_imp_A5QIOZ
   (M_ACLK,
    M_ARESETN,
    M_AXI_araddr,
    M_AXI_arburst,
    M_AXI_arcache,
    M_AXI_arid,
    M_AXI_arlen,
    M_AXI_arlock,
    M_AXI_arprot,
    M_AXI_arqos,
    M_AXI_arready,
    M_AXI_arsize,
    M_AXI_arvalid,
    M_AXI_awaddr,
    M_AXI_awburst,
    M_AXI_awcache,
    M_AXI_awid,
    M_AXI_awlen,
    M_AXI_awlock,
    M_AXI_awprot,
    M_AXI_awqos,
    M_AXI_awready,
    M_AXI_awsize,
    M_AXI_awvalid,
    M_AXI_bid,
    M_AXI_bready,
    M_AXI_bresp,
    M_AXI_bvalid,
    M_AXI_rdata,
    M_AXI_rid,
    M_AXI_rlast,
    M_AXI_rready,
    M_AXI_rresp,
    M_AXI_rvalid,
    M_AXI_wdata,
    M_AXI_wid,
    M_AXI_wlast,
    M_AXI_wready,
    M_AXI_wstrb,
    M_AXI_wvalid,
    S_ACLK,
    S_ARESETN,
    S_AXI_araddr,
    S_AXI_arburst,
    S_AXI_arcache,
    S_AXI_arid,
    S_AXI_arlen,
    S_AXI_arlock,
    S_AXI_arprot,
    S_AXI_arqos,
    S_AXI_arready,
    S_AXI_arsize,
    S_AXI_arvalid,
    S_AXI_awaddr,
    S_AXI_awburst,
    S_AXI_awcache,
    S_AXI_awid,
    S_AXI_awlen,
    S_AXI_awlock,
    S_AXI_awprot,
    S_AXI_awqos,
    S_AXI_awready,
    S_AXI_awsize,
    S_AXI_awvalid,
    S_AXI_bid,
    S_AXI_bready,
    S_AXI_bresp,
    S_AXI_bvalid,
    S_AXI_rdata,
    S_AXI_rid,
    S_AXI_rlast,
    S_AXI_rready,
    S_AXI_rresp,
    S_AXI_rvalid,
    S_AXI_wdata,
    S_AXI_wid,
    S_AXI_wlast,
    S_AXI_wready,
    S_AXI_wstrb,
    S_AXI_wvalid);
  input M_ACLK;
  input M_ARESETN;
  output [31:0]M_AXI_araddr;
  output [1:0]M_AXI_arburst;
  output [3:0]M_AXI_arcache;
  output [11:0]M_AXI_arid;
  output [3:0]M_AXI_arlen;
  output [1:0]M_AXI_arlock;
  output [2:0]M_AXI_arprot;
  output [3:0]M_AXI_arqos;
  input M_AXI_arready;
  output [2:0]M_AXI_arsize;
  output M_AXI_arvalid;
  output [31:0]M_AXI_awaddr;
  output [1:0]M_AXI_awburst;
  output [3:0]M_AXI_awcache;
  output [11:0]M_AXI_awid;
  output [3:0]M_AXI_awlen;
  output [1:0]M_AXI_awlock;
  output [2:0]M_AXI_awprot;
  output [3:0]M_AXI_awqos;
  input M_AXI_awready;
  output [2:0]M_AXI_awsize;
  output M_AXI_awvalid;
  input [11:0]M_AXI_bid;
  output M_AXI_bready;
  input [1:0]M_AXI_bresp;
  input M_AXI_bvalid;
  input [31:0]M_AXI_rdata;
  input [11:0]M_AXI_rid;
  input M_AXI_rlast;
  output M_AXI_rready;
  input [1:0]M_AXI_rresp;
  input M_AXI_rvalid;
  output [31:0]M_AXI_wdata;
  output [11:0]M_AXI_wid;
  output M_AXI_wlast;
  input M_AXI_wready;
  output [3:0]M_AXI_wstrb;
  output M_AXI_wvalid;
  input S_ACLK;
  input S_ARESETN;
  input [31:0]S_AXI_araddr;
  input [1:0]S_AXI_arburst;
  input [3:0]S_AXI_arcache;
  input [11:0]S_AXI_arid;
  input [3:0]S_AXI_arlen;
  input [1:0]S_AXI_arlock;
  input [2:0]S_AXI_arprot;
  input [3:0]S_AXI_arqos;
  output S_AXI_arready;
  input [2:0]S_AXI_arsize;
  input S_AXI_arvalid;
  input [31:0]S_AXI_awaddr;
  input [1:0]S_AXI_awburst;
  input [3:0]S_AXI_awcache;
  input [11:0]S_AXI_awid;
  input [3:0]S_AXI_awlen;
  input [1:0]S_AXI_awlock;
  input [2:0]S_AXI_awprot;
  input [3:0]S_AXI_awqos;
  output S_AXI_awready;
  input [2:0]S_AXI_awsize;
  input S_AXI_awvalid;
  output [11:0]S_AXI_bid;
  input S_AXI_bready;
  output [1:0]S_AXI_bresp;
  output S_AXI_bvalid;
  output [31:0]S_AXI_rdata;
  output [11:0]S_AXI_rid;
  output S_AXI_rlast;
  input S_AXI_rready;
  output [1:0]S_AXI_rresp;
  output S_AXI_rvalid;
  input [31:0]S_AXI_wdata;
  input [11:0]S_AXI_wid;
  input S_AXI_wlast;
  output S_AXI_wready;
  input [3:0]S_AXI_wstrb;
  input S_AXI_wvalid;

  wire [31:0]s00_couplers_to_s00_couplers_ARADDR;
  wire [1:0]s00_couplers_to_s00_couplers_ARBURST;
  wire [3:0]s00_couplers_to_s00_couplers_ARCACHE;
  wire [11:0]s00_couplers_to_s00_couplers_ARID;
  wire [3:0]s00_couplers_to_s00_couplers_ARLEN;
  wire [1:0]s00_couplers_to_s00_couplers_ARLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_ARPROT;
  wire [3:0]s00_couplers_to_s00_couplers_ARQOS;
  wire s00_couplers_to_s00_couplers_ARREADY;
  wire [2:0]s00_couplers_to_s00_couplers_ARSIZE;
  wire s00_couplers_to_s00_couplers_ARVALID;
  wire [31:0]s00_couplers_to_s00_couplers_AWADDR;
  wire [1:0]s00_couplers_to_s00_couplers_AWBURST;
  wire [3:0]s00_couplers_to_s00_couplers_AWCACHE;
  wire [11:0]s00_couplers_to_s00_couplers_AWID;
  wire [3:0]s00_couplers_to_s00_couplers_AWLEN;
  wire [1:0]s00_couplers_to_s00_couplers_AWLOCK;
  wire [2:0]s00_couplers_to_s00_couplers_AWPROT;
  wire [3:0]s00_couplers_to_s00_couplers_AWQOS;
  wire s00_couplers_to_s00_couplers_AWREADY;
  wire [2:0]s00_couplers_to_s00_couplers_AWSIZE;
  wire s00_couplers_to_s00_couplers_AWVALID;
  wire [11:0]s00_couplers_to_s00_couplers_BID;
  wire s00_couplers_to_s00_couplers_BREADY;
  wire [1:0]s00_couplers_to_s00_couplers_BRESP;
  wire s00_couplers_to_s00_couplers_BVALID;
  wire [31:0]s00_couplers_to_s00_couplers_RDATA;
  wire [11:0]s00_couplers_to_s00_couplers_RID;
  wire s00_couplers_to_s00_couplers_RLAST;
  wire s00_couplers_to_s00_couplers_RREADY;
  wire [1:0]s00_couplers_to_s00_couplers_RRESP;
  wire s00_couplers_to_s00_couplers_RVALID;
  wire [31:0]s00_couplers_to_s00_couplers_WDATA;
  wire [11:0]s00_couplers_to_s00_couplers_WID;
  wire s00_couplers_to_s00_couplers_WLAST;
  wire s00_couplers_to_s00_couplers_WREADY;
  wire [3:0]s00_couplers_to_s00_couplers_WSTRB;
  wire s00_couplers_to_s00_couplers_WVALID;

  assign M_AXI_araddr[31:0] = s00_couplers_to_s00_couplers_ARADDR;
  assign M_AXI_arburst[1:0] = s00_couplers_to_s00_couplers_ARBURST;
  assign M_AXI_arcache[3:0] = s00_couplers_to_s00_couplers_ARCACHE;
  assign M_AXI_arid[11:0] = s00_couplers_to_s00_couplers_ARID;
  assign M_AXI_arlen[3:0] = s00_couplers_to_s00_couplers_ARLEN;
  assign M_AXI_arlock[1:0] = s00_couplers_to_s00_couplers_ARLOCK;
  assign M_AXI_arprot[2:0] = s00_couplers_to_s00_couplers_ARPROT;
  assign M_AXI_arqos[3:0] = s00_couplers_to_s00_couplers_ARQOS;
  assign M_AXI_arsize[2:0] = s00_couplers_to_s00_couplers_ARSIZE;
  assign M_AXI_arvalid = s00_couplers_to_s00_couplers_ARVALID;
  assign M_AXI_awaddr[31:0] = s00_couplers_to_s00_couplers_AWADDR;
  assign M_AXI_awburst[1:0] = s00_couplers_to_s00_couplers_AWBURST;
  assign M_AXI_awcache[3:0] = s00_couplers_to_s00_couplers_AWCACHE;
  assign M_AXI_awid[11:0] = s00_couplers_to_s00_couplers_AWID;
  assign M_AXI_awlen[3:0] = s00_couplers_to_s00_couplers_AWLEN;
  assign M_AXI_awlock[1:0] = s00_couplers_to_s00_couplers_AWLOCK;
  assign M_AXI_awprot[2:0] = s00_couplers_to_s00_couplers_AWPROT;
  assign M_AXI_awqos[3:0] = s00_couplers_to_s00_couplers_AWQOS;
  assign M_AXI_awsize[2:0] = s00_couplers_to_s00_couplers_AWSIZE;
  assign M_AXI_awvalid = s00_couplers_to_s00_couplers_AWVALID;
  assign M_AXI_bready = s00_couplers_to_s00_couplers_BREADY;
  assign M_AXI_rready = s00_couplers_to_s00_couplers_RREADY;
  assign M_AXI_wdata[31:0] = s00_couplers_to_s00_couplers_WDATA;
  assign M_AXI_wid[11:0] = s00_couplers_to_s00_couplers_WID;
  assign M_AXI_wlast = s00_couplers_to_s00_couplers_WLAST;
  assign M_AXI_wstrb[3:0] = s00_couplers_to_s00_couplers_WSTRB;
  assign M_AXI_wvalid = s00_couplers_to_s00_couplers_WVALID;
  assign S_AXI_arready = s00_couplers_to_s00_couplers_ARREADY;
  assign S_AXI_awready = s00_couplers_to_s00_couplers_AWREADY;
  assign S_AXI_bid[11:0] = s00_couplers_to_s00_couplers_BID;
  assign S_AXI_bresp[1:0] = s00_couplers_to_s00_couplers_BRESP;
  assign S_AXI_bvalid = s00_couplers_to_s00_couplers_BVALID;
  assign S_AXI_rdata[31:0] = s00_couplers_to_s00_couplers_RDATA;
  assign S_AXI_rid[11:0] = s00_couplers_to_s00_couplers_RID;
  assign S_AXI_rlast = s00_couplers_to_s00_couplers_RLAST;
  assign S_AXI_rresp[1:0] = s00_couplers_to_s00_couplers_RRESP;
  assign S_AXI_rvalid = s00_couplers_to_s00_couplers_RVALID;
  assign S_AXI_wready = s00_couplers_to_s00_couplers_WREADY;
  assign s00_couplers_to_s00_couplers_ARADDR = S_AXI_araddr[31:0];
  assign s00_couplers_to_s00_couplers_ARBURST = S_AXI_arburst[1:0];
  assign s00_couplers_to_s00_couplers_ARCACHE = S_AXI_arcache[3:0];
  assign s00_couplers_to_s00_couplers_ARID = S_AXI_arid[11:0];
  assign s00_couplers_to_s00_couplers_ARLEN = S_AXI_arlen[3:0];
  assign s00_couplers_to_s00_couplers_ARLOCK = S_AXI_arlock[1:0];
  assign s00_couplers_to_s00_couplers_ARPROT = S_AXI_arprot[2:0];
  assign s00_couplers_to_s00_couplers_ARQOS = S_AXI_arqos[3:0];
  assign s00_couplers_to_s00_couplers_ARREADY = M_AXI_arready;
  assign s00_couplers_to_s00_couplers_ARSIZE = S_AXI_arsize[2:0];
  assign s00_couplers_to_s00_couplers_ARVALID = S_AXI_arvalid;
  assign s00_couplers_to_s00_couplers_AWADDR = S_AXI_awaddr[31:0];
  assign s00_couplers_to_s00_couplers_AWBURST = S_AXI_awburst[1:0];
  assign s00_couplers_to_s00_couplers_AWCACHE = S_AXI_awcache[3:0];
  assign s00_couplers_to_s00_couplers_AWID = S_AXI_awid[11:0];
  assign s00_couplers_to_s00_couplers_AWLEN = S_AXI_awlen[3:0];
  assign s00_couplers_to_s00_couplers_AWLOCK = S_AXI_awlock[1:0];
  assign s00_couplers_to_s00_couplers_AWPROT = S_AXI_awprot[2:0];
  assign s00_couplers_to_s00_couplers_AWQOS = S_AXI_awqos[3:0];
  assign s00_couplers_to_s00_couplers_AWREADY = M_AXI_awready;
  assign s00_couplers_to_s00_couplers_AWSIZE = S_AXI_awsize[2:0];
  assign s00_couplers_to_s00_couplers_AWVALID = S_AXI_awvalid;
  assign s00_couplers_to_s00_couplers_BID = M_AXI_bid[11:0];
  assign s00_couplers_to_s00_couplers_BREADY = S_AXI_bready;
  assign s00_couplers_to_s00_couplers_BRESP = M_AXI_bresp[1:0];
  assign s00_couplers_to_s00_couplers_BVALID = M_AXI_bvalid;
  assign s00_couplers_to_s00_couplers_RDATA = M_AXI_rdata[31:0];
  assign s00_couplers_to_s00_couplers_RID = M_AXI_rid[11:0];
  assign s00_couplers_to_s00_couplers_RLAST = M_AXI_rlast;
  assign s00_couplers_to_s00_couplers_RREADY = S_AXI_rready;
  assign s00_couplers_to_s00_couplers_RRESP = M_AXI_rresp[1:0];
  assign s00_couplers_to_s00_couplers_RVALID = M_AXI_rvalid;
  assign s00_couplers_to_s00_couplers_WDATA = S_AXI_wdata[31:0];
  assign s00_couplers_to_s00_couplers_WID = S_AXI_wid[11:0];
  assign s00_couplers_to_s00_couplers_WLAST = S_AXI_wlast;
  assign s00_couplers_to_s00_couplers_WREADY = M_AXI_wready;
  assign s00_couplers_to_s00_couplers_WSTRB = S_AXI_wstrb[3:0];
  assign s00_couplers_to_s00_couplers_WVALID = S_AXI_wvalid;
endmodule

(* CORE_GENERATION_INFO = "soc_miner_io,IP_Integrator,{x_ipVendor=xilinx.com,x_ipLanguage=VERILOG,numBlks=5,numReposBlks=1,numNonXlnxBlks=0,numHierBlks=4,maxHierDepth=0,da_ps7_cnt=1}" *) 
module soc_miner_io
   (ACLK,
    DDR_addr,
    DDR_ba,
    DDR_cas_n,
    DDR_ck_n,
    DDR_ck_p,
    DDR_cke,
    DDR_cs_n,
    DDR_dm,
    DDR_dq,
    DDR_dqs_n,
    DDR_dqs_p,
    DDR_odt,
    DDR_ras_n,
    DDR_reset_n,
    DDR_we_n,
    FCLK_RESET0_N,
    FIXED_IO_ddr_vrn,
    FIXED_IO_ddr_vrp,
    FIXED_IO_mio,
    FIXED_IO_ps_clk,
    FIXED_IO_ps_porb,
    FIXED_IO_ps_srstb,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  output ACLK;
  inout [14:0]DDR_addr;
  inout [2:0]DDR_ba;
  inout DDR_cas_n;
  inout DDR_ck_n;
  inout DDR_ck_p;
  inout DDR_cke;
  inout DDR_cs_n;
  inout [3:0]DDR_dm;
  inout [31:0]DDR_dq;
  inout [3:0]DDR_dqs_n;
  inout [3:0]DDR_dqs_p;
  inout DDR_odt;
  inout DDR_ras_n;
  inout DDR_reset_n;
  inout DDR_we_n;
  output FCLK_RESET0_N;
  inout FIXED_IO_ddr_vrn;
  inout FIXED_IO_ddr_vrp;
  inout [53:0]FIXED_IO_mio;
  inout FIXED_IO_ps_clk;
  inout FIXED_IO_ps_porb;
  inout FIXED_IO_ps_srstb;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [11:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [11:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [11:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [11:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [11:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [5:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [5:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [5:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [63:0]S00_AXI_rdata;
  output [5:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [63:0]S00_AXI_wdata;
  input [5:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire GND_1;
  wire [31:0]axi_interconnect_0_m00_axi_ARADDR;
  wire [1:0]axi_interconnect_0_m00_axi_ARBURST;
  wire [3:0]axi_interconnect_0_m00_axi_ARCACHE;
  wire [5:0]axi_interconnect_0_m00_axi_ARID;
  wire [3:0]axi_interconnect_0_m00_axi_ARLEN;
  wire [1:0]axi_interconnect_0_m00_axi_ARLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_ARPROT;
  wire [3:0]axi_interconnect_0_m00_axi_ARQOS;
  wire axi_interconnect_0_m00_axi_ARREADY;
  wire [2:0]axi_interconnect_0_m00_axi_ARSIZE;
  wire axi_interconnect_0_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_0_m00_axi_AWADDR;
  wire [1:0]axi_interconnect_0_m00_axi_AWBURST;
  wire [3:0]axi_interconnect_0_m00_axi_AWCACHE;
  wire [5:0]axi_interconnect_0_m00_axi_AWID;
  wire [3:0]axi_interconnect_0_m00_axi_AWLEN;
  wire [1:0]axi_interconnect_0_m00_axi_AWLOCK;
  wire [2:0]axi_interconnect_0_m00_axi_AWPROT;
  wire [3:0]axi_interconnect_0_m00_axi_AWQOS;
  wire axi_interconnect_0_m00_axi_AWREADY;
  wire [2:0]axi_interconnect_0_m00_axi_AWSIZE;
  wire axi_interconnect_0_m00_axi_AWVALID;
  wire [5:0]axi_interconnect_0_m00_axi_BID;
  wire axi_interconnect_0_m00_axi_BREADY;
  wire [1:0]axi_interconnect_0_m00_axi_BRESP;
  wire axi_interconnect_0_m00_axi_BVALID;
  wire [63:0]axi_interconnect_0_m00_axi_RDATA;
  wire [5:0]axi_interconnect_0_m00_axi_RID;
  wire axi_interconnect_0_m00_axi_RLAST;
  wire axi_interconnect_0_m00_axi_RREADY;
  wire [1:0]axi_interconnect_0_m00_axi_RRESP;
  wire axi_interconnect_0_m00_axi_RVALID;
  wire [63:0]axi_interconnect_0_m00_axi_WDATA;
  wire [5:0]axi_interconnect_0_m00_axi_WID;
  wire axi_interconnect_0_m00_axi_WLAST;
  wire axi_interconnect_0_m00_axi_WREADY;
  wire [7:0]axi_interconnect_0_m00_axi_WSTRB;
  wire axi_interconnect_0_m00_axi_WVALID;
  wire [31:0]axi_interconnect_1_m00_axi_ARADDR;
  wire [1:0]axi_interconnect_1_m00_axi_ARBURST;
  wire [3:0]axi_interconnect_1_m00_axi_ARCACHE;
  wire [11:0]axi_interconnect_1_m00_axi_ARID;
  wire [3:0]axi_interconnect_1_m00_axi_ARLEN;
  wire [1:0]axi_interconnect_1_m00_axi_ARLOCK;
  wire [2:0]axi_interconnect_1_m00_axi_ARPROT;
  wire [3:0]axi_interconnect_1_m00_axi_ARQOS;
  wire axi_interconnect_1_m00_axi_ARREADY;
  wire [2:0]axi_interconnect_1_m00_axi_ARSIZE;
  wire axi_interconnect_1_m00_axi_ARVALID;
  wire [31:0]axi_interconnect_1_m00_axi_AWADDR;
  wire [1:0]axi_interconnect_1_m00_axi_AWBURST;
  wire [3:0]axi_interconnect_1_m00_axi_AWCACHE;
  wire [11:0]axi_interconnect_1_m00_axi_AWID;
  wire [3:0]axi_interconnect_1_m00_axi_AWLEN;
  wire [1:0]axi_interconnect_1_m00_axi_AWLOCK;
  wire [2:0]axi_interconnect_1_m00_axi_AWPROT;
  wire [3:0]axi_interconnect_1_m00_axi_AWQOS;
  wire axi_interconnect_1_m00_axi_AWREADY;
  wire [2:0]axi_interconnect_1_m00_axi_AWSIZE;
  wire axi_interconnect_1_m00_axi_AWVALID;
  wire [11:0]axi_interconnect_1_m00_axi_BID;
  wire axi_interconnect_1_m00_axi_BREADY;
  wire [1:0]axi_interconnect_1_m00_axi_BRESP;
  wire axi_interconnect_1_m00_axi_BVALID;
  wire [31:0]axi_interconnect_1_m00_axi_RDATA;
  wire [11:0]axi_interconnect_1_m00_axi_RID;
  wire axi_interconnect_1_m00_axi_RLAST;
  wire axi_interconnect_1_m00_axi_RREADY;
  wire [1:0]axi_interconnect_1_m00_axi_RRESP;
  wire axi_interconnect_1_m00_axi_RVALID;
  wire [31:0]axi_interconnect_1_m00_axi_WDATA;
  wire [11:0]axi_interconnect_1_m00_axi_WID;
  wire axi_interconnect_1_m00_axi_WLAST;
  wire axi_interconnect_1_m00_axi_WREADY;
  wire [3:0]axi_interconnect_1_m00_axi_WSTRB;
  wire axi_interconnect_1_m00_axi_WVALID;
  wire [14:0]processing_system7_0_ddr_ADDR;
  wire [2:0]processing_system7_0_ddr_BA;
  wire processing_system7_0_ddr_CAS_N;
  wire processing_system7_0_ddr_CKE;
  wire processing_system7_0_ddr_CK_N;
  wire processing_system7_0_ddr_CK_P;
  wire processing_system7_0_ddr_CS_N;
  wire [3:0]processing_system7_0_ddr_DM;
  wire [31:0]processing_system7_0_ddr_DQ;
  wire [3:0]processing_system7_0_ddr_DQS_N;
  wire [3:0]processing_system7_0_ddr_DQS_P;
  wire processing_system7_0_ddr_ODT;
  wire processing_system7_0_ddr_RAS_N;
  wire processing_system7_0_ddr_RESET_N;
  wire processing_system7_0_ddr_WE_N;
  wire processing_system7_0_fclk_clk0;
  wire processing_system7_0_fclk_reset0_n;
  wire processing_system7_0_fixed_io_DDR_VRN;
  wire processing_system7_0_fixed_io_DDR_VRP;
  wire [53:0]processing_system7_0_fixed_io_MIO;
  wire processing_system7_0_fixed_io_PS_CLK;
  wire processing_system7_0_fixed_io_PS_PORB;
  wire processing_system7_0_fixed_io_PS_SRSTB;
(* mark_debug = "true" *)  wire [31:0]processing_system7_0_m_axi_gp0_ARADDR;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_ARBURST;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_ARCACHE;
(* mark_debug = "true" *)  wire [11:0]processing_system7_0_m_axi_gp0_ARID;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_ARLEN;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_ARLOCK;
(* mark_debug = "true" *)  wire [2:0]processing_system7_0_m_axi_gp0_ARPROT;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_ARQOS;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_ARREADY;
(* mark_debug = "true" *)  wire [2:0]processing_system7_0_m_axi_gp0_ARSIZE;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_ARVALID;
(* mark_debug = "true" *)  wire [31:0]processing_system7_0_m_axi_gp0_AWADDR;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_AWBURST;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_AWCACHE;
(* mark_debug = "true" *)  wire [11:0]processing_system7_0_m_axi_gp0_AWID;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_AWLEN;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_AWLOCK;
(* mark_debug = "true" *)  wire [2:0]processing_system7_0_m_axi_gp0_AWPROT;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_AWQOS;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_AWREADY;
(* mark_debug = "true" *)  wire [2:0]processing_system7_0_m_axi_gp0_AWSIZE;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_AWVALID;
(* mark_debug = "true" *)  wire [11:0]processing_system7_0_m_axi_gp0_BID;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_BREADY;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_BRESP;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_BVALID;
(* mark_debug = "true" *)  wire [31:0]processing_system7_0_m_axi_gp0_RDATA;
(* mark_debug = "true" *)  wire [11:0]processing_system7_0_m_axi_gp0_RID;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_RLAST;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_RREADY;
(* mark_debug = "true" *)  wire [1:0]processing_system7_0_m_axi_gp0_RRESP;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_RVALID;
(* mark_debug = "true" *)  wire [31:0]processing_system7_0_m_axi_gp0_WDATA;
(* mark_debug = "true" *)  wire [11:0]processing_system7_0_m_axi_gp0_WID;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_WLAST;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_WREADY;
(* mark_debug = "true" *)  wire [3:0]processing_system7_0_m_axi_gp0_WSTRB;
(* mark_debug = "true" *)  wire processing_system7_0_m_axi_gp0_WVALID;
  wire [31:0]s00_axi_1_ARADDR;
  wire [1:0]s00_axi_1_ARBURST;
  wire [3:0]s00_axi_1_ARCACHE;
  wire [5:0]s00_axi_1_ARID;
  wire [3:0]s00_axi_1_ARLEN;
  wire [1:0]s00_axi_1_ARLOCK;
  wire [2:0]s00_axi_1_ARPROT;
  wire [3:0]s00_axi_1_ARQOS;
  wire s00_axi_1_ARREADY;
  wire [2:0]s00_axi_1_ARSIZE;
  wire s00_axi_1_ARVALID;
  wire [31:0]s00_axi_1_AWADDR;
  wire [1:0]s00_axi_1_AWBURST;
  wire [3:0]s00_axi_1_AWCACHE;
  wire [5:0]s00_axi_1_AWID;
  wire [3:0]s00_axi_1_AWLEN;
  wire [1:0]s00_axi_1_AWLOCK;
  wire [2:0]s00_axi_1_AWPROT;
  wire [3:0]s00_axi_1_AWQOS;
  wire s00_axi_1_AWREADY;
  wire [2:0]s00_axi_1_AWSIZE;
  wire s00_axi_1_AWVALID;
  wire [5:0]s00_axi_1_BID;
  wire s00_axi_1_BREADY;
  wire [1:0]s00_axi_1_BRESP;
  wire s00_axi_1_BVALID;
  wire [63:0]s00_axi_1_RDATA;
  wire [5:0]s00_axi_1_RID;
  wire s00_axi_1_RLAST;
  wire s00_axi_1_RREADY;
  wire [1:0]s00_axi_1_RRESP;
  wire s00_axi_1_RVALID;
  wire [63:0]s00_axi_1_WDATA;
  wire [5:0]s00_axi_1_WID;
  wire s00_axi_1_WLAST;
  wire s00_axi_1_WREADY;
  wire [7:0]s00_axi_1_WSTRB;
  wire s00_axi_1_WVALID;

  assign ACLK = processing_system7_0_fclk_clk0;
  assign FCLK_RESET0_N = processing_system7_0_fclk_reset0_n;
  assign M00_AXI_araddr[31:0] = axi_interconnect_1_m00_axi_ARADDR;
  assign M00_AXI_arburst[1:0] = axi_interconnect_1_m00_axi_ARBURST;
  assign M00_AXI_arcache[3:0] = axi_interconnect_1_m00_axi_ARCACHE;
  assign M00_AXI_arid[11:0] = axi_interconnect_1_m00_axi_ARID;
  assign M00_AXI_arlen[3:0] = axi_interconnect_1_m00_axi_ARLEN;
  assign M00_AXI_arlock[1:0] = axi_interconnect_1_m00_axi_ARLOCK;
  assign M00_AXI_arprot[2:0] = axi_interconnect_1_m00_axi_ARPROT;
  assign M00_AXI_arqos[3:0] = axi_interconnect_1_m00_axi_ARQOS;
  assign M00_AXI_arsize[2:0] = axi_interconnect_1_m00_axi_ARSIZE;
  assign M00_AXI_arvalid = axi_interconnect_1_m00_axi_ARVALID;
  assign M00_AXI_awaddr[31:0] = axi_interconnect_1_m00_axi_AWADDR;
  assign M00_AXI_awburst[1:0] = axi_interconnect_1_m00_axi_AWBURST;
  assign M00_AXI_awcache[3:0] = axi_interconnect_1_m00_axi_AWCACHE;
  assign M00_AXI_awid[11:0] = axi_interconnect_1_m00_axi_AWID;
  assign M00_AXI_awlen[3:0] = axi_interconnect_1_m00_axi_AWLEN;
  assign M00_AXI_awlock[1:0] = axi_interconnect_1_m00_axi_AWLOCK;
  assign M00_AXI_awprot[2:0] = axi_interconnect_1_m00_axi_AWPROT;
  assign M00_AXI_awqos[3:0] = axi_interconnect_1_m00_axi_AWQOS;
  assign M00_AXI_awsize[2:0] = axi_interconnect_1_m00_axi_AWSIZE;
  assign M00_AXI_awvalid = axi_interconnect_1_m00_axi_AWVALID;
  assign M00_AXI_bready = axi_interconnect_1_m00_axi_BREADY;
  assign M00_AXI_rready = axi_interconnect_1_m00_axi_RREADY;
  assign M00_AXI_wdata[31:0] = axi_interconnect_1_m00_axi_WDATA;
  assign M00_AXI_wid[11:0] = axi_interconnect_1_m00_axi_WID;
  assign M00_AXI_wlast = axi_interconnect_1_m00_axi_WLAST;
  assign M00_AXI_wstrb[3:0] = axi_interconnect_1_m00_axi_WSTRB;
  assign M00_AXI_wvalid = axi_interconnect_1_m00_axi_WVALID;
  assign S00_AXI_arready = s00_axi_1_ARREADY;
  assign S00_AXI_awready = s00_axi_1_AWREADY;
  assign S00_AXI_bid[5:0] = s00_axi_1_BID;
  assign S00_AXI_bresp[1:0] = s00_axi_1_BRESP;
  assign S00_AXI_bvalid = s00_axi_1_BVALID;
  assign S00_AXI_rdata[63:0] = s00_axi_1_RDATA;
  assign S00_AXI_rid[5:0] = s00_axi_1_RID;
  assign S00_AXI_rlast = s00_axi_1_RLAST;
  assign S00_AXI_rresp[1:0] = s00_axi_1_RRESP;
  assign S00_AXI_rvalid = s00_axi_1_RVALID;
  assign S00_AXI_wready = s00_axi_1_WREADY;
  assign axi_interconnect_1_m00_axi_ARREADY = M00_AXI_arready;
  assign axi_interconnect_1_m00_axi_AWREADY = M00_AXI_awready;
  assign axi_interconnect_1_m00_axi_BID = M00_AXI_bid[11:0];
  assign axi_interconnect_1_m00_axi_BRESP = M00_AXI_bresp[1:0];
  assign axi_interconnect_1_m00_axi_BVALID = M00_AXI_bvalid;
  assign axi_interconnect_1_m00_axi_RDATA = M00_AXI_rdata[31:0];
  assign axi_interconnect_1_m00_axi_RID = M00_AXI_rid[11:0];
  assign axi_interconnect_1_m00_axi_RLAST = M00_AXI_rlast;
  assign axi_interconnect_1_m00_axi_RRESP = M00_AXI_rresp[1:0];
  assign axi_interconnect_1_m00_axi_RVALID = M00_AXI_rvalid;
  assign axi_interconnect_1_m00_axi_WREADY = M00_AXI_wready;
  assign s00_axi_1_ARADDR = S00_AXI_araddr[31:0];
  assign s00_axi_1_ARBURST = S00_AXI_arburst[1:0];
  assign s00_axi_1_ARCACHE = S00_AXI_arcache[3:0];
  assign s00_axi_1_ARID = S00_AXI_arid[5:0];
  assign s00_axi_1_ARLEN = S00_AXI_arlen[3:0];
  assign s00_axi_1_ARLOCK = S00_AXI_arlock[1:0];
  assign s00_axi_1_ARPROT = S00_AXI_arprot[2:0];
  assign s00_axi_1_ARQOS = S00_AXI_arqos[3:0];
  assign s00_axi_1_ARSIZE = S00_AXI_arsize[2:0];
  assign s00_axi_1_ARVALID = S00_AXI_arvalid;
  assign s00_axi_1_AWADDR = S00_AXI_awaddr[31:0];
  assign s00_axi_1_AWBURST = S00_AXI_awburst[1:0];
  assign s00_axi_1_AWCACHE = S00_AXI_awcache[3:0];
  assign s00_axi_1_AWID = S00_AXI_awid[5:0];
  assign s00_axi_1_AWLEN = S00_AXI_awlen[3:0];
  assign s00_axi_1_AWLOCK = S00_AXI_awlock[1:0];
  assign s00_axi_1_AWPROT = S00_AXI_awprot[2:0];
  assign s00_axi_1_AWQOS = S00_AXI_awqos[3:0];
  assign s00_axi_1_AWSIZE = S00_AXI_awsize[2:0];
  assign s00_axi_1_AWVALID = S00_AXI_awvalid;
  assign s00_axi_1_BREADY = S00_AXI_bready;
  assign s00_axi_1_RREADY = S00_AXI_rready;
  assign s00_axi_1_WDATA = S00_AXI_wdata[63:0];
  assign s00_axi_1_WID = S00_AXI_wid[5:0];
  assign s00_axi_1_WLAST = S00_AXI_wlast;
  assign s00_axi_1_WSTRB = S00_AXI_wstrb[7:0];
  assign s00_axi_1_WVALID = S00_AXI_wvalid;
GND GND
       (.G(GND_1));
soc_miner_io_axi_interconnect_0_0 axi_interconnect_0
       (.ACLK(processing_system7_0_fclk_clk0),
        .ARESETN(processing_system7_0_fclk_reset0_n),
        .M00_ACLK(processing_system7_0_fclk_clk0),
        .M00_ARESETN(processing_system7_0_fclk_reset0_n),
        .M00_AXI_araddr(axi_interconnect_0_m00_axi_ARADDR),
        .M00_AXI_arburst(axi_interconnect_0_m00_axi_ARBURST),
        .M00_AXI_arcache(axi_interconnect_0_m00_axi_ARCACHE),
        .M00_AXI_arid(axi_interconnect_0_m00_axi_ARID),
        .M00_AXI_arlen(axi_interconnect_0_m00_axi_ARLEN),
        .M00_AXI_arlock(axi_interconnect_0_m00_axi_ARLOCK),
        .M00_AXI_arprot(axi_interconnect_0_m00_axi_ARPROT),
        .M00_AXI_arqos(axi_interconnect_0_m00_axi_ARQOS),
        .M00_AXI_arready(axi_interconnect_0_m00_axi_ARREADY),
        .M00_AXI_arsize(axi_interconnect_0_m00_axi_ARSIZE),
        .M00_AXI_arvalid(axi_interconnect_0_m00_axi_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_0_m00_axi_AWADDR),
        .M00_AXI_awburst(axi_interconnect_0_m00_axi_AWBURST),
        .M00_AXI_awcache(axi_interconnect_0_m00_axi_AWCACHE),
        .M00_AXI_awid(axi_interconnect_0_m00_axi_AWID),
        .M00_AXI_awlen(axi_interconnect_0_m00_axi_AWLEN),
        .M00_AXI_awlock(axi_interconnect_0_m00_axi_AWLOCK),
        .M00_AXI_awprot(axi_interconnect_0_m00_axi_AWPROT),
        .M00_AXI_awqos(axi_interconnect_0_m00_axi_AWQOS),
        .M00_AXI_awready(axi_interconnect_0_m00_axi_AWREADY),
        .M00_AXI_awsize(axi_interconnect_0_m00_axi_AWSIZE),
        .M00_AXI_awvalid(axi_interconnect_0_m00_axi_AWVALID),
        .M00_AXI_bid(axi_interconnect_0_m00_axi_BID),
        .M00_AXI_bready(axi_interconnect_0_m00_axi_BREADY),
        .M00_AXI_bresp(axi_interconnect_0_m00_axi_BRESP),
        .M00_AXI_bvalid(axi_interconnect_0_m00_axi_BVALID),
        .M00_AXI_rdata(axi_interconnect_0_m00_axi_RDATA),
        .M00_AXI_rid(axi_interconnect_0_m00_axi_RID),
        .M00_AXI_rlast(axi_interconnect_0_m00_axi_RLAST),
        .M00_AXI_rready(axi_interconnect_0_m00_axi_RREADY),
        .M00_AXI_rresp(axi_interconnect_0_m00_axi_RRESP),
        .M00_AXI_rvalid(axi_interconnect_0_m00_axi_RVALID),
        .M00_AXI_wdata(axi_interconnect_0_m00_axi_WDATA),
        .M00_AXI_wid(axi_interconnect_0_m00_axi_WID),
        .M00_AXI_wlast(axi_interconnect_0_m00_axi_WLAST),
        .M00_AXI_wready(axi_interconnect_0_m00_axi_WREADY),
        .M00_AXI_wstrb(axi_interconnect_0_m00_axi_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_0_m00_axi_WVALID),
        .S00_ACLK(processing_system7_0_fclk_clk0),
        .S00_ARESETN(processing_system7_0_fclk_reset0_n),
        .S00_AXI_araddr(s00_axi_1_ARADDR),
        .S00_AXI_arburst(s00_axi_1_ARBURST),
        .S00_AXI_arcache(s00_axi_1_ARCACHE),
        .S00_AXI_arid(s00_axi_1_ARID),
        .S00_AXI_arlen(s00_axi_1_ARLEN),
        .S00_AXI_arlock(s00_axi_1_ARLOCK),
        .S00_AXI_arprot(s00_axi_1_ARPROT),
        .S00_AXI_arqos(s00_axi_1_ARQOS),
        .S00_AXI_arready(s00_axi_1_ARREADY),
        .S00_AXI_arsize(s00_axi_1_ARSIZE),
        .S00_AXI_arvalid(s00_axi_1_ARVALID),
        .S00_AXI_awaddr(s00_axi_1_AWADDR),
        .S00_AXI_awburst(s00_axi_1_AWBURST),
        .S00_AXI_awcache(s00_axi_1_AWCACHE),
        .S00_AXI_awid(s00_axi_1_AWID),
        .S00_AXI_awlen(s00_axi_1_AWLEN),
        .S00_AXI_awlock(s00_axi_1_AWLOCK),
        .S00_AXI_awprot(s00_axi_1_AWPROT),
        .S00_AXI_awqos(s00_axi_1_AWQOS),
        .S00_AXI_awready(s00_axi_1_AWREADY),
        .S00_AXI_awsize(s00_axi_1_AWSIZE),
        .S00_AXI_awvalid(s00_axi_1_AWVALID),
        .S00_AXI_bid(s00_axi_1_BID),
        .S00_AXI_bready(s00_axi_1_BREADY),
        .S00_AXI_bresp(s00_axi_1_BRESP),
        .S00_AXI_bvalid(s00_axi_1_BVALID),
        .S00_AXI_rdata(s00_axi_1_RDATA),
        .S00_AXI_rid(s00_axi_1_RID),
        .S00_AXI_rlast(s00_axi_1_RLAST),
        .S00_AXI_rready(s00_axi_1_RREADY),
        .S00_AXI_rresp(s00_axi_1_RRESP),
        .S00_AXI_rvalid(s00_axi_1_RVALID),
        .S00_AXI_wdata(s00_axi_1_WDATA),
        .S00_AXI_wid(s00_axi_1_WID),
        .S00_AXI_wlast(s00_axi_1_WLAST),
        .S00_AXI_wready(s00_axi_1_WREADY),
        .S00_AXI_wstrb(s00_axi_1_WSTRB),
        .S00_AXI_wvalid(s00_axi_1_WVALID));
soc_miner_io_axi_interconnect_1_1 axi_interconnect_1
       (.ACLK(processing_system7_0_fclk_clk0),
        .ARESETN(processing_system7_0_fclk_reset0_n),
        .M00_ACLK(processing_system7_0_fclk_clk0),
        .M00_ARESETN(processing_system7_0_fclk_reset0_n),
        .M00_AXI_araddr(axi_interconnect_1_m00_axi_ARADDR),
        .M00_AXI_arburst(axi_interconnect_1_m00_axi_ARBURST),
        .M00_AXI_arcache(axi_interconnect_1_m00_axi_ARCACHE),
        .M00_AXI_arid(axi_interconnect_1_m00_axi_ARID),
        .M00_AXI_arlen(axi_interconnect_1_m00_axi_ARLEN),
        .M00_AXI_arlock(axi_interconnect_1_m00_axi_ARLOCK),
        .M00_AXI_arprot(axi_interconnect_1_m00_axi_ARPROT),
        .M00_AXI_arqos(axi_interconnect_1_m00_axi_ARQOS),
        .M00_AXI_arready(axi_interconnect_1_m00_axi_ARREADY),
        .M00_AXI_arsize(axi_interconnect_1_m00_axi_ARSIZE),
        .M00_AXI_arvalid(axi_interconnect_1_m00_axi_ARVALID),
        .M00_AXI_awaddr(axi_interconnect_1_m00_axi_AWADDR),
        .M00_AXI_awburst(axi_interconnect_1_m00_axi_AWBURST),
        .M00_AXI_awcache(axi_interconnect_1_m00_axi_AWCACHE),
        .M00_AXI_awid(axi_interconnect_1_m00_axi_AWID),
        .M00_AXI_awlen(axi_interconnect_1_m00_axi_AWLEN),
        .M00_AXI_awlock(axi_interconnect_1_m00_axi_AWLOCK),
        .M00_AXI_awprot(axi_interconnect_1_m00_axi_AWPROT),
        .M00_AXI_awqos(axi_interconnect_1_m00_axi_AWQOS),
        .M00_AXI_awready(axi_interconnect_1_m00_axi_AWREADY),
        .M00_AXI_awsize(axi_interconnect_1_m00_axi_AWSIZE),
        .M00_AXI_awvalid(axi_interconnect_1_m00_axi_AWVALID),
        .M00_AXI_bid(axi_interconnect_1_m00_axi_BID),
        .M00_AXI_bready(axi_interconnect_1_m00_axi_BREADY),
        .M00_AXI_bresp(axi_interconnect_1_m00_axi_BRESP),
        .M00_AXI_bvalid(axi_interconnect_1_m00_axi_BVALID),
        .M00_AXI_rdata(axi_interconnect_1_m00_axi_RDATA),
        .M00_AXI_rid(axi_interconnect_1_m00_axi_RID),
        .M00_AXI_rlast(axi_interconnect_1_m00_axi_RLAST),
        .M00_AXI_rready(axi_interconnect_1_m00_axi_RREADY),
        .M00_AXI_rresp(axi_interconnect_1_m00_axi_RRESP),
        .M00_AXI_rvalid(axi_interconnect_1_m00_axi_RVALID),
        .M00_AXI_wdata(axi_interconnect_1_m00_axi_WDATA),
        .M00_AXI_wid(axi_interconnect_1_m00_axi_WID),
        .M00_AXI_wlast(axi_interconnect_1_m00_axi_WLAST),
        .M00_AXI_wready(axi_interconnect_1_m00_axi_WREADY),
        .M00_AXI_wstrb(axi_interconnect_1_m00_axi_WSTRB),
        .M00_AXI_wvalid(axi_interconnect_1_m00_axi_WVALID),
        .S00_ACLK(processing_system7_0_fclk_clk0),
        .S00_ARESETN(processing_system7_0_fclk_reset0_n),
        .S00_AXI_araddr(processing_system7_0_m_axi_gp0_ARADDR),
        .S00_AXI_arburst(processing_system7_0_m_axi_gp0_ARBURST),
        .S00_AXI_arcache(processing_system7_0_m_axi_gp0_ARCACHE),
        .S00_AXI_arid(processing_system7_0_m_axi_gp0_ARID),
        .S00_AXI_arlen(processing_system7_0_m_axi_gp0_ARLEN),
        .S00_AXI_arlock(processing_system7_0_m_axi_gp0_ARLOCK),
        .S00_AXI_arprot(processing_system7_0_m_axi_gp0_ARPROT),
        .S00_AXI_arqos(processing_system7_0_m_axi_gp0_ARQOS),
        .S00_AXI_arready(processing_system7_0_m_axi_gp0_ARREADY),
        .S00_AXI_arsize(processing_system7_0_m_axi_gp0_ARSIZE),
        .S00_AXI_arvalid(processing_system7_0_m_axi_gp0_ARVALID),
        .S00_AXI_awaddr(processing_system7_0_m_axi_gp0_AWADDR),
        .S00_AXI_awburst(processing_system7_0_m_axi_gp0_AWBURST),
        .S00_AXI_awcache(processing_system7_0_m_axi_gp0_AWCACHE),
        .S00_AXI_awid(processing_system7_0_m_axi_gp0_AWID),
        .S00_AXI_awlen(processing_system7_0_m_axi_gp0_AWLEN),
        .S00_AXI_awlock(processing_system7_0_m_axi_gp0_AWLOCK),
        .S00_AXI_awprot(processing_system7_0_m_axi_gp0_AWPROT),
        .S00_AXI_awqos(processing_system7_0_m_axi_gp0_AWQOS),
        .S00_AXI_awready(processing_system7_0_m_axi_gp0_AWREADY),
        .S00_AXI_awsize(processing_system7_0_m_axi_gp0_AWSIZE),
        .S00_AXI_awvalid(processing_system7_0_m_axi_gp0_AWVALID),
        .S00_AXI_bid(processing_system7_0_m_axi_gp0_BID),
        .S00_AXI_bready(processing_system7_0_m_axi_gp0_BREADY),
        .S00_AXI_bresp(processing_system7_0_m_axi_gp0_BRESP),
        .S00_AXI_bvalid(processing_system7_0_m_axi_gp0_BVALID),
        .S00_AXI_rdata(processing_system7_0_m_axi_gp0_RDATA),
        .S00_AXI_rid(processing_system7_0_m_axi_gp0_RID),
        .S00_AXI_rlast(processing_system7_0_m_axi_gp0_RLAST),
        .S00_AXI_rready(processing_system7_0_m_axi_gp0_RREADY),
        .S00_AXI_rresp(processing_system7_0_m_axi_gp0_RRESP),
        .S00_AXI_rvalid(processing_system7_0_m_axi_gp0_RVALID),
        .S00_AXI_wdata(processing_system7_0_m_axi_gp0_WDATA),
        .S00_AXI_wid(processing_system7_0_m_axi_gp0_WID),
        .S00_AXI_wlast(processing_system7_0_m_axi_gp0_WLAST),
        .S00_AXI_wready(processing_system7_0_m_axi_gp0_WREADY),
        .S00_AXI_wstrb(processing_system7_0_m_axi_gp0_WSTRB),
        .S00_AXI_wvalid(processing_system7_0_m_axi_gp0_WVALID));
soc_miner_io_processing_system7_0_0 processing_system7_0
       (.DDR_Addr(DDR_addr[14:0]),
        .DDR_BankAddr(DDR_ba[2:0]),
        .DDR_CAS_n(DDR_cas_n),
        .DDR_CKE(DDR_cke),
        .DDR_CS_n(DDR_cs_n),
        .DDR_Clk(DDR_ck_p),
        .DDR_Clk_n(DDR_ck_n),
        .DDR_DM(DDR_dm[3:0]),
        .DDR_DQ(DDR_dq[31:0]),
        .DDR_DQS(DDR_dqs_p[3:0]),
        .DDR_DQS_n(DDR_dqs_n[3:0]),
        .DDR_DRSTB(DDR_reset_n),
        .DDR_ODT(DDR_odt),
        .DDR_RAS_n(DDR_ras_n),
        .DDR_VRN(FIXED_IO_ddr_vrn),
        .DDR_VRP(FIXED_IO_ddr_vrp),
        .DDR_WEB(DDR_we_n),
        .FCLK_CLK0(processing_system7_0_fclk_clk0),
        .FCLK_RESET0_N(processing_system7_0_fclk_reset0_n),
        .MIO(FIXED_IO_mio[53:0]),
        .M_AXI_GP0_ACLK(processing_system7_0_fclk_clk0),
        .M_AXI_GP0_ARADDR(processing_system7_0_m_axi_gp0_ARADDR),
        .M_AXI_GP0_ARBURST(processing_system7_0_m_axi_gp0_ARBURST),
        .M_AXI_GP0_ARCACHE(processing_system7_0_m_axi_gp0_ARCACHE),
        .M_AXI_GP0_ARID(processing_system7_0_m_axi_gp0_ARID),
        .M_AXI_GP0_ARLEN(processing_system7_0_m_axi_gp0_ARLEN),
        .M_AXI_GP0_ARLOCK(processing_system7_0_m_axi_gp0_ARLOCK),
        .M_AXI_GP0_ARPROT(processing_system7_0_m_axi_gp0_ARPROT),
        .M_AXI_GP0_ARQOS(processing_system7_0_m_axi_gp0_ARQOS),
        .M_AXI_GP0_ARREADY(processing_system7_0_m_axi_gp0_ARREADY),
        .M_AXI_GP0_ARSIZE(processing_system7_0_m_axi_gp0_ARSIZE),
        .M_AXI_GP0_ARVALID(processing_system7_0_m_axi_gp0_ARVALID),
        .M_AXI_GP0_AWADDR(processing_system7_0_m_axi_gp0_AWADDR),
        .M_AXI_GP0_AWBURST(processing_system7_0_m_axi_gp0_AWBURST),
        .M_AXI_GP0_AWCACHE(processing_system7_0_m_axi_gp0_AWCACHE),
        .M_AXI_GP0_AWID(processing_system7_0_m_axi_gp0_AWID),
        .M_AXI_GP0_AWLEN(processing_system7_0_m_axi_gp0_AWLEN),
        .M_AXI_GP0_AWLOCK(processing_system7_0_m_axi_gp0_AWLOCK),
        .M_AXI_GP0_AWPROT(processing_system7_0_m_axi_gp0_AWPROT),
        .M_AXI_GP0_AWQOS(processing_system7_0_m_axi_gp0_AWQOS),
        .M_AXI_GP0_AWREADY(processing_system7_0_m_axi_gp0_AWREADY),
        .M_AXI_GP0_AWSIZE(processing_system7_0_m_axi_gp0_AWSIZE),
        .M_AXI_GP0_AWVALID(processing_system7_0_m_axi_gp0_AWVALID),
        .M_AXI_GP0_BID(processing_system7_0_m_axi_gp0_BID),
        .M_AXI_GP0_BREADY(processing_system7_0_m_axi_gp0_BREADY),
        .M_AXI_GP0_BRESP(processing_system7_0_m_axi_gp0_BRESP),
        .M_AXI_GP0_BVALID(processing_system7_0_m_axi_gp0_BVALID),
        .M_AXI_GP0_RDATA(processing_system7_0_m_axi_gp0_RDATA),
        .M_AXI_GP0_RID(processing_system7_0_m_axi_gp0_RID),
        .M_AXI_GP0_RLAST(processing_system7_0_m_axi_gp0_RLAST),
        .M_AXI_GP0_RREADY(processing_system7_0_m_axi_gp0_RREADY),
        .M_AXI_GP0_RRESP(processing_system7_0_m_axi_gp0_RRESP),
        .M_AXI_GP0_RVALID(processing_system7_0_m_axi_gp0_RVALID),
        .M_AXI_GP0_WDATA(processing_system7_0_m_axi_gp0_WDATA),
        .M_AXI_GP0_WID(processing_system7_0_m_axi_gp0_WID),
        .M_AXI_GP0_WLAST(processing_system7_0_m_axi_gp0_WLAST),
        .M_AXI_GP0_WREADY(processing_system7_0_m_axi_gp0_WREADY),
        .M_AXI_GP0_WSTRB(processing_system7_0_m_axi_gp0_WSTRB),
        .M_AXI_GP0_WVALID(processing_system7_0_m_axi_gp0_WVALID),
        .PS_CLK(FIXED_IO_ps_clk),
        .PS_PORB(FIXED_IO_ps_porb),
        .PS_SRSTB(FIXED_IO_ps_srstb),
        .S_AXI_HP0_ACLK(processing_system7_0_fclk_clk0),
        .S_AXI_HP0_ARADDR(axi_interconnect_0_m00_axi_ARADDR),
        .S_AXI_HP0_ARBURST(axi_interconnect_0_m00_axi_ARBURST),
        .S_AXI_HP0_ARCACHE(axi_interconnect_0_m00_axi_ARCACHE),
        .S_AXI_HP0_ARID(axi_interconnect_0_m00_axi_ARID),
        .S_AXI_HP0_ARLEN(axi_interconnect_0_m00_axi_ARLEN),
        .S_AXI_HP0_ARLOCK(axi_interconnect_0_m00_axi_ARLOCK),
        .S_AXI_HP0_ARPROT(axi_interconnect_0_m00_axi_ARPROT),
        .S_AXI_HP0_ARQOS(axi_interconnect_0_m00_axi_ARQOS),
        .S_AXI_HP0_ARREADY(axi_interconnect_0_m00_axi_ARREADY),
        .S_AXI_HP0_ARSIZE(axi_interconnect_0_m00_axi_ARSIZE),
        .S_AXI_HP0_ARVALID(axi_interconnect_0_m00_axi_ARVALID),
        .S_AXI_HP0_AWADDR(axi_interconnect_0_m00_axi_AWADDR),
        .S_AXI_HP0_AWBURST(axi_interconnect_0_m00_axi_AWBURST),
        .S_AXI_HP0_AWCACHE(axi_interconnect_0_m00_axi_AWCACHE),
        .S_AXI_HP0_AWID(axi_interconnect_0_m00_axi_AWID),
        .S_AXI_HP0_AWLEN(axi_interconnect_0_m00_axi_AWLEN),
        .S_AXI_HP0_AWLOCK(axi_interconnect_0_m00_axi_AWLOCK),
        .S_AXI_HP0_AWPROT(axi_interconnect_0_m00_axi_AWPROT),
        .S_AXI_HP0_AWQOS(axi_interconnect_0_m00_axi_AWQOS),
        .S_AXI_HP0_AWREADY(axi_interconnect_0_m00_axi_AWREADY),
        .S_AXI_HP0_AWSIZE(axi_interconnect_0_m00_axi_AWSIZE),
        .S_AXI_HP0_AWVALID(axi_interconnect_0_m00_axi_AWVALID),
        .S_AXI_HP0_BID(axi_interconnect_0_m00_axi_BID),
        .S_AXI_HP0_BREADY(axi_interconnect_0_m00_axi_BREADY),
        .S_AXI_HP0_BRESP(axi_interconnect_0_m00_axi_BRESP),
        .S_AXI_HP0_BVALID(axi_interconnect_0_m00_axi_BVALID),
        .S_AXI_HP0_RDATA(axi_interconnect_0_m00_axi_RDATA),
        .S_AXI_HP0_RDISSUECAP1_EN(GND_1),
        .S_AXI_HP0_RID(axi_interconnect_0_m00_axi_RID),
        .S_AXI_HP0_RLAST(axi_interconnect_0_m00_axi_RLAST),
        .S_AXI_HP0_RREADY(axi_interconnect_0_m00_axi_RREADY),
        .S_AXI_HP0_RRESP(axi_interconnect_0_m00_axi_RRESP),
        .S_AXI_HP0_RVALID(axi_interconnect_0_m00_axi_RVALID),
        .S_AXI_HP0_WDATA(axi_interconnect_0_m00_axi_WDATA),
        .S_AXI_HP0_WID(axi_interconnect_0_m00_axi_WID),
        .S_AXI_HP0_WLAST(axi_interconnect_0_m00_axi_WLAST),
        .S_AXI_HP0_WREADY(axi_interconnect_0_m00_axi_WREADY),
        .S_AXI_HP0_WRISSUECAP1_EN(GND_1),
        .S_AXI_HP0_WSTRB(axi_interconnect_0_m00_axi_WSTRB),
        .S_AXI_HP0_WVALID(axi_interconnect_0_m00_axi_WVALID),
        .TTC0_CLK0_IN(GND_1),
        .TTC0_CLK1_IN(GND_1),
        .TTC0_CLK2_IN(GND_1),
        .USB0_VBUS_PWRFAULT(GND_1));
endmodule

module soc_miner_io_axi_interconnect_0_0
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [5:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [5:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [5:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [63:0]M00_AXI_rdata;
  input [5:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [63:0]M00_AXI_wdata;
  output [5:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [7:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [5:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [5:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [5:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [63:0]S00_AXI_rdata;
  output [5:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [63:0]S00_AXI_wdata;
  input [5:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [7:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire axi_interconnect_0_ACLK_net;
  wire axi_interconnect_0_ARESETN_net;
  wire [31:0]axi_interconnect_0_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARCACHE;
  wire [5:0]axi_interconnect_0_to_s00_couplers_ARID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_ARQOS;
  wire axi_interconnect_0_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_ARSIZE;
  wire axi_interconnect_0_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_0_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWCACHE;
  wire [5:0]axi_interconnect_0_to_s00_couplers_AWID;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWLEN;
  wire [1:0]axi_interconnect_0_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_0_to_s00_couplers_AWQOS;
  wire axi_interconnect_0_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_0_to_s00_couplers_AWSIZE;
  wire axi_interconnect_0_to_s00_couplers_AWVALID;
  wire [5:0]axi_interconnect_0_to_s00_couplers_BID;
  wire axi_interconnect_0_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_BRESP;
  wire axi_interconnect_0_to_s00_couplers_BVALID;
  wire [63:0]axi_interconnect_0_to_s00_couplers_RDATA;
  wire [5:0]axi_interconnect_0_to_s00_couplers_RID;
  wire axi_interconnect_0_to_s00_couplers_RLAST;
  wire axi_interconnect_0_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_0_to_s00_couplers_RRESP;
  wire axi_interconnect_0_to_s00_couplers_RVALID;
  wire [63:0]axi_interconnect_0_to_s00_couplers_WDATA;
  wire [5:0]axi_interconnect_0_to_s00_couplers_WID;
  wire axi_interconnect_0_to_s00_couplers_WLAST;
  wire axi_interconnect_0_to_s00_couplers_WREADY;
  wire [7:0]axi_interconnect_0_to_s00_couplers_WSTRB;
  wire axi_interconnect_0_to_s00_couplers_WVALID;
  wire s00_aclk_1;
  wire s00_aresetn_1;
  wire [31:0]s00_couplers_to_axi_interconnect_0_ARADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_0_ARBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_0_ARCACHE;
  wire [5:0]s00_couplers_to_axi_interconnect_0_ARID;
  wire [3:0]s00_couplers_to_axi_interconnect_0_ARLEN;
  wire [1:0]s00_couplers_to_axi_interconnect_0_ARLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_0_ARPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_0_ARQOS;
  wire s00_couplers_to_axi_interconnect_0_ARREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_0_ARSIZE;
  wire s00_couplers_to_axi_interconnect_0_ARVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_0_AWADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_0_AWBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_0_AWCACHE;
  wire [5:0]s00_couplers_to_axi_interconnect_0_AWID;
  wire [3:0]s00_couplers_to_axi_interconnect_0_AWLEN;
  wire [1:0]s00_couplers_to_axi_interconnect_0_AWLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_0_AWPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_0_AWQOS;
  wire s00_couplers_to_axi_interconnect_0_AWREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_0_AWSIZE;
  wire s00_couplers_to_axi_interconnect_0_AWVALID;
  wire [5:0]s00_couplers_to_axi_interconnect_0_BID;
  wire s00_couplers_to_axi_interconnect_0_BREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_0_BRESP;
  wire s00_couplers_to_axi_interconnect_0_BVALID;
  wire [63:0]s00_couplers_to_axi_interconnect_0_RDATA;
  wire [5:0]s00_couplers_to_axi_interconnect_0_RID;
  wire s00_couplers_to_axi_interconnect_0_RLAST;
  wire s00_couplers_to_axi_interconnect_0_RREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_0_RRESP;
  wire s00_couplers_to_axi_interconnect_0_RVALID;
  wire [63:0]s00_couplers_to_axi_interconnect_0_WDATA;
  wire [5:0]s00_couplers_to_axi_interconnect_0_WID;
  wire s00_couplers_to_axi_interconnect_0_WLAST;
  wire s00_couplers_to_axi_interconnect_0_WREADY;
  wire [7:0]s00_couplers_to_axi_interconnect_0_WSTRB;
  wire s00_couplers_to_axi_interconnect_0_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_interconnect_0_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_interconnect_0_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_interconnect_0_ARCACHE;
  assign M00_AXI_arid[5:0] = s00_couplers_to_axi_interconnect_0_ARID;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_interconnect_0_ARLEN;
  assign M00_AXI_arlock[1:0] = s00_couplers_to_axi_interconnect_0_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_interconnect_0_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_interconnect_0_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_interconnect_0_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_interconnect_0_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_interconnect_0_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_interconnect_0_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_interconnect_0_AWCACHE;
  assign M00_AXI_awid[5:0] = s00_couplers_to_axi_interconnect_0_AWID;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_interconnect_0_AWLEN;
  assign M00_AXI_awlock[1:0] = s00_couplers_to_axi_interconnect_0_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_interconnect_0_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_axi_interconnect_0_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_interconnect_0_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_interconnect_0_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_interconnect_0_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_interconnect_0_RREADY;
  assign M00_AXI_wdata[63:0] = s00_couplers_to_axi_interconnect_0_WDATA;
  assign M00_AXI_wid[5:0] = s00_couplers_to_axi_interconnect_0_WID;
  assign M00_AXI_wlast = s00_couplers_to_axi_interconnect_0_WLAST;
  assign M00_AXI_wstrb[7:0] = s00_couplers_to_axi_interconnect_0_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_interconnect_0_WVALID;
  assign S00_AXI_arready = axi_interconnect_0_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_0_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[5:0] = axi_interconnect_0_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_0_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_0_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[63:0] = axi_interconnect_0_to_s00_couplers_RDATA;
  assign S00_AXI_rid[5:0] = axi_interconnect_0_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_0_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_0_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_0_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_0_to_s00_couplers_WREADY;
  assign axi_interconnect_0_ACLK_net = M00_ACLK;
  assign axi_interconnect_0_ARESETN_net = M00_ARESETN;
  assign axi_interconnect_0_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARID = S00_AXI_arid[5:0];
  assign axi_interconnect_0_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_0_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_0_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWID = S00_AXI_awid[5:0];
  assign axi_interconnect_0_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_interconnect_0_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_0_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_0_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_0_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_0_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_0_to_s00_couplers_WDATA = S00_AXI_wdata[63:0];
  assign axi_interconnect_0_to_s00_couplers_WID = S00_AXI_wid[5:0];
  assign axi_interconnect_0_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_0_to_s00_couplers_WSTRB = S00_AXI_wstrb[7:0];
  assign axi_interconnect_0_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_aclk_1 = S00_ACLK;
  assign s00_aresetn_1 = S00_ARESETN;
  assign s00_couplers_to_axi_interconnect_0_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_interconnect_0_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_interconnect_0_BID = M00_AXI_bid[5:0];
  assign s00_couplers_to_axi_interconnect_0_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_interconnect_0_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_interconnect_0_RDATA = M00_AXI_rdata[63:0];
  assign s00_couplers_to_axi_interconnect_0_RID = M00_AXI_rid[5:0];
  assign s00_couplers_to_axi_interconnect_0_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_interconnect_0_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_interconnect_0_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_interconnect_0_WREADY = M00_AXI_wready;
s00_couplers_imp_1FHMR11 s00_couplers
       (.M_ACLK(axi_interconnect_0_ACLK_net),
        .M_ARESETN(axi_interconnect_0_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_interconnect_0_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_interconnect_0_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_interconnect_0_ARCACHE),
        .M_AXI_arid(s00_couplers_to_axi_interconnect_0_ARID),
        .M_AXI_arlen(s00_couplers_to_axi_interconnect_0_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_interconnect_0_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_interconnect_0_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_interconnect_0_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_interconnect_0_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_interconnect_0_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_interconnect_0_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_interconnect_0_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_interconnect_0_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_interconnect_0_AWCACHE),
        .M_AXI_awid(s00_couplers_to_axi_interconnect_0_AWID),
        .M_AXI_awlen(s00_couplers_to_axi_interconnect_0_AWLEN),
        .M_AXI_awlock(s00_couplers_to_axi_interconnect_0_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_axi_interconnect_0_AWPROT),
        .M_AXI_awqos(s00_couplers_to_axi_interconnect_0_AWQOS),
        .M_AXI_awready(s00_couplers_to_axi_interconnect_0_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_interconnect_0_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_interconnect_0_AWVALID),
        .M_AXI_bid(s00_couplers_to_axi_interconnect_0_BID),
        .M_AXI_bready(s00_couplers_to_axi_interconnect_0_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_interconnect_0_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_interconnect_0_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_interconnect_0_RDATA),
        .M_AXI_rid(s00_couplers_to_axi_interconnect_0_RID),
        .M_AXI_rlast(s00_couplers_to_axi_interconnect_0_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_interconnect_0_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_interconnect_0_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_interconnect_0_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_interconnect_0_WDATA),
        .M_AXI_wid(s00_couplers_to_axi_interconnect_0_WID),
        .M_AXI_wlast(s00_couplers_to_axi_interconnect_0_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_interconnect_0_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_interconnect_0_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_interconnect_0_WVALID),
        .S_ACLK(s00_aclk_1),
        .S_ARESETN(s00_aresetn_1),
        .S_AXI_araddr(axi_interconnect_0_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_0_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_0_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_0_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_0_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_0_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_0_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_0_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_0_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_0_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_0_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_0_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_0_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_0_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_0_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_0_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_0_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_0_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_0_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_0_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_0_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_0_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_0_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_0_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_0_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_0_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_0_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_0_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_0_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_0_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_0_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_0_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_0_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_interconnect_0_to_s00_couplers_WID),
        .S_AXI_wlast(axi_interconnect_0_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_0_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_0_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_0_to_s00_couplers_WVALID));
endmodule

module soc_miner_io_axi_interconnect_1_1
   (ACLK,
    ARESETN,
    M00_ACLK,
    M00_ARESETN,
    M00_AXI_araddr,
    M00_AXI_arburst,
    M00_AXI_arcache,
    M00_AXI_arid,
    M00_AXI_arlen,
    M00_AXI_arlock,
    M00_AXI_arprot,
    M00_AXI_arqos,
    M00_AXI_arready,
    M00_AXI_arsize,
    M00_AXI_arvalid,
    M00_AXI_awaddr,
    M00_AXI_awburst,
    M00_AXI_awcache,
    M00_AXI_awid,
    M00_AXI_awlen,
    M00_AXI_awlock,
    M00_AXI_awprot,
    M00_AXI_awqos,
    M00_AXI_awready,
    M00_AXI_awsize,
    M00_AXI_awvalid,
    M00_AXI_bid,
    M00_AXI_bready,
    M00_AXI_bresp,
    M00_AXI_bvalid,
    M00_AXI_rdata,
    M00_AXI_rid,
    M00_AXI_rlast,
    M00_AXI_rready,
    M00_AXI_rresp,
    M00_AXI_rvalid,
    M00_AXI_wdata,
    M00_AXI_wid,
    M00_AXI_wlast,
    M00_AXI_wready,
    M00_AXI_wstrb,
    M00_AXI_wvalid,
    S00_ACLK,
    S00_ARESETN,
    S00_AXI_araddr,
    S00_AXI_arburst,
    S00_AXI_arcache,
    S00_AXI_arid,
    S00_AXI_arlen,
    S00_AXI_arlock,
    S00_AXI_arprot,
    S00_AXI_arqos,
    S00_AXI_arready,
    S00_AXI_arsize,
    S00_AXI_arvalid,
    S00_AXI_awaddr,
    S00_AXI_awburst,
    S00_AXI_awcache,
    S00_AXI_awid,
    S00_AXI_awlen,
    S00_AXI_awlock,
    S00_AXI_awprot,
    S00_AXI_awqos,
    S00_AXI_awready,
    S00_AXI_awsize,
    S00_AXI_awvalid,
    S00_AXI_bid,
    S00_AXI_bready,
    S00_AXI_bresp,
    S00_AXI_bvalid,
    S00_AXI_rdata,
    S00_AXI_rid,
    S00_AXI_rlast,
    S00_AXI_rready,
    S00_AXI_rresp,
    S00_AXI_rvalid,
    S00_AXI_wdata,
    S00_AXI_wid,
    S00_AXI_wlast,
    S00_AXI_wready,
    S00_AXI_wstrb,
    S00_AXI_wvalid);
  input ACLK;
  input ARESETN;
  input M00_ACLK;
  input M00_ARESETN;
  output [31:0]M00_AXI_araddr;
  output [1:0]M00_AXI_arburst;
  output [3:0]M00_AXI_arcache;
  output [11:0]M00_AXI_arid;
  output [3:0]M00_AXI_arlen;
  output [1:0]M00_AXI_arlock;
  output [2:0]M00_AXI_arprot;
  output [3:0]M00_AXI_arqos;
  input M00_AXI_arready;
  output [2:0]M00_AXI_arsize;
  output M00_AXI_arvalid;
  output [31:0]M00_AXI_awaddr;
  output [1:0]M00_AXI_awburst;
  output [3:0]M00_AXI_awcache;
  output [11:0]M00_AXI_awid;
  output [3:0]M00_AXI_awlen;
  output [1:0]M00_AXI_awlock;
  output [2:0]M00_AXI_awprot;
  output [3:0]M00_AXI_awqos;
  input M00_AXI_awready;
  output [2:0]M00_AXI_awsize;
  output M00_AXI_awvalid;
  input [11:0]M00_AXI_bid;
  output M00_AXI_bready;
  input [1:0]M00_AXI_bresp;
  input M00_AXI_bvalid;
  input [31:0]M00_AXI_rdata;
  input [11:0]M00_AXI_rid;
  input M00_AXI_rlast;
  output M00_AXI_rready;
  input [1:0]M00_AXI_rresp;
  input M00_AXI_rvalid;
  output [31:0]M00_AXI_wdata;
  output [11:0]M00_AXI_wid;
  output M00_AXI_wlast;
  input M00_AXI_wready;
  output [3:0]M00_AXI_wstrb;
  output M00_AXI_wvalid;
  input S00_ACLK;
  input S00_ARESETN;
  input [31:0]S00_AXI_araddr;
  input [1:0]S00_AXI_arburst;
  input [3:0]S00_AXI_arcache;
  input [11:0]S00_AXI_arid;
  input [3:0]S00_AXI_arlen;
  input [1:0]S00_AXI_arlock;
  input [2:0]S00_AXI_arprot;
  input [3:0]S00_AXI_arqos;
  output S00_AXI_arready;
  input [2:0]S00_AXI_arsize;
  input S00_AXI_arvalid;
  input [31:0]S00_AXI_awaddr;
  input [1:0]S00_AXI_awburst;
  input [3:0]S00_AXI_awcache;
  input [11:0]S00_AXI_awid;
  input [3:0]S00_AXI_awlen;
  input [1:0]S00_AXI_awlock;
  input [2:0]S00_AXI_awprot;
  input [3:0]S00_AXI_awqos;
  output S00_AXI_awready;
  input [2:0]S00_AXI_awsize;
  input S00_AXI_awvalid;
  output [11:0]S00_AXI_bid;
  input S00_AXI_bready;
  output [1:0]S00_AXI_bresp;
  output S00_AXI_bvalid;
  output [31:0]S00_AXI_rdata;
  output [11:0]S00_AXI_rid;
  output S00_AXI_rlast;
  input S00_AXI_rready;
  output [1:0]S00_AXI_rresp;
  output S00_AXI_rvalid;
  input [31:0]S00_AXI_wdata;
  input [11:0]S00_AXI_wid;
  input S00_AXI_wlast;
  output S00_AXI_wready;
  input [3:0]S00_AXI_wstrb;
  input S00_AXI_wvalid;

  wire axi_interconnect_1_ACLK_net;
  wire axi_interconnect_1_ARESETN_net;
  wire [31:0]axi_interconnect_1_to_s00_couplers_ARADDR;
  wire [1:0]axi_interconnect_1_to_s00_couplers_ARBURST;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARCACHE;
  wire [11:0]axi_interconnect_1_to_s00_couplers_ARID;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARLEN;
  wire [1:0]axi_interconnect_1_to_s00_couplers_ARLOCK;
  wire [2:0]axi_interconnect_1_to_s00_couplers_ARPROT;
  wire [3:0]axi_interconnect_1_to_s00_couplers_ARQOS;
  wire axi_interconnect_1_to_s00_couplers_ARREADY;
  wire [2:0]axi_interconnect_1_to_s00_couplers_ARSIZE;
  wire axi_interconnect_1_to_s00_couplers_ARVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_AWADDR;
  wire [1:0]axi_interconnect_1_to_s00_couplers_AWBURST;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWCACHE;
  wire [11:0]axi_interconnect_1_to_s00_couplers_AWID;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWLEN;
  wire [1:0]axi_interconnect_1_to_s00_couplers_AWLOCK;
  wire [2:0]axi_interconnect_1_to_s00_couplers_AWPROT;
  wire [3:0]axi_interconnect_1_to_s00_couplers_AWQOS;
  wire axi_interconnect_1_to_s00_couplers_AWREADY;
  wire [2:0]axi_interconnect_1_to_s00_couplers_AWSIZE;
  wire axi_interconnect_1_to_s00_couplers_AWVALID;
  wire [11:0]axi_interconnect_1_to_s00_couplers_BID;
  wire axi_interconnect_1_to_s00_couplers_BREADY;
  wire [1:0]axi_interconnect_1_to_s00_couplers_BRESP;
  wire axi_interconnect_1_to_s00_couplers_BVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_RDATA;
  wire [11:0]axi_interconnect_1_to_s00_couplers_RID;
  wire axi_interconnect_1_to_s00_couplers_RLAST;
  wire axi_interconnect_1_to_s00_couplers_RREADY;
  wire [1:0]axi_interconnect_1_to_s00_couplers_RRESP;
  wire axi_interconnect_1_to_s00_couplers_RVALID;
  wire [31:0]axi_interconnect_1_to_s00_couplers_WDATA;
  wire [11:0]axi_interconnect_1_to_s00_couplers_WID;
  wire axi_interconnect_1_to_s00_couplers_WLAST;
  wire axi_interconnect_1_to_s00_couplers_WREADY;
  wire [3:0]axi_interconnect_1_to_s00_couplers_WSTRB;
  wire axi_interconnect_1_to_s00_couplers_WVALID;
  wire s00_aclk_1;
  wire s00_aresetn_1;
  wire [31:0]s00_couplers_to_axi_interconnect_1_ARADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_1_ARBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_1_ARCACHE;
  wire [11:0]s00_couplers_to_axi_interconnect_1_ARID;
  wire [3:0]s00_couplers_to_axi_interconnect_1_ARLEN;
  wire [1:0]s00_couplers_to_axi_interconnect_1_ARLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_1_ARPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_1_ARQOS;
  wire s00_couplers_to_axi_interconnect_1_ARREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_1_ARSIZE;
  wire s00_couplers_to_axi_interconnect_1_ARVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_1_AWADDR;
  wire [1:0]s00_couplers_to_axi_interconnect_1_AWBURST;
  wire [3:0]s00_couplers_to_axi_interconnect_1_AWCACHE;
  wire [11:0]s00_couplers_to_axi_interconnect_1_AWID;
  wire [3:0]s00_couplers_to_axi_interconnect_1_AWLEN;
  wire [1:0]s00_couplers_to_axi_interconnect_1_AWLOCK;
  wire [2:0]s00_couplers_to_axi_interconnect_1_AWPROT;
  wire [3:0]s00_couplers_to_axi_interconnect_1_AWQOS;
  wire s00_couplers_to_axi_interconnect_1_AWREADY;
  wire [2:0]s00_couplers_to_axi_interconnect_1_AWSIZE;
  wire s00_couplers_to_axi_interconnect_1_AWVALID;
  wire [11:0]s00_couplers_to_axi_interconnect_1_BID;
  wire s00_couplers_to_axi_interconnect_1_BREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_1_BRESP;
  wire s00_couplers_to_axi_interconnect_1_BVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_1_RDATA;
  wire [11:0]s00_couplers_to_axi_interconnect_1_RID;
  wire s00_couplers_to_axi_interconnect_1_RLAST;
  wire s00_couplers_to_axi_interconnect_1_RREADY;
  wire [1:0]s00_couplers_to_axi_interconnect_1_RRESP;
  wire s00_couplers_to_axi_interconnect_1_RVALID;
  wire [31:0]s00_couplers_to_axi_interconnect_1_WDATA;
  wire [11:0]s00_couplers_to_axi_interconnect_1_WID;
  wire s00_couplers_to_axi_interconnect_1_WLAST;
  wire s00_couplers_to_axi_interconnect_1_WREADY;
  wire [3:0]s00_couplers_to_axi_interconnect_1_WSTRB;
  wire s00_couplers_to_axi_interconnect_1_WVALID;

  assign M00_AXI_araddr[31:0] = s00_couplers_to_axi_interconnect_1_ARADDR;
  assign M00_AXI_arburst[1:0] = s00_couplers_to_axi_interconnect_1_ARBURST;
  assign M00_AXI_arcache[3:0] = s00_couplers_to_axi_interconnect_1_ARCACHE;
  assign M00_AXI_arid[11:0] = s00_couplers_to_axi_interconnect_1_ARID;
  assign M00_AXI_arlen[3:0] = s00_couplers_to_axi_interconnect_1_ARLEN;
  assign M00_AXI_arlock[1:0] = s00_couplers_to_axi_interconnect_1_ARLOCK;
  assign M00_AXI_arprot[2:0] = s00_couplers_to_axi_interconnect_1_ARPROT;
  assign M00_AXI_arqos[3:0] = s00_couplers_to_axi_interconnect_1_ARQOS;
  assign M00_AXI_arsize[2:0] = s00_couplers_to_axi_interconnect_1_ARSIZE;
  assign M00_AXI_arvalid = s00_couplers_to_axi_interconnect_1_ARVALID;
  assign M00_AXI_awaddr[31:0] = s00_couplers_to_axi_interconnect_1_AWADDR;
  assign M00_AXI_awburst[1:0] = s00_couplers_to_axi_interconnect_1_AWBURST;
  assign M00_AXI_awcache[3:0] = s00_couplers_to_axi_interconnect_1_AWCACHE;
  assign M00_AXI_awid[11:0] = s00_couplers_to_axi_interconnect_1_AWID;
  assign M00_AXI_awlen[3:0] = s00_couplers_to_axi_interconnect_1_AWLEN;
  assign M00_AXI_awlock[1:0] = s00_couplers_to_axi_interconnect_1_AWLOCK;
  assign M00_AXI_awprot[2:0] = s00_couplers_to_axi_interconnect_1_AWPROT;
  assign M00_AXI_awqos[3:0] = s00_couplers_to_axi_interconnect_1_AWQOS;
  assign M00_AXI_awsize[2:0] = s00_couplers_to_axi_interconnect_1_AWSIZE;
  assign M00_AXI_awvalid = s00_couplers_to_axi_interconnect_1_AWVALID;
  assign M00_AXI_bready = s00_couplers_to_axi_interconnect_1_BREADY;
  assign M00_AXI_rready = s00_couplers_to_axi_interconnect_1_RREADY;
  assign M00_AXI_wdata[31:0] = s00_couplers_to_axi_interconnect_1_WDATA;
  assign M00_AXI_wid[11:0] = s00_couplers_to_axi_interconnect_1_WID;
  assign M00_AXI_wlast = s00_couplers_to_axi_interconnect_1_WLAST;
  assign M00_AXI_wstrb[3:0] = s00_couplers_to_axi_interconnect_1_WSTRB;
  assign M00_AXI_wvalid = s00_couplers_to_axi_interconnect_1_WVALID;
  assign S00_AXI_arready = axi_interconnect_1_to_s00_couplers_ARREADY;
  assign S00_AXI_awready = axi_interconnect_1_to_s00_couplers_AWREADY;
  assign S00_AXI_bid[11:0] = axi_interconnect_1_to_s00_couplers_BID;
  assign S00_AXI_bresp[1:0] = axi_interconnect_1_to_s00_couplers_BRESP;
  assign S00_AXI_bvalid = axi_interconnect_1_to_s00_couplers_BVALID;
  assign S00_AXI_rdata[31:0] = axi_interconnect_1_to_s00_couplers_RDATA;
  assign S00_AXI_rid[11:0] = axi_interconnect_1_to_s00_couplers_RID;
  assign S00_AXI_rlast = axi_interconnect_1_to_s00_couplers_RLAST;
  assign S00_AXI_rresp[1:0] = axi_interconnect_1_to_s00_couplers_RRESP;
  assign S00_AXI_rvalid = axi_interconnect_1_to_s00_couplers_RVALID;
  assign S00_AXI_wready = axi_interconnect_1_to_s00_couplers_WREADY;
  assign axi_interconnect_1_ACLK_net = M00_ACLK;
  assign axi_interconnect_1_ARESETN_net = M00_ARESETN;
  assign axi_interconnect_1_to_s00_couplers_ARADDR = S00_AXI_araddr[31:0];
  assign axi_interconnect_1_to_s00_couplers_ARBURST = S00_AXI_arburst[1:0];
  assign axi_interconnect_1_to_s00_couplers_ARCACHE = S00_AXI_arcache[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARID = S00_AXI_arid[11:0];
  assign axi_interconnect_1_to_s00_couplers_ARLEN = S00_AXI_arlen[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARLOCK = S00_AXI_arlock[1:0];
  assign axi_interconnect_1_to_s00_couplers_ARPROT = S00_AXI_arprot[2:0];
  assign axi_interconnect_1_to_s00_couplers_ARQOS = S00_AXI_arqos[3:0];
  assign axi_interconnect_1_to_s00_couplers_ARSIZE = S00_AXI_arsize[2:0];
  assign axi_interconnect_1_to_s00_couplers_ARVALID = S00_AXI_arvalid;
  assign axi_interconnect_1_to_s00_couplers_AWADDR = S00_AXI_awaddr[31:0];
  assign axi_interconnect_1_to_s00_couplers_AWBURST = S00_AXI_awburst[1:0];
  assign axi_interconnect_1_to_s00_couplers_AWCACHE = S00_AXI_awcache[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWID = S00_AXI_awid[11:0];
  assign axi_interconnect_1_to_s00_couplers_AWLEN = S00_AXI_awlen[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWLOCK = S00_AXI_awlock[1:0];
  assign axi_interconnect_1_to_s00_couplers_AWPROT = S00_AXI_awprot[2:0];
  assign axi_interconnect_1_to_s00_couplers_AWQOS = S00_AXI_awqos[3:0];
  assign axi_interconnect_1_to_s00_couplers_AWSIZE = S00_AXI_awsize[2:0];
  assign axi_interconnect_1_to_s00_couplers_AWVALID = S00_AXI_awvalid;
  assign axi_interconnect_1_to_s00_couplers_BREADY = S00_AXI_bready;
  assign axi_interconnect_1_to_s00_couplers_RREADY = S00_AXI_rready;
  assign axi_interconnect_1_to_s00_couplers_WDATA = S00_AXI_wdata[31:0];
  assign axi_interconnect_1_to_s00_couplers_WID = S00_AXI_wid[11:0];
  assign axi_interconnect_1_to_s00_couplers_WLAST = S00_AXI_wlast;
  assign axi_interconnect_1_to_s00_couplers_WSTRB = S00_AXI_wstrb[3:0];
  assign axi_interconnect_1_to_s00_couplers_WVALID = S00_AXI_wvalid;
  assign s00_aclk_1 = S00_ACLK;
  assign s00_aresetn_1 = S00_ARESETN;
  assign s00_couplers_to_axi_interconnect_1_ARREADY = M00_AXI_arready;
  assign s00_couplers_to_axi_interconnect_1_AWREADY = M00_AXI_awready;
  assign s00_couplers_to_axi_interconnect_1_BID = M00_AXI_bid[11:0];
  assign s00_couplers_to_axi_interconnect_1_BRESP = M00_AXI_bresp[1:0];
  assign s00_couplers_to_axi_interconnect_1_BVALID = M00_AXI_bvalid;
  assign s00_couplers_to_axi_interconnect_1_RDATA = M00_AXI_rdata[31:0];
  assign s00_couplers_to_axi_interconnect_1_RID = M00_AXI_rid[11:0];
  assign s00_couplers_to_axi_interconnect_1_RLAST = M00_AXI_rlast;
  assign s00_couplers_to_axi_interconnect_1_RRESP = M00_AXI_rresp[1:0];
  assign s00_couplers_to_axi_interconnect_1_RVALID = M00_AXI_rvalid;
  assign s00_couplers_to_axi_interconnect_1_WREADY = M00_AXI_wready;
s00_couplers_imp_A5QIOZ s00_couplers
       (.M_ACLK(axi_interconnect_1_ACLK_net),
        .M_ARESETN(axi_interconnect_1_ARESETN_net),
        .M_AXI_araddr(s00_couplers_to_axi_interconnect_1_ARADDR),
        .M_AXI_arburst(s00_couplers_to_axi_interconnect_1_ARBURST),
        .M_AXI_arcache(s00_couplers_to_axi_interconnect_1_ARCACHE),
        .M_AXI_arid(s00_couplers_to_axi_interconnect_1_ARID),
        .M_AXI_arlen(s00_couplers_to_axi_interconnect_1_ARLEN),
        .M_AXI_arlock(s00_couplers_to_axi_interconnect_1_ARLOCK),
        .M_AXI_arprot(s00_couplers_to_axi_interconnect_1_ARPROT),
        .M_AXI_arqos(s00_couplers_to_axi_interconnect_1_ARQOS),
        .M_AXI_arready(s00_couplers_to_axi_interconnect_1_ARREADY),
        .M_AXI_arsize(s00_couplers_to_axi_interconnect_1_ARSIZE),
        .M_AXI_arvalid(s00_couplers_to_axi_interconnect_1_ARVALID),
        .M_AXI_awaddr(s00_couplers_to_axi_interconnect_1_AWADDR),
        .M_AXI_awburst(s00_couplers_to_axi_interconnect_1_AWBURST),
        .M_AXI_awcache(s00_couplers_to_axi_interconnect_1_AWCACHE),
        .M_AXI_awid(s00_couplers_to_axi_interconnect_1_AWID),
        .M_AXI_awlen(s00_couplers_to_axi_interconnect_1_AWLEN),
        .M_AXI_awlock(s00_couplers_to_axi_interconnect_1_AWLOCK),
        .M_AXI_awprot(s00_couplers_to_axi_interconnect_1_AWPROT),
        .M_AXI_awqos(s00_couplers_to_axi_interconnect_1_AWQOS),
        .M_AXI_awready(s00_couplers_to_axi_interconnect_1_AWREADY),
        .M_AXI_awsize(s00_couplers_to_axi_interconnect_1_AWSIZE),
        .M_AXI_awvalid(s00_couplers_to_axi_interconnect_1_AWVALID),
        .M_AXI_bid(s00_couplers_to_axi_interconnect_1_BID),
        .M_AXI_bready(s00_couplers_to_axi_interconnect_1_BREADY),
        .M_AXI_bresp(s00_couplers_to_axi_interconnect_1_BRESP),
        .M_AXI_bvalid(s00_couplers_to_axi_interconnect_1_BVALID),
        .M_AXI_rdata(s00_couplers_to_axi_interconnect_1_RDATA),
        .M_AXI_rid(s00_couplers_to_axi_interconnect_1_RID),
        .M_AXI_rlast(s00_couplers_to_axi_interconnect_1_RLAST),
        .M_AXI_rready(s00_couplers_to_axi_interconnect_1_RREADY),
        .M_AXI_rresp(s00_couplers_to_axi_interconnect_1_RRESP),
        .M_AXI_rvalid(s00_couplers_to_axi_interconnect_1_RVALID),
        .M_AXI_wdata(s00_couplers_to_axi_interconnect_1_WDATA),
        .M_AXI_wid(s00_couplers_to_axi_interconnect_1_WID),
        .M_AXI_wlast(s00_couplers_to_axi_interconnect_1_WLAST),
        .M_AXI_wready(s00_couplers_to_axi_interconnect_1_WREADY),
        .M_AXI_wstrb(s00_couplers_to_axi_interconnect_1_WSTRB),
        .M_AXI_wvalid(s00_couplers_to_axi_interconnect_1_WVALID),
        .S_ACLK(s00_aclk_1),
        .S_ARESETN(s00_aresetn_1),
        .S_AXI_araddr(axi_interconnect_1_to_s00_couplers_ARADDR),
        .S_AXI_arburst(axi_interconnect_1_to_s00_couplers_ARBURST),
        .S_AXI_arcache(axi_interconnect_1_to_s00_couplers_ARCACHE),
        .S_AXI_arid(axi_interconnect_1_to_s00_couplers_ARID),
        .S_AXI_arlen(axi_interconnect_1_to_s00_couplers_ARLEN),
        .S_AXI_arlock(axi_interconnect_1_to_s00_couplers_ARLOCK),
        .S_AXI_arprot(axi_interconnect_1_to_s00_couplers_ARPROT),
        .S_AXI_arqos(axi_interconnect_1_to_s00_couplers_ARQOS),
        .S_AXI_arready(axi_interconnect_1_to_s00_couplers_ARREADY),
        .S_AXI_arsize(axi_interconnect_1_to_s00_couplers_ARSIZE),
        .S_AXI_arvalid(axi_interconnect_1_to_s00_couplers_ARVALID),
        .S_AXI_awaddr(axi_interconnect_1_to_s00_couplers_AWADDR),
        .S_AXI_awburst(axi_interconnect_1_to_s00_couplers_AWBURST),
        .S_AXI_awcache(axi_interconnect_1_to_s00_couplers_AWCACHE),
        .S_AXI_awid(axi_interconnect_1_to_s00_couplers_AWID),
        .S_AXI_awlen(axi_interconnect_1_to_s00_couplers_AWLEN),
        .S_AXI_awlock(axi_interconnect_1_to_s00_couplers_AWLOCK),
        .S_AXI_awprot(axi_interconnect_1_to_s00_couplers_AWPROT),
        .S_AXI_awqos(axi_interconnect_1_to_s00_couplers_AWQOS),
        .S_AXI_awready(axi_interconnect_1_to_s00_couplers_AWREADY),
        .S_AXI_awsize(axi_interconnect_1_to_s00_couplers_AWSIZE),
        .S_AXI_awvalid(axi_interconnect_1_to_s00_couplers_AWVALID),
        .S_AXI_bid(axi_interconnect_1_to_s00_couplers_BID),
        .S_AXI_bready(axi_interconnect_1_to_s00_couplers_BREADY),
        .S_AXI_bresp(axi_interconnect_1_to_s00_couplers_BRESP),
        .S_AXI_bvalid(axi_interconnect_1_to_s00_couplers_BVALID),
        .S_AXI_rdata(axi_interconnect_1_to_s00_couplers_RDATA),
        .S_AXI_rid(axi_interconnect_1_to_s00_couplers_RID),
        .S_AXI_rlast(axi_interconnect_1_to_s00_couplers_RLAST),
        .S_AXI_rready(axi_interconnect_1_to_s00_couplers_RREADY),
        .S_AXI_rresp(axi_interconnect_1_to_s00_couplers_RRESP),
        .S_AXI_rvalid(axi_interconnect_1_to_s00_couplers_RVALID),
        .S_AXI_wdata(axi_interconnect_1_to_s00_couplers_WDATA),
        .S_AXI_wid(axi_interconnect_1_to_s00_couplers_WID),
        .S_AXI_wlast(axi_interconnect_1_to_s00_couplers_WLAST),
        .S_AXI_wready(axi_interconnect_1_to_s00_couplers_WREADY),
        .S_AXI_wstrb(axi_interconnect_1_to_s00_couplers_WSTRB),
        .S_AXI_wvalid(axi_interconnect_1_to_s00_couplers_WVALID));
endmodule
