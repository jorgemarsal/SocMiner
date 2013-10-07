/**
 * @file   axi4lite_if.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

interface axi4lite_if #(parameter ADDR_WIDTH = 32,
                                  DATA_WIDTH = 32)
  (input clk, input rst_n);
    
    logic awvalid;
    logic awready;
    logic [ADDR_WIDTH-1:0] awaddr;
    logic awprot;

    logic wvalid;
    logic wready;
    logic [DATA_WIDTH-1:0] wdata;
    logic wstrb;

    logic bvalid;
    logic bready;
    logic bresp;

    logic arvalid;
    logic arready;
    logic [ADDR_WIDTH-1:0] araddr;
    logic arprot;

    logic rvalid;
    logic rready;
    logic [DATA_WIDTH-1:0] rdata;
    logic rresp;
    
  
endinterface
