/**
 * @file   soc_miner.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

//synthesis translate_off
`default_nettype none
//synthesis translate_on

module soc_miner #(
    parameter MEMORY_DATA_WIDTH=64, 
              MEMORY_ADDR_WIDTH=32, 
              MEMORY_BUS_LEN_WIDTH=4, 
              MEMORY_ID_WIDTH=6, 
              REGS_DATA_WIDTH=32, 
              REGS_ADDR_WIDTH=32
)(
    input logic Clk,
    input logic Rst_n,


    output logic                              m_memory_awvalid ,
    input  logic                              m_memory_awready ,
    output logic [MEMORY_ADDR_WIDTH-1:0]      m_memory_awaddr  ,
    output logic [MEMORY_BUS_LEN_WIDTH-1:0]   m_memory_awlen   ,
    output logic [MEMORY_ID_WIDTH-1:0]        m_memory_awid    ,
    output logic [2:0]                        m_memory_awsize  ,
    output logic [1:0]                        m_memory_awburst ,
    output logic [1:0]                        m_memory_awlock  ,
    output logic [3:0]                        m_memory_awcache ,
    output logic [2:0]                        m_memory_awprot  ,
    output logic [3:0]                        m_memory_awqos   ,
    output logic                              m_memory_wvalid  ,
    input  logic                              m_memory_wready  ,
    output logic [MEMORY_DATA_WIDTH-1:0]      m_memory_wdata   ,
    output logic [(MEMORY_DATA_WIDTH/8)-1:0]  m_memory_wstrb   ,
    output logic                              m_memory_wlast   ,
    output logic [MEMORY_ID_WIDTH-1:0]        m_memory_wid     ,
    input  logic                              m_memory_bvalid  ,
    output logic                              m_memory_bready  ,
    input  logic [1:0]                        m_memory_bresp   ,
    input  logic [MEMORY_ID_WIDTH-1:0]        m_memory_bid     ,
    output logic                              m_memory_arvalid ,
    input  logic                              m_memory_arready ,
    output logic [MEMORY_ADDR_WIDTH-1:0]      m_memory_araddr  ,
    output logic [MEMORY_BUS_LEN_WIDTH-1:0]   m_memory_arlen   ,
    output logic [MEMORY_ID_WIDTH-1:0]        m_memory_arid    ,
    output logic [2:0]                        m_memory_arsize  ,
    output logic [1:0]                        m_memory_arburst ,
    output logic [1:0]                        m_memory_arlock  ,
    output logic [3:0]                        m_memory_arcache ,
    output logic [2:0]                        m_memory_arprot  ,
    output logic [3:0]                        m_memory_arqos   ,
    input  logic                              m_memory_rvalid  ,
    output logic                              m_memory_rready  ,
    input  logic [MEMORY_DATA_WIDTH-1:0]      m_memory_rdata   ,
    input  logic                              m_memory_rlast   ,
    input  logic [1:0]                        m_memory_rresp   ,
    input  logic [MEMORY_ID_WIDTH-1:0]        m_memory_rid     ,





    input  logic                           s_regs_awvalid,                   
    output logic                           s_regs_awready,                   
    input  logic [REGS_ADDR_WIDTH-1:0]     s_regs_awaddr,   
    input  logic [2:0]                     s_regs_awprot,                                          
    input  logic                           s_regs_wvalid,                    
    output logic                           s_regs_wready,                    
    input  logic [REGS_DATA_WIDTH-1:0]     s_regs_wdata,    
    input  logic [(REGS_DATA_WIDTH/8)-1:0] s_regs_wstrb,                             
    output logic                           s_regs_bvalid,                    
    input  logic                           s_regs_bready,                    
    output logic [1:0]                     s_regs_bresp,                                           
    input  logic                           s_regs_arvalid,                   
    output logic                           s_regs_arready,                   
    input  logic [REGS_ADDR_WIDTH-1:0]     s_regs_araddr,   
    input  logic [2:0]                     s_regs_arprot,                                          
    output logic                           s_regs_rvalid,                    
    output logic                           s_regs_rlast,                    
    input  logic                           s_regs_rready,                    
    output logic [REGS_DATA_WIDTH-1:0]     s_regs_rdata,    
    output logic [1:0]                     s_regs_rresp

    );

    

    /**
     *  interfaces
     */
    regbus_if m_regbus_if(Clk, Rst_n);
    
