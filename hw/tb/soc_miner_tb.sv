`default_nettype none
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
    soc_miner #(.MEMORY_DATA_WIDTH(MEMORY_DATA_WIDTH),
                .MEMORY_ADDR_WIDTH(MEMORY_ADDR_WIDTH),
                .MEMORY_BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH),
                .MEMORY_ID_WIDTH(MEMORY_ID_WIDTH), 
                .REGS_DATA_WIDTH(REGS_DATA_WIDTH),
                .REGS_ADDR_WIDTH(REGS_ADDR_WIDTH)) 
    I_SOC_MINER(
        .Clk(clk),
        .Rst_n(rst_n),
        .m_memory_awvalid(m_axi4_if.awvalid),
        .m_memory_awready(m_axi4_if.awready),
        .m_memory_awaddr(m_axi4_if.awaddr),
        .m_memory_awlen(m_axi4_if.awlen),
        .m_memory_awid(m_axi4_if.awid),
        .m_memory_awsize(m_axi4_if.awsize),
        .m_memory_awburst(m_axi4_if.awburst),
        .m_memory_awlock(m_axi4_if.awlock),
        .m_memory_awcache(m_axi4_if.awcache),
        .m_memory_awprot(m_axi4_if.awprot),
        .m_memory_awqos(m_axi4_if.awqos),
        .m_memory_wvalid(m_axi4_if.wvalid),
        .m_memory_wready(m_axi4_if.wready),
        .m_memory_wdata(m_axi4_if.wdata),
        .m_memory_wstrb(m_axi4_if.wstrb),
        .m_memory_wlast(m_axi4_if.wlast),
        .m_memory_wid(m_axi4_if.wid),
        .m_memory_bvalid(m_axi4_if.bvalid),
        .m_memory_bready(m_axi4_if.bready),
        .m_memory_bresp(m_axi4_if.bresp),
        .m_memory_bid(m_axi4_if.bid),
        .m_memory_arvalid(m_axi4_if.arvalid),
        .m_memory_arready(m_axi4_if.arready),
        .m_memory_araddr(m_axi4_if.araddr),
        .m_memory_arlen(m_axi4_if.arlen),
        .m_memory_arid(m_axi4_if.arid),
        .m_memory_arsize(m_axi4_if.arsize),
        .m_memory_arburst(m_axi4_if.arburst),
        .m_memory_arlock(m_axi4_if.arlock),
        .m_memory_arcache(m_axi4_if.arcache),
        .m_memory_arprot(m_axi4_if.arprot),
        .m_memory_arqos(m_axi4_if.arqos),
        .m_memory_rvalid(m_axi4_if.rvalid),
        .m_memory_rready(m_axi4_if.rready),
        .m_memory_rdata(m_axi4_if.rdata),
        .m_memory_rlast(m_axi4_if.rlast),
        .m_memory_rresp(m_axi4_if.rresp),
        .m_memory_rid(m_axi4_if.rid),
        .s_regs_awvalid(m_axi4lite_if.awvalid),
        .s_regs_awready(m_axi4lite_if.awready),
        .s_regs_awaddr(m_axi4lite_if.awaddr),
        .s_regs_awprot(m_axi4lite_if.awprot),
        .s_regs_wvalid(m_axi4lite_if.wvalid),
        .s_regs_wready(m_axi4lite_if.wready),
        .s_regs_wdata(m_axi4lite_if.wdata),
        .s_regs_wstrb(m_axi4lite_if.wstrb),
        .s_regs_bvalid(m_axi4lite_if.bvalid),
        .s_regs_bready(m_axi4lite_if.bready),
        .s_regs_bresp(m_axi4lite_if.bresp),
        .s_regs_arvalid(m_axi4lite_if.arvalid),
        .s_regs_arready(m_axi4lite_if.arready),
        .s_regs_araddr(m_axi4lite_if.araddr),
        .s_regs_arprot(m_axi4lite_if.arprot),
        .s_regs_rvalid(m_axi4lite_if.rvalid),
        .s_regs_rready(m_axi4lite_if.rready),
        .s_regs_rdata(m_axi4lite_if.rdata),
        .s_regs_rresp(m_axi4lite_if.rresp)
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
`default_nettype wire
