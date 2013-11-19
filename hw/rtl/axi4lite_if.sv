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
    logic [3:0] awlen;

    logic wvalid;
    logic wready;
    logic [DATA_WIDTH-1:0] wdata;
    logic [(DATA_WIDTH/8)-1:0]wstrb;

    logic bvalid;
    logic bready;
    logic [1:0] bresp;

    logic arvalid;
    logic arready;
    logic [ADDR_WIDTH-1:0] araddr;
    logic [3:0] arlen;

    logic rvalid;
    logic rready;
    logic [DATA_WIDTH-1:0] rdata;
    logic [1:0] rresp;
    logic rlast;

    modport master_mp( 
            output   awvalid , 
            input    awready , 
            output   awaddr  , 
            output   awlen  ,
            output   wvalid  ,
            input    wready  ,
            output   wdata   ,
            output   wstrb   ,
            input    bvalid  , 
            output   bready  , 
            input    bresp   , 
            output   arvalid ,
            input    arready ,
            output   araddr  ,
            output   arlen  ,
            input    rvalid  ,
            output   rready  ,
            input    rdata   ,
            input    rresp   ,
            input    rlast   
            
            );         

    modport slave_mp(              
            input    awvalid , 
            output   awready , 
            input    awaddr  , 
            input    awlen  ,
            input    wvalid  ,
            output   wready  ,
            input    wdata   ,
            input    wstrb   ,
            output   bvalid  , 
            input    bready  , 
            output   bresp   , 
            input    arvalid ,
            output   arready ,
            input    araddr  ,
            input    arlen  ,
            output   rvalid  ,
            input    rready  ,
            output   rdata   ,
            output   rresp   ,
            output   rlast   
            );         

    modport monitor_mp(            
            input    awvalid , 
            input    awready , 
            input    awaddr  , 
            input    awlen  ,
            input    wvalid  ,
            input    wready  ,
            input    wdata   ,
            input    wstrb   ,
            input    bvalid  , 
            input    bready  , 
            input    bresp   , 
            input    arvalid ,
            input    arready ,
            input    araddr  ,
            input    arlen  ,
            input    rvalid  ,
            input    rready  ,
            input    rdata   ,            
            input    rresp   ,
            input    rlast   
            );

    
  
endinterface
