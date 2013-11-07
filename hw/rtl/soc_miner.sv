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


output logic                       m_memory_awvalid ,
input  logic                       m_memory_awready ,
output logic [MEMORY_ADDR_WIDTH-1:0]      m_memory_awaddr  ,
output logic [MEMORY_BUS_LEN_WIDTH-1:0]   m_memory_awlen   ,
output logic [MEMORY_ID_WIDTH-1:0]        m_memory_awid    ,
output logic [2:0]                 m_memory_awsize  ,
output logic [1:0]                 m_memory_awburst ,
output logic [1:0]                 m_memory_awlock  ,
output logic [3:0]                 m_memory_awcache ,
output logic [2:0]                 m_memory_awprot  ,
output logic [3:0]                 m_memory_awqos   ,
output logic                       m_memory_wvalid  ,
input  logic                       m_memory_wready  ,
output logic [MEMORY_DATA_WIDTH-1:0]      m_memory_wdata   ,
output logic [(MEMORY_DATA_WIDTH/8)-1:0]  m_memory_wstrb   ,
output logic                       m_memory_wlast   ,
output logic [MEMORY_ID_WIDTH-1:0]        m_memory_wid     ,
input  logic                       m_memory_bvalid  ,
output logic                       m_memory_bready  ,
input  logic [1:0]                 m_memory_bresp   ,
input  logic [MEMORY_ID_WIDTH-1:0]        m_memory_bid     ,
output logic                       m_memory_arvalid ,
input  logic                       m_memory_arready ,
output logic [MEMORY_ADDR_WIDTH-1:0]      m_memory_araddr  ,
output logic [MEMORY_BUS_LEN_WIDTH-1:0]   m_memory_arlen   ,
output logic [MEMORY_ID_WIDTH-1:0]        m_memory_arid    ,
output logic [2:0]                 m_memory_arsize  ,
output logic [1:0]                 m_memory_arburst ,
output logic [1:0]                 m_memory_arlock  ,
output logic [3:0]                 m_memory_arcache ,
output logic [2:0]                 m_memory_arprot  ,
output logic [3:0]                 m_memory_arqos   ,
input  logic                       m_memory_rvalid  ,
output logic                       m_memory_rready  ,
input  logic [MEMORY_DATA_WIDTH-1:0]      m_memory_rdata   ,
input  logic                       m_memory_rlast   ,
input  logic [1:0]                 m_memory_rresp   ,
input  logic [MEMORY_ID_WIDTH-1:0]        m_memory_rid     ,





input  logic s_regs_awvalid,                   
output logic s_regs_awready,                   
input  logic [REGS_ADDR_WIDTH-1:0] s_regs_awaddr,   
input  logic [2:0] s_regs_awprot,                                          
input  logic s_regs_wvalid,                    
output logic s_regs_wready,                    
input  logic [REGS_DATA_WIDTH-1:0] s_regs_wdata,    
input  logic [(REGS_DATA_WIDTH/8)-1:0] s_regs_wstrb,                             
output logic s_regs_bvalid,                    
input  logic s_regs_bready,                    
output logic [1:0] s_regs_bresp,                                           
input  logic s_regs_arvalid,                   
output logic s_regs_arready,                   
input  logic [REGS_ADDR_WIDTH-1:0] s_regs_araddr,   
input  logic [2:0] s_regs_arprot,                                          
output logic s_regs_rvalid,                    
input  logic s_regs_rready,                    
output logic [REGS_DATA_WIDTH-1:0] s_regs_rdata,    
output logic [1:0] s_regs_rresp

    );

    /**
     *  interfaces
     */
    regbus_if m_regbus_if(Clk, Rst_n);
    axi4lite_if m_axi4lite_if(Clk, Rst_n);

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
assign m_axi4lite_if.rready = s_regs_rready;
assign s_regs_rdata = m_axi4lite_if.rdata;
assign s_regs_rresp = m_axi4lite_if.rresp;

    /**
     *  wires
     */

(* mark_debug = "true" *)    logic go;      //start block operation
(* mark_debug = "true" *)    logic go_next;

(* mark_debug = "true" *)    logic [29:0] source_address;      //pointer to source data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [29:0] destination_address; //pointer to destination data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [31:0] length;              //length of data in dram

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
