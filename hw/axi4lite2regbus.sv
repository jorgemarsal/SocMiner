/**
 * @file   axi4lite2regbus.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

`default_nettype none
module axi4lite2regbus(
    input logic Clk, 
    input logic Rst_n,
    regbus_if Regbus_if,
    axi2lite_if Axi4lite_if);
        
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            //inputs
            Regbus_if.addr_valid <= 'h0;
            Regbus_if.reg_write <= 'h0;
            Regbus_if.reg_addr <= 'h0;
            Regbus_if.reg_wdata <= 'h0;
            //outputs
            Axi4lite_if.wready <= 'h0;
            Axi4lite_if.rready <= 'h0;
            Axi4lite_if.rdata <= 'h0;
        end
        else begin
            //inputs
            Regbus_if.addr_valid <= Axi4lite_if.awvalid | Axi4lite_if.arvalid;
            Regbus_if.reg_write <= Axi4lite_if.awvalid;
            Regbus_if.reg_addr <= Axi4lite_if.awvalid ? Axi4lite_if.awaddr : Axi4lite_if.araddr;
            Regbus_if.reg_wdata <= Axi4lite_if.wdata;
            //outputs
            Axi4lite_if.wready <= Regbus_if.reg_ready;
            Axi4lite_if.rready <= Regbus_if.reg_ready;
            Axi4lite_if.rdata <= Regbus_if.reg_rdata;
    
        end
    end
    
endmodule

`default_nettype wire