(* mark_debug = "true" *)  wire        addr_valid;
(* mark_debug = "true" *)  wire [31:0] reg_addr;
(* mark_debug = "true" *)  wire [31:0] reg_wdata;
(* mark_debug = "true" *)  wire [31:0] reg_rdata;
(* mark_debug = "true" *)  wire        reg_ready;
(* mark_debug = "true" *)  wire        reg_write;

    assign addr_valid = m_regbus_if.addr_valid;
    assign reg_addr = m_regbus_if.reg_addr;
    assign reg_wdata = m_regbus_if.reg_wdata;
    assign reg_rdata = m_regbus_if.reg_rdata;
    assign reg_ready = m_regbus_if.reg_ready;
    assign reg_write = m_regbus_if.reg_write;
    
    
    axi4_if #(.DATA_WIDTH(MEMORY_DATA_WIDTH),
          .ADDR_WIDTH(MEMORY_ADDR_WIDTH),
          .BUS_LEN_WIDTH(MEMORY_BUS_LEN_WIDTH),
          .ID_WIDTH(MEMORY_ID_WIDTH)) m_axi4_if(Clk, Rst_n);
    axi4lite_if #(.DATA_WIDTH(REGS_DATA_WIDTH),
              .ADDR_WIDTH(REGS_ADDR_WIDTH)) m_axi4lite_if(Clk, Rst_n);

    

    assign m_axi4lite_if.awvalid = s_regs_awvalid;
    assign s_regs_awready = m_axi4lite_if.awready;
    assign m_axi4lite_if.awaddr = s_regs_awaddr;
    assign m_axi4lite_if.awprot = s_regs_awprot;
    assign m_axi4lite_if.wvalid = s_regs_wvalid;
    assign s_regs_wready = m_axi4lite_if.wready;
    assign m_axi4lite_if.wdata = s_regs_wdata;
    assign m_axi4lite_if.wstrb = s_regs_wstrb;
    assign s_regs_bvalid = m_axi4lite_if.bvalid;
    assign m_axi4lite_if.bready = s_regs_bready;
    assign s_regs_bresp = m_axi4lite_if.bresp;
    assign m_axi4lite_if.arvalid = s_regs_arvalid;
    assign s_regs_arready = m_axi4lite_if.arready;
    assign m_axi4lite_if.araddr = s_regs_araddr;
    assign m_axi4lite_if.arprot = s_regs_arprot;
    assign s_regs_rvalid = m_axi4lite_if.rvalid;
    assign s_regs_rlast = m_axi4lite_if.rlast;
    assign m_axi4lite_if.rready = s_regs_rready;
    assign s_regs_rdata = m_axi4lite_if.rdata;
    assign s_regs_rresp = m_axi4lite_if.rresp;


    assign    m_memory_awvalid    = m_axi4_if.awvalid   ;
    assign    m_axi4_if.awready   = m_memory_awready    ;
    assign    m_memory_awaddr     = m_axi4_if.awaddr    ;
    assign    m_memory_awlen      = m_axi4_if.awlen     ;
    assign    m_memory_awid       = m_axi4_if.awid      ;
    assign    m_memory_awsize     = m_axi4_if.awsize    ;
    assign    m_memory_awburst    = m_axi4_if.awburst   ;
    assign    m_memory_awlock     = m_axi4_if.awlock    ;
    assign    m_memory_awcache    = m_axi4_if.awcache   ;
    assign    m_memory_awprot     = m_axi4_if.awprot    ;
    assign    m_memory_awqos      = m_axi4_if.awqos     ;
    assign    m_memory_wvalid     = m_axi4_if.wvalid    ;
    assign    m_axi4_if.wready    = m_memory_wready     ;
    assign    m_memory_wdata      = m_axi4_if.wdata     ;
    assign    m_memory_wstrb      = m_axi4_if.wstrb     ;
    assign    m_memory_wlast      = m_axi4_if.wlast     ;
    assign    m_memory_wid        = m_axi4_if.wid       ;
    assign    m_axi4_if.bvalid    = m_memory_bvalid     ;
    assign    m_memory_bready     = m_axi4_if.bready    ;
    assign    m_axi4_if.bresp     = m_memory_bresp      ;
    assign    m_axi4_if.bid       = m_memory_bid        ;
    assign    m_memory_arvalid    = m_axi4_if.arvalid   ;
    assign    m_axi4_if.arready   = m_memory_arready    ;
    assign    m_memory_araddr     = m_axi4_if.araddr    ;
    assign    m_memory_arlen      = m_axi4_if.arlen     ;
    assign    m_memory_arid       = m_axi4_if.arid      ;
    assign    m_memory_arsize     = m_axi4_if.arsize    ;
    assign    m_memory_arburst    = m_axi4_if.arburst   ;
    assign    m_memory_arlock     = m_axi4_if.arlock    ;
    assign    m_memory_arcache    = m_axi4_if.arcache   ;
    assign    m_memory_arprot     = m_axi4_if.arprot    ;
    assign    m_memory_arqos      = m_axi4_if.arqos     ;
    assign    m_axi4_if.rvalid    = m_memory_rvalid     ;
    assign    m_memory_rready     = m_axi4_if.rready    ;
    assign    m_axi4_if.rdata     = m_memory_rdata      ;
    assign    m_axi4_if.rlast     = m_memory_rlast      ;
    assign    m_axi4_if.rresp     = m_memory_rresp      ;
    assign    m_axi4_if.rid       = m_memory_rid        ;

    


    /**
     *  wires
     */

