`include "axi_driver.svh"

module axi_tb;

    logic clk, rst_n;

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

    sys_fm  #(5.0,5.0) I_SYS_FM(.Clk(clk), .Rst_n(rst_n));

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

    axi_target_fm 
        #(
          .MEM_SIZE        (16384 * 4),
          .DATA_WIDTH      (MEMORY_DATA_WIDTH),
          .ADDR_WIDTH      (MEMORY_ADDR_WIDTH),
          .MAX_LATENCY     (32),
          .MEM_DEPTH       (256),
          .LEN_WIDTH       (5),
          .ID_WIDTH        (4),
          .RESP_WIDTH      (2),
          .SIZE_WIDTH      (3),
          .BURST_WIDTH     (2),
          .STRB_WIDTH      (MEMORY_DATA_WIDTH/8)
          ) I_DRAM_CONTROLLER
              (
               .aclk              (clk                   ),
               .aresetn           (rst_n                 ),

               .awvalid           (m_axi4_if.awvalid     ),
               .awaddr            (m_axi4_if.awaddr      ),
               .awlen             (m_axi4_if.awlen       ),
               .awsize            (m_axi4_if.awsize      ),
               .awburst           (m_axi4_if.awburst     ),
               .awlock            (m_axi4_if.awlock      ),
               .awcache           (m_axi4_if.awcache     ),
               .awprot            (m_axi4_if.awprot      ),
               .awid              (m_axi4_if.awid        ),
               .awready           (m_axi4_if.awready     ),
                                                        
               .arvalid           (m_axi4_if.arvalid     ),
               .araddr            (m_axi4_if.araddr      ),
               .arlen             (m_axi4_if.arlen       ),
               .arsize            (m_axi4_if.arsize      ),
               .arburst           (m_axi4_if.arburst     ),
               .arlock            (m_axi4_if.arlock      ),
               .arcache           (m_axi4_if.arcache     ),
               .arprot            (m_axi4_if.arprot      ),
               .arid              (m_axi4_if.arid        ),
               .arready           (m_axi4_if.arready     ),
                                                        
               .rvalid            (m_axi4_if.rvalid      ),
               .rlast             (m_axi4_if.rlast       ),
               .rdata             (m_axi4_if.rdata       ),
               .rresp             (m_axi4_if.rresp       ),
               .rid               (m_axi4_if.rid         ),
               .rready            (m_axi4_if.rready      ),
                                                        
               .wvalid            (m_axi4_if.wvalid      ),
               .wlast             (m_axi4_if.wlast       ),
               .wdata             (m_axi4_if.wdata       ),
               .wstrb             (m_axi4_if.wstrb       ),
               .wid               (m_axi4_if.wid         ),
               .wready            (m_axi4_if.wready      ),
                                                        
               .bvalid            (m_axi4_if.bvalid      ),
               .bresp             (m_axi4_if.bresp       ),
               .bid               (m_axi4_if.bid         ),
              .bready             (m_axi4_if.bready      )
             );

    initial begin


        logic [31:0] data;
        axi_driver m_axi_driver;
        

        m_axi4lite_if.awvalid = 1'b0;
        m_axi4lite_if.arvalid = 1'b0;
        m_axi4lite_if.wvalid = 1'b0;

        $fsdbDumpfile("axi_tb.fsdb");
        $fsdbDumpvars(0, axi_tb);

        I_SYS_FM.start;
        #100ns;
        wait(rst_n == 1);
        #100ns;

        //initialize axi memory
        for(int i = 0; i < 1024; i++) axi_tb.I_DRAM_CONTROLLER.target.memory[i] <= i;
        #100ns;
        
        // 4: source 8: destination c: length
        m_axi_driver = new;
        m_axi_driver.m_if = axi_tb.m_axi4lite_if;
        m_axi_driver.write('h4, 'h8); //source address: 'h8
        m_axi_driver.read('h4, data);
        $display("data: %h", data);
        m_axi_driver.write('h8, 'hbabeface);
        m_axi_driver.read('h8, data);
        $display("data: %h", data);
        m_axi_driver.write('hc, 'hbabeface);
        m_axi_driver.read('hc, data);
        $display("data: %h", data);
        m_axi_driver.write('h0, 'h1); //go!
        #1000ns;
        $display("simple read data: %h", I_SOC_MINER.I_SIMPLE_MEMORY_ACCESS.read_data);


        #1000ns;
        $finish(0);

    end

endmodule
