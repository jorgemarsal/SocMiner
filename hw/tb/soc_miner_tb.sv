//`default_nettype none
module soc_miner_tb;
    logic clk;
    logic rst_n;

    logic rcomplete;
    logic wcomplete;

    localparam MEMORY_DATA_WIDTH = 64;
    localparam MEMORY_ADDR_WIDTH = 32;
    localparam MEMORY_BUS_LEN_WIDTH = 4;
    localparam MEMORY_ID_WIDTH = 6;

    localparam REGS_DATA_WIDTH = 32;
    localparam REGS_ADDR_WIDTH = 32;
    
    axi4_if #(.DATA_WIDTH(MEMORY_DATA_WIDTH),
          .ADDR_WIDTH(MEMORY_ADDR_WIDTH),
          .BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH),
          .ID_WIDTH(MEMORY_ID_WIDTH)) m_axi4_if(clk, rst_n);
    axi4lite_if #(.DATA_WIDTH(REGS_DATA_WIDTH),
              .ADDR_WIDTH(REGS_ADDR_WIDTH)) m_axi4lite_if(clk, rst_n);

/*
    soc_miner I_SOC_MINER(
        .Clk        (clk),
        .Rst_n      (rst_n),     
        .Axi4_if    (m_axi4_if),   
        .Axi4lite_if(m_axi4lite_if)
    );
*/
    soc_miner_wrapper #(.MEMORY_DATA_WIDTH(MEMORY_DATA_WIDTH),
          .MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH),
          .MEMORY_BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH),
          .MEMORY_ID_WIDTH(MEMORY_ID_WIDTH), 
          .REGS_DATA_WIDTH(REGS_DATA_WIDTH),
          .REGS_ADDR_WIDTH(REGS_ADDR_WIDTH)) 
        I_SOC_MINER_WRAPPER(
.ACLK(clk),
.ARESET_N(rst_n),
.M_MEMORY_AWVALID(m_axi4_if.awvalid),
.M_MEMORY_AWREADY(m_axi4_if.awready),
.M_MEMORY_AWADDR(m_axi4_if.awaddr),
.M_MEMORY_AWLEN(m_axi4_if.awlen),
.M_MEMORY_AWID(m_axi4_if.awid),
.M_MEMORY_AWSIZE(m_axi4_if.awsize),
.M_MEMORY_AWBURST(m_axi4_if.awburst),
.M_MEMORY_AWLOCK(m_axi4_if.awlock),
.M_MEMORY_AWCACHE(m_axi4_if.awcache),
.M_MEMORY_AWPROT(m_axi4_if.awprot),
.M_MEMORY_AWQOS(m_axi4_if.awqos),
.M_MEMORY_WVALID(m_axi4_if.wvalid),
.M_MEMORY_WREADY(m_axi4_if.wready),
.M_MEMORY_WDATA(m_axi4_if.wdata),
.M_MEMORY_WSTRB(m_axi4_if.wstrb),
.M_MEMORY_WLAST(m_axi4_if.wlast),
.M_MEMORY_WID(m_axi4_if.wid),
.M_MEMORY_BVALID(m_axi4_if.bvalid),
.M_MEMORY_BREADY(m_axi4_if.bready),
.M_MEMORY_BRESP(m_axi4_if.bresp),
.M_MEMORY_BID(m_axi4_if.bid),
.M_MEMORY_ARVALID(m_axi4_if.arvalid),
.M_MEMORY_ARREADY(m_axi4_if.arready),
.M_MEMORY_ARADDR(m_axi4_if.araddr),
.M_MEMORY_ARLEN(m_axi4_if.arlen),
.M_MEMORY_ARID(m_axi4_if.arid),
.M_MEMORY_ARSIZE(m_axi4_if.arsize),
.M_MEMORY_ARBURST(m_axi4_if.arburst),
.M_MEMORY_ARLOCK(m_axi4_if.arlock),
.M_MEMORY_ARCACHE(m_axi4_if.arcache),
.M_MEMORY_ARPROT(m_axi4_if.arprot),
.M_MEMORY_ARQOS(m_axi4_if.arqos),
.M_MEMORY_RVALID(m_axi4_if.rvalid),
.M_MEMORY_RREADY(m_axi4_if.rready),
.M_MEMORY_RDATA(m_axi4_if.rdata),
.M_MEMORY_RLAST(m_axi4_if.rlast),
.M_MEMORY_RRESP(m_axi4_if.rresp),
.M_MEMORY_RID(m_axi4_if.rid),
.S_REGS_AWVALID(m_axi4lite_if.awvalid),
.S_REGS_AWREADY(m_axi4lite_if.awready),
.S_REGS_AWADDR(m_axi4lite_if.awaddr),
.S_REGS_AWPROT(m_axi4lite_if.awprot),
.S_REGS_WVALID(m_axi4lite_if.wvalid),
.S_REGS_WREADY(m_axi4lite_if.wready),
.S_REGS_WDATA(m_axi4lite_if.wdata),
.S_REGS_WSTRB(m_axi4lite_if.wstrb),
.S_REGS_BVALID(m_axi4lite_if.bvalid),
.S_REGS_BREADY(m_axi4lite_if.bready),
.S_REGS_BRESP(m_axi4lite_if.bresp),
.S_REGS_ARVALID(m_axi4lite_if.arvalid),
.S_REGS_ARREADY(m_axi4lite_if.arready),
.S_REGS_ARADDR(m_axi4lite_if.araddr),
.S_REGS_ARPROT(m_axi4lite_if.arprot),
.S_REGS_RVALID(m_axi4lite_if.rvalid),
.S_REGS_RREADY(m_axi4lite_if.rready),
.S_REGS_RDATA(m_axi4lite_if.rdata),
.S_REGS_RRESP(m_axi4lite_if.rresp)


    );

    axi_lite_master I_AXI_LITE_MASTER(

        .WCOMPLETE(wcomplete),
        .RCOMPLETE(rcomplete),
        .M_AXI_ACLK(clk),
        .M_AXI_ARESETN(rst_n),


        .M_AXI_AWADDR(m_axi4lite_if.awaddr),
        .M_AXI_AWPROT(m_axi4lite_if.awprot),
        .M_AXI_AWVALID(m_axi4lite_if.awvalid),
        .M_AXI_AWREADY(m_axi4lite_if.awready),


        .M_AXI_WDATA(m_axi4lite_if.wdata),
        .M_AXI_WSTRB(m_axi4lite_if.wstrb),
        //.M_AXI_WLAST(m_axi4lite_if.wlast),
        .M_AXI_WVALID(m_axi4lite_if.wvalid),
        .M_AXI_WREADY(m_axi4lite_if.wready),


        .M_AXI_BRESP(m_axi4lite_if.bresp),
        .M_AXI_BVALID(m_axi4lite_if.bvalid),
        .M_AXI_BREADY(m_axi4lite_if.bready),


        .M_AXI_ARADDR(m_axi4lite_if.araddr),
        .M_AXI_ARPROT(m_axi4lite_if.arprot),
        .M_AXI_ARVALID(m_axi4lite_if.arvalid),
        .M_AXI_ARREADY(m_axi4lite_if.arready),


        .M_AXI_RDATA(m_axi4lite_if.rdata),
        .M_AXI_RRESP(m_axi4lite_if.rresp),
        //.M_AXI_RLAST(m_axi4lite_if.rlast),
        .M_AXI_RVALID(m_axi4lite_if.rvalid),
        .M_AXI_RREADY(m_axi4lite_if.rready)
    );

    sys_fm  #(5.0,5.0) I_SYS_FM(.Clk(clk), .Rst_n(rst_n));


    initial begin
        $fsdbDumpfile("soc_miner_tb.fsdb");
        $fsdbDumpvars(0, soc_miner_tb);
        //uvm_report_info("test", "hello!");
        //run_test("");
        I_SYS_FM.start;
        wait(rst_n == 1);
        wait(wcomplete && rcomplete);
        #1000ns;
        $finish(0);

    end

endmodule
//`default_nettype wire
