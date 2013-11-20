//synthesis translate_off
`default_nettype none
//synthesis translate_on
    

module simple_memory_access(
    input logic Clk,
    input logic Rst_n,
    input logic GoRead,
    input logic GoWrite,
    input logic [29:0] source_address,     
    input logic [29:0] destination_address,
    input logic [31:0] length,
    input logic [15:0] axi_command_to_data_cycles,
    sram_rd_if.slave_mp debug_mem_wr_read_sram_if  ,
    //sram_wr_if.master_mp debug_mem_wr_write_sram_if ,  
    sram_rd_if.slave_mp debug_mem_rd_read_sram_if  ,  
    //sram_wr_if.master_mp debug_mem_rd_write_sram_if ,
    axi4_if.master_mp m_axi4_if,
    output logic Interrupt
    );

    //send interrupt after reading or writing a word
    assign Interrupt = (m_axi4_if.bvalid && m_axi4_if.bready) || (m_axi4_if.rvalid && m_axi4_if.rready);
    /*
     * debug sram for read accesses
     */
    debug_sram I_DEBUG_SRAM_MEMORY_READS(
        .Clk(Clk),
        .Rst_n(Rst_n),
        .sram_rd_if(debug_mem_rd_read_sram_if ),
        //.sram_wr_if(debug_mem_rd_write_sram_if),
        .Condition(m_axi4_if.arvalid && m_axi4_if.arready),
        .WrData({m_axi4_if.araddr[31:4], m_axi4_if.arlen}) 
    );
    /*
     * debug sram for write accesses
     */
    debug_sram I_DEBUG_SRAM_MEMORY_WRITES(
        .Clk(Clk),
        .Rst_n(Rst_n),
        .sram_rd_if(debug_mem_wr_read_sram_if ),
        //.sram_wr_if(debug_mem_wr_write_sram_if),
        .Condition(m_axi4_if.awvalid && m_axi4_if.awready),
        .WrData({m_axi4_if.awaddr[31:4], m_axi4_if.awlen}) 
    );    


    (* mark_debug = "true" *) logic [63:0] read_data;

    logic       go_write_data;
    logic [15:0] cnt;
    logic       cnt_en;

    assign go_write_data = (cnt == axi_command_to_data_cycles) && cnt_en;

    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            cnt_en <= 1'b0;
        end
        else begin
            if((cnt == axi_command_to_data_cycles) && cnt_en) begin
                cnt_en <= 1'b0;
            end
            else if (GoWrite) begin
                cnt_en <= 1'b1;
            end    
        end
    end
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            cnt <= 'h0;
        end
        else begin
            if((cnt == axi_command_to_data_cycles) && cnt_en) begin
                cnt <= 'h0;
            end
            else if (cnt_en) begin
                cnt <= cnt + 1;
            end        
        end
    end


    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            m_axi4_if.arvalid <= 1'b0;
        end
        else begin
            if(m_axi4_if.arvalid && m_axi4_if.arready) begin
                m_axi4_if.arvalid <= 1'b0;
            end
            else if(GoRead) begin
                m_axi4_if.arvalid <= 1'b1;
            end
        end
    end
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            m_axi4_if.awvalid <= 1'b0;
        end
        else begin
            if(m_axi4_if.awvalid && m_axi4_if.awready) begin
                m_axi4_if.awvalid <= 1'b0;
            end
            else if(GoWrite) begin
                m_axi4_if.awvalid <= 1'b1;
            end
        end
    end
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            m_axi4_if.wvalid <= 1'b0;
            m_axi4_if.wlast <= 1'b0;
        end
        else begin
            if(m_axi4_if.wvalid && m_axi4_if.wready) begin
                m_axi4_if.wvalid <= 1'b0;
                m_axi4_if.wlast <= 1'b0;
            end
            else if(go_write_data) begin
                m_axi4_if.wvalid <= 1'b1;
                m_axi4_if.wlast <= 1'b1;
            end
        end
    end

    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            read_data <= 1'b0;
        end
        else begin
            if(m_axi4_if.rvalid && m_axi4_if.rready) begin
                read_data <= m_axi4_if.rdata;
            end            
        end
    end

    //assign m_axi4_if.awvalid  = 'h0;
    assign m_axi4_if.awaddr   = {destination_address, 2'b00};
    assign m_axi4_if.awlen    = 4'h0;
    assign m_axi4_if.awid     = 6'h0;
    assign m_axi4_if.awsize   = 3'b011;
    assign m_axi4_if.awburst  = 2'b01;
    assign m_axi4_if.awlock   = 2'h0;
    assign m_axi4_if.awcache  = 4'h0;
    assign m_axi4_if.awprot   = 3'h0;
    assign m_axi4_if.awqos    = 4'h0;
    //assign m_axi4_if.wvalid   = 'h0;
    assign m_axi4_if.wdata    = {length, 32'h01234567};
    assign m_axi4_if.wstrb    = 8'hff;
    //assign m_axi4_if.wlast    = 'h0;
    assign m_axi4_if.wid      = 6'h0;
    assign m_axi4_if.bready   = 1'h1;
    //assign m_axi4_if.arvalid  = 'h0;
    assign m_axi4_if.araddr   = {source_address, 2'b00};
    assign m_axi4_if.arlen    = 4'h0;
    assign m_axi4_if.arid     = 6'h0;
    assign m_axi4_if.arsize   = 3'b011;
    assign m_axi4_if.arburst  = 2'b01;
    assign m_axi4_if.arlock   = 2'h0;
    assign m_axi4_if.arcache  = 2'h0;
    assign m_axi4_if.arprot   = 3'h0;
    assign m_axi4_if.arqos    = 4'h0;
    assign m_axi4_if.rready   = 1'b1;

endmodule

//synthesis translate_off
`default_nettype wire
//synthesis translate_on
