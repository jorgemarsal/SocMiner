/**
 * @file   axi4lite2regbus.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

//synthesis translate_off
`default_nettype none
//synthesis translate_on
module axi4lite2regbus(
    input logic Clk, 
    input logic Rst_n,
    regbus_if.master_mp Regbus_if,
    axi4lite_if.slave_mp Axi4lite_if,
    sram_rd_if.slave_mp debug_regs_wr_read_sram_if  ,
    //sram_wr_if.master_mp debug_regs_wr_write_sram_if ,  
    sram_rd_if.slave_mp debug_regs_rd_read_sram_if    
    //sram_wr_if.master_mp debug_regs_rd_write_sram_if   
);
    /*
     * debug sram for read accesses
     */
    debug_sram I_DEBUG_SRAM_REGS_READS(
        .Clk(Clk),
        .Rst_n(Rst_n),
        .sram_rd_if(debug_regs_rd_read_sram_if ),
        //.sram_wr_if(debug_regs_rd_write_sram_if),
        //.Condition(Axi4lite_if.arvalid && Axi4lite_if.arready),
        //.WrData({
        //    !(Axi4lite_if.rvalid & Axi4lite_if.rready), 
        //    (Axi4lite_if.arlen != 0),
        //    Axi4lite_if.araddr[25:0], 
        //    Axi4lite_if.arlen}) 
        .Condition(Regbus_if.reg_ready && ~Regbus_if.reg_write),
        .WrData(Regbus_if.reg_rdata)
    );
    /*
     * debug sram for write accesses
     */
    debug_sram I_DEBUG_SRAM_REGS_WRITES(
        .Clk(Clk),
        .Rst_n(Rst_n),
        .sram_rd_if(debug_regs_wr_read_sram_if ),
        //.sram_wr_if(debug_regs_wr_write_sram_if),
        //.Condition(Axi4lite_if.awvalid && Axi4lite_if.awready),
        .Condition(Regbus_if.addr_valid && Regbus_if.reg_write),
        //.WrData({
            //!(Axi4lite_if.wvalid & Axi4lite_if.wready), 
            //(Axi4lite_if.awlen != 0),
            //Axi4lite_if.awaddr[25:0], 
            //Axi4lite_if.awlen}) 
        .WrData(Regbus_if.reg_wdata)
    );    
        
   /* 
    // Master Interface Write Address
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_AWADDR,
    output wire [3-1:0] M_AXI_AWPROT,
    output wire M_AXI_AWVALID,
    input wire M_AXI_AWREADY,
    
    // Master Interface Write Data
    output wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_WDATA,
    output wire [C_M_AXI_DATA_WIDTH/8-1:0] M_AXI_WSTRB,
    output wire M_AXI_WVALID,
    input wire M_AXI_WREADY,

    // Master Interface Write Response
    input wire [2-1:0] M_AXI_BRESP,
    input wire M_AXI_BVALID,
    output wire M_AXI_BREADY,

    // Master Interface Read Address
    output wire [C_M_AXI_ADDR_WIDTH-1:0] M_AXI_ARADDR,
    output wire [3-1:0] M_AXI_ARPROT,
    output wire M_AXI_ARVALID,
    input wire M_AXI_ARREADY,

    // Master Interface Read Data 
    input wire [C_M_AXI_DATA_WIDTH-1:0] M_AXI_RDATA,
    input wire [2-1:0] M_AXI_RRESP,
    input wire M_AXI_RVALID,
    output wire M_AXI_RREADY,
*/
    localparam TIMEOUT_CYCLES = 7;

    logic [3:0] timeout_cnt;
    logic       timeout_cnt_en;
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            timeout_cnt_en <= 1'b0;    
        end
        else begin
            if((timeout_cnt == TIMEOUT_CYCLES) && timeout_cnt_en) begin
                timeout_cnt_en <= 1'b0;
            end
            else if(Axi4lite_if.rvalid) begin
                timeout_cnt_en <= 1'b0;
            end
            else if(Regbus_if.addr_valid && ~Regbus_if.reg_ready) begin
                timeout_cnt_en <= 1'b1;
            end
    
        end
    end
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            timeout_cnt <= 'h0;
        end
        else begin
            if((timeout_cnt == TIMEOUT_CYCLES) && timeout_cnt_en) begin
                timeout_cnt <= 'h0;
            end
            else if(timeout_cnt_en) begin
                timeout_cnt <= timeout_cnt + 1;
            end    
        end
    end
            
    

    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            //inputs
            Regbus_if.addr_valid <= 'h0;
            Regbus_if.reg_write  <= 'h0;
            Regbus_if.reg_addr   <= 'h0;
            Regbus_if.reg_wdata  <= 'h0;
            //outputs
            Axi4lite_if.awready <= 'h0;
            Axi4lite_if.arready <= 'h0;
            Axi4lite_if.wready <= 'h0;
            Axi4lite_if.rvalid <= 'h0;
            Axi4lite_if.rdata  <= 'h0;
            Axi4lite_if.bvalid  <= 'h0;
            Axi4lite_if.bresp  <= 'h0;
            Axi4lite_if.rresp  <= 'h0;
            Axi4lite_if.rlast  <= 'h0;
        end
        else begin
            //inputs
            if(Regbus_if.addr_valid && Regbus_if.reg_ready) begin
                Regbus_if.addr_valid <= 1'b0;
            end
            //else if((Axi4lite_if.awvalid && Axi4lite_if.awready) | (Axi4lite_if.arvalid && Axi4lite_if.arready)) begin
            else if((Axi4lite_if.wvalid && Axi4lite_if.wready) | (Axi4lite_if.arvalid && Axi4lite_if.arready)) begin
                Regbus_if.addr_valid <= 1'b1;
            end
            
            if(Axi4lite_if.awvalid && Axi4lite_if.awready) begin
            //if(Axi4lite_if.wvalid && Axi4lite_if.wready) begin
                Regbus_if.reg_write  <= 1'b1;    
            end
            else if(Axi4lite_if.arvalid && Axi4lite_if.arready) begin
            //else if(Axi4lite_if.rvalid && Axi4lite_if.rready) begin
                Regbus_if.reg_write  <= 1'b0;
            end
            
            
            Regbus_if.reg_addr   <= (Axi4lite_if.awvalid && Axi4lite_if.awready) ? Axi4lite_if.awaddr : (Axi4lite_if.arvalid && Axi4lite_if.arready) ? Axi4lite_if.araddr : Regbus_if.reg_addr;
            Regbus_if.reg_wdata  <= Axi4lite_if.wdata;
            //outputs
            Axi4lite_if.awready <= 'h1;
            Axi4lite_if.arready <= 'h1;
            Axi4lite_if.wready <= 'h1;

            //Axi4lite_if.rvalid <= Regbus_if.reg_ready;
            if(Axi4lite_if.rvalid & Axi4lite_if.rready) begin
                Axi4lite_if.rvalid  <= 1'b0;
                Axi4lite_if.rlast  <= 1'b0;
            end
            //else if (Regbus_if.addr_valid & ~Regbus_if.reg_write) begin
            else if ((Regbus_if.reg_ready & ~Regbus_if.reg_write) |
                     ((timeout_cnt == TIMEOUT_CYCLES) && timeout_cnt_en)) begin
                Axi4lite_if.rvalid  <= 1'b1;
                Axi4lite_if.rlast  <= 1'b1;
            end
            else begin
                Axi4lite_if.rvalid  <= Axi4lite_if.rvalid;
                Axi4lite_if.rlast  <= Axi4lite_if.rlast;
            end

            if (Regbus_if.reg_ready & ~Regbus_if.reg_write) begin
                Axi4lite_if.rdata  <= Regbus_if.reg_rdata;  
            end
            else if((timeout_cnt == TIMEOUT_CYCLES) && timeout_cnt_en) begin
                Axi4lite_if.rdata  <= 32'hdeaddead;  
            end

            if(Axi4lite_if.bvalid & Axi4lite_if.bready) begin
                Axi4lite_if.bvalid  <= 1'b0;
            end
            else if (Axi4lite_if.wvalid & Axi4lite_if.wready) begin
                Axi4lite_if.bvalid  <= 1'b1;
            end
            else begin
                Axi4lite_if.bvalid  <= Axi4lite_if.bvalid;
            end
            Axi4lite_if.bresp  <= 'h0;
            Axi4lite_if.rresp  <= 'h0;  
        end
    end
    
endmodule

`default_nettype wire
