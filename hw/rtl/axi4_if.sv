/**
 * @file   axi4_if.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

interface axi4_if #(parameter ADDR_WIDTH=32, 
                              DATA_WIDTH=32,
                              BUS_LEN_WIDTH = 5,
                              ID_WIDTH=4) 

        (input clk, input rst_n);

        logic                       awvalid  ;
        logic                       awready  ;
        logic [ADDR_WIDTH-1:0]      awaddr   ;
        logic [BUS_LEN_WIDTH-1:0]   awlen    ;
        logic [ID_WIDTH-1:0]        awid     ;
        logic [2:0]                 awsize   ;
        logic [1:0]                 awburst  ;
        logic [1:0]                 awlock   ;
        logic [3:0]                 awcache  ;
        logic [2:0]                 awprot   ;  
        logic [3:0]                 awqos    ;  
        logic [4:0]                 awuser   ;  
        logic [3:0]                 awregion ;

        logic                       wvalid   ;
        logic                       wready   ;
        logic [DATA_WIDTH-1:0]      wdata    ;
        logic [(DATA_WIDTH/8)-1:0]  wstrb    ;
        logic                       wlast    ;
        logic [ID_WIDTH-1:0]        wid      ;

        logic                       bvalid   ;
        logic                       bready   ;
        logic [1:0]                 bresp    ;
        logic [ID_WIDTH-1:0]        bid      ;

        logic                       arvalid  ;
        logic                       arready  ;
        logic [ADDR_WIDTH-1:0]      araddr   ;
        logic [BUS_LEN_WIDTH-1:0]   arlen    ;
        logic [ID_WIDTH-1:0]        arid     ;
        logic [2:0]                 arsize   ;
        logic [1:0]                 arburst  ;
        logic [1:0]                 arlock   ;
        logic [3:0]                 arcache  ;
        logic [2:0]                 arprot   ; 
        logic [3:0]                 arqos   ; 
        logic [4:0]                 aruser   ;  
        logic [3:0]                 arregion ;

        logic                       rvalid     ;    
        logic                       rready     ;     
        logic [DATA_WIDTH-1:0]      rdata      ;     
        logic                       rlast      ;     
        logic [1:0]                 rresp      ;     
        logic [ID_WIDTH-1:0]        rid        ;   
 


        modport master_mp( 
                output   awvalid , 
                input    awready , 
                output   awaddr  , 
                output   awlen   , 
                output   awid    , 
                output   awsize  , 
                output   awburst , 
                output   awlock  , 
                output   awcache , 
                output   awprot  ,
                output   awqos   ,
                output   awuser  ,
                output   awregion,
                output   wvalid  ,
                input    wready  ,
                output   wdata   ,
                output   wstrb   ,
                output   wlast   ,
                output   wid     ,
                input    bvalid  , 
                output   bready  , 
                input    bresp   , 
                input    bid     ,
                output   arvalid ,
                input    arready ,
                output   araddr  ,
                output   arlen   ,
                output   arid    ,
                output   arsize  ,
                output   arburst ,
                output   arlock  ,
                output   arcache ,
                output   arprot  ,
                output   arqos   ,
                output   aruser  ,
                output   arregion,
                input    rvalid  ,
                output   rready  ,
                input    rdata   ,
                input    rlast   ,
                input    rresp   ,
                input    rid     
                );         
                                 
        modport slave_mp(              
                input    awvalid , 
                output   awready , 
                input    awaddr  , 
                input    awlen   , 
                input    awid    , 
                input    awsize  , 
                input    awburst , 
                input    awlock  , 
                input    awcache , 
                input    awprot  ,
                input    awqos   ,
                input    awuser  ,
                input    awregion,
                input    wvalid  ,
                output   wready  ,
                input    wdata   ,
                input    wstrb   ,
                input    wlast   ,
                input    wid     ,
                output   bvalid  , 
                input    bready  , 
                output   bresp   , 
                output   bid     ,
                input    arvalid ,
                output   arready ,
                input    araddr  ,
                input    arlen   ,
                input    arid    ,
                input    arsize  ,
                input    arburst ,
                input    arlock  ,
                input    arcache ,
                input    arprot  ,
                input    arqos   ,
                input    aruser  ,
                input    arregion,
                output   rvalid  ,
                input    rready  ,
                output   rdata   ,
                output   rlast   ,
                output   rresp   ,
                output   rid     
                );         
                                 
        modport monitor_mp(            
                input    awvalid , 
                input    awready , 
                input    awaddr  , 
                input    awlen   , 
                input    awid    , 
                input    awsize  , 
                input    awburst , 
                input    awlock  , 
                input    awcache , 
                input    awprot  ,
                input    awqos   ,
                input    awuser  ,
                input    awregion,
                input    wvalid  ,
                input    wready  ,
                input    wdata   ,
                input    wstrb   ,
                input    wlast   ,
                input    wid     ,
                input    bvalid  , 
                input    bready  , 
                input    bresp   , 
                input    bid     ,
                input    arvalid ,
                input    arready ,
                input    araddr  ,
                input    arlen   ,
                input    arid    ,
                input    arsize  ,
                input    arburst ,
                input    arlock  ,
                input    arcache ,
                input    arprot  ,
                input    arqos   ,
                input    aruser  ,
                input    arregion,
                input    rvalid  ,
                input    rready  ,
                input    rdata   ,
                input    rlast   ,
                input    rresp   ,
                input    rid     
                );

endinterface