(* mark_debug = "true" *)    logic go;      //start block operation
(* mark_debug = "true" *)    logic go_next;

(* mark_debug = "true" *)    logic [29:0] source_address;      //pointer to source data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [29:0] destination_address; //pointer to destination data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [31:0] length;              //length of data in dram


    /**
     * Generate a single read memory access
     */
    simple_memory_access I_SIMPLE_MEMORY_ACCESS(
        .Clk                 (Clk                 ),
        .Rst_n               (Rst_n               ),
        .Go                  (go                  ),
        .source_address      (source_address      ), 
        .destination_address (destination_address ), 
        .length              (length              ), 
        .m_axi4_if           (m_axi4_if           )
    );
    /**
     * Auto clear. When sw writes a 1 to this field
     * clear it the next cycle
     */

    auto_clear I_AUTO_CLEAR(
        .Clk        (Clk),
        .Rst_n      (Rst_n),
        .In         (go),
        .Out        (go_next)
        );

    /**
     *  Bridge from axi4lite to regbus
     */
    axi4lite2regbus I_AXI4LITE2REGBUS(
        .Clk        (Clk),
        .Rst_n      (Rst_n),
        .Axi4lite_if(m_axi4lite_if),
        .Regbus_if  (m_regbus_if)
    );


    /**
     *  Register module
     */
    soc_miner_regs I_SOC_MINER_REGS(
        .Clk                        (Clk),
        .RESET                      (~Rst_n),
        .RegBus_read                (~m_regbus_if.reg_write),
        .RegBus_val                 (m_regbus_if.addr_valid),
        .RegBus_write_data          (m_regbus_if.reg_wdata),
        .RegBus_address             (m_regbus_if.reg_addr[3:2]),
        .control_go_next            (go_next),
                                    
        .RegBus_read_data           (m_regbus_if.reg_rdata),
        .RegBus_access_complete     (m_regbus_if.reg_ready),
        .control_go                 (go),
        .source_address_address     (source_address),
        .destination_address_address(destination_address),
        .length_length              (length)
    );

endmodule


`default_nettype wire
