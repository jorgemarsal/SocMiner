/**
 * @file   axi4lite2regbus.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

//`default_nettype none
module axi4lite2regbus(
    input logic Clk, 
    input logic Rst_n,
    regbus_if Regbus_if,
    axi4lite_if Axi4lite_if
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
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            //inputs
            Regbus_if.addr_valid <= 'h0;
            Regbus_if.reg_write  <= 'h0;
            Regbus_if.reg_addr   <= 'h0;
            Regbus_if.reg_wdata  <= 'h0;
            //outputs
            Axi4lite_if.awready <= 'h0;
            Axi4lite_if.arready <= 'h1;
            Axi4lite_if.wready <= 'h0;
            Axi4lite_if.rvalid <= 'h0;
            Axi4lite_if.rdata  <= 'h0;
            Axi4lite_if.bvalid  <= 'h0;
            Axi4lite_if.bresp  <= 'h0;
            Axi4lite_if.rresp  <= 'h0;
        end
        else begin
            //inputs
            Regbus_if.addr_valid <= Axi4lite_if.awvalid | Axi4lite_if.arvalid;
            Regbus_if.reg_write  <= Axi4lite_if.awvalid;
            Regbus_if.reg_addr   <= Axi4lite_if.awvalid ? Axi4lite_if.awaddr : Axi4lite_if.araddr;
            Regbus_if.reg_wdata  <= Axi4lite_if.wdata;
            //outputs
            Axi4lite_if.awready <= 'h1;
            Axi4lite_if.arready <= 'h1;
            Axi4lite_if.wready <= Regbus_if.reg_ready;

            //Axi4lite_if.rvalid <= Regbus_if.reg_ready;
            if(Axi4lite_if.rvalid & Axi4lite_if.rready) begin
                Axi4lite_if.rvalid  <= 1'b0;
            end
            else if (Regbus_if.reg_ready) begin
                Axi4lite_if.rvalid  <= 1'b1;
            end
            else begin
                Axi4lite_if.rvalid  <= Axi4lite_if.rvalid;
            end

            Axi4lite_if.rdata  <= Regbus_if.reg_rdata;  
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

//`default_nettype wire
