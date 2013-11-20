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





    input  logic                            s_regs_awvalid,                   
    output logic                            s_regs_awready,                   
    input  logic [REGS_ADDR_WIDTH-1:0]      s_regs_awaddr,   
    input  logic [MEMORY_BUS_LEN_WIDTH-1:0] s_regs_awlen,                                          
    input  logic                            s_regs_wvalid,                    
    output logic                            s_regs_wready,                    
    input  logic [REGS_DATA_WIDTH-1:0]      s_regs_wdata,    
    input  logic [(REGS_DATA_WIDTH/8)-1:0]  s_regs_wstrb,                             
    output logic                            s_regs_bvalid,                    
    input  logic                            s_regs_bready,                    
    output logic [1:0]                      s_regs_bresp,                                           
    input  logic                            s_regs_arvalid,                   
    output logic                            s_regs_arready,                   
    input  logic [REGS_ADDR_WIDTH-1:0]      s_regs_araddr,   
    input  logic [MEMORY_BUS_LEN_WIDTH-1:0] s_regs_arlen,                                          
    output logic                            s_regs_rvalid,                    
    output logic                            s_regs_rlast,                    
    input  logic                            s_regs_rready,                    
    output logic [REGS_DATA_WIDTH-1:0]      s_regs_rdata,    
    output logic [1:0]                      s_regs_rresp,

    output logic [31:0]s_axi_acp_araddr,
    output logic [1:0]s_axi_acp_arburst,
    output logic [3:0]s_axi_acp_arcache,
    output logic [2:0]s_axi_acp_arid,
    output logic [3:0]s_axi_acp_arlen,
    output logic [1:0]s_axi_acp_arlock,
    output logic [2:0]s_axi_acp_arprot,
    output logic [3:0]s_axi_acp_arqos,
    input  logic s_axi_acp_arready,
    output logic [2:0]s_axi_acp_arsize,
    output logic [4:0]s_axi_acp_aruser,
    output logic s_axi_acp_arvalid,
    output logic [31:0]s_axi_acp_awaddr,
    output logic [1:0]s_axi_acp_awburst,
    output logic [3:0]s_axi_acp_awcache,
    output logic [2:0]s_axi_acp_awid,
    output logic [3:0]s_axi_acp_awlen,
    output logic [1:0]s_axi_acp_awlock,
    output logic [2:0]s_axi_acp_awprot,
    output logic [3:0]s_axi_acp_awqos,
    input  logic s_axi_acp_awready,
    output logic [2:0]s_axi_acp_awsize,
    output logic [4:0]s_axi_acp_awuser,
    output logic s_axi_acp_awvalid,
    input  logic [2:0]s_axi_acp_bid,
    output logic s_axi_acp_bready,
    input  logic [1:0]s_axi_acp_bresp,
    input  logic s_axi_acp_bvalid,
    input  logic [63:0]s_axi_acp_rdata,
    input  logic [2:0]s_axi_acp_rid,
    input  logic s_axi_acp_rlast,
    output logic s_axi_acp_rready,
    input  logic [1:0]s_axi_acp_rresp,
    input  logic s_axi_acp_rvalid,
    output logic [63:0]s_axi_acp_wdata,
    output logic [2:0]s_axi_acp_wid,
    output logic s_axi_acp_wlast,
    input  logic s_axi_acp_wready,
    output logic [7:0]s_axi_acp_wstrb,
    output logic s_axi_acp_wvalid,

    output logic Interrupt


    );

    


    /**
     *  interfaces
     */
    regbus_if #(.ADDR_WIDTH(32),.DATA_WIDTH(32)) m_regbus_if(Clk, Rst_n);
    
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
    assign m_axi4lite_if.awlen = s_regs_awlen;
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
    assign m_axi4lite_if.arlen = s_regs_arlen;
    assign s_regs_rvalid = m_axi4lite_if.rvalid;
    assign s_regs_rlast = m_axi4lite_if.rlast;
    assign m_axi4lite_if.rready = s_regs_rready;
    assign s_regs_rdata = m_axi4lite_if.rdata;
    assign s_regs_rresp = m_axi4lite_if.rresp;

    logic acp_enabled;

    always_comb begin
        if(acp_enabled) begin
            s_axi_acp_awvalid    = m_axi4_if.awvalid   ;
            m_axi4_if.awready    = s_axi_acp_awready   ;
            s_axi_acp_awaddr     = m_axi4_if.awaddr    ;
            s_axi_acp_awlen      = m_axi4_if.awlen     ;
            s_axi_acp_awid       = m_axi4_if.awid      ;
            s_axi_acp_awsize     = m_axi4_if.awsize    ;
            s_axi_acp_awburst    = m_axi4_if.awburst   ;
            s_axi_acp_awlock     = m_axi4_if.awlock    ;
            s_axi_acp_awcache    = m_axi4_if.awcache   ;
            s_axi_acp_awprot     = m_axi4_if.awprot    ;
            s_axi_acp_awqos      = m_axi4_if.awqos     ;
            s_axi_acp_wvalid     = m_axi4_if.wvalid    ;
            m_axi4_if.wready     = s_axi_acp_wready    ;
            s_axi_acp_wdata      = m_axi4_if.wdata     ;
            s_axi_acp_wstrb      = m_axi4_if.wstrb     ;
            s_axi_acp_wlast      = m_axi4_if.wlast     ;
            s_axi_acp_wid        = m_axi4_if.wid       ;
            m_axi4_if.bvalid     = s_axi_acp_bvalid    ;
            s_axi_acp_bready     = m_axi4_if.bready    ;
            m_axi4_if.bresp      = s_axi_acp_bresp     ;
            m_axi4_if.bid        = s_axi_acp_bid       ;
            s_axi_acp_arvalid    = m_axi4_if.arvalid   ;
            m_axi4_if.arready    = s_axi_acp_arready   ;
            s_axi_acp_araddr     = m_axi4_if.araddr    ;
            s_axi_acp_arlen      = m_axi4_if.arlen     ;
            s_axi_acp_arid       = m_axi4_if.arid      ;
            s_axi_acp_arsize     = m_axi4_if.arsize    ;
            s_axi_acp_arburst    = m_axi4_if.arburst   ;
            s_axi_acp_arlock     = m_axi4_if.arlock    ;
            s_axi_acp_arcache    = m_axi4_if.arcache   ;
            s_axi_acp_arprot     = m_axi4_if.arprot    ;
            s_axi_acp_arqos      = m_axi4_if.arqos     ;
            m_axi4_if.rvalid     = s_axi_acp_rvalid    ;
            s_axi_acp_rready     = m_axi4_if.rready    ;
            m_axi4_if.rdata      = s_axi_acp_rdata     ;
            m_axi4_if.rlast      = s_axi_acp_rlast     ;
            m_axi4_if.rresp      = s_axi_acp_rresp     ;
            m_axi4_if.rid        = s_axi_acp_rid       ;
            //disable non-acp
            m_memory_awvalid    = 'h0;
            m_memory_awaddr     = 'h0;
            m_memory_awlen      = 'h0;
            m_memory_awid       = 'h0;
            m_memory_awsize     = 'h0;
            m_memory_awburst    = 'h0;
            m_memory_awlock     = 'h0;
            m_memory_awcache    = 'h0;
            m_memory_awprot     = 'h0;
            m_memory_awqos      = 'h0;
            m_memory_wvalid     = 'h0;
            m_memory_wdata      = 'h0;
            m_memory_wstrb      = 'h0;
            m_memory_wlast      = 'h0;
            m_memory_wid        = 'h0;
            m_memory_bready     = 'h0;
            m_memory_arvalid    = 'h0;
            m_memory_araddr     = 'h0;
            m_memory_arlen      = 'h0;
            m_memory_arid       = 'h0;
            m_memory_arsize     = 'h0;
            m_memory_arburst    = 'h0;
            m_memory_arlock     = 'h0;
            m_memory_arcache    = 'h0;
            m_memory_arprot     = 'h0;
            m_memory_arqos      = 'h0;
            m_memory_rready     = 'h0;

        end
        else begin
            m_memory_awvalid    = m_axi4_if.awvalid   ;
            m_axi4_if.awready   = m_memory_awready    ;
            m_memory_awaddr     = m_axi4_if.awaddr    ;
            m_memory_awlen      = m_axi4_if.awlen     ;
            m_memory_awid       = m_axi4_if.awid      ;
            m_memory_awsize     = m_axi4_if.awsize    ;
            m_memory_awburst    = m_axi4_if.awburst   ;
            m_memory_awlock     = m_axi4_if.awlock    ;
            m_memory_awcache    = m_axi4_if.awcache   ;
            m_memory_awprot     = m_axi4_if.awprot    ;
            m_memory_awqos      = m_axi4_if.awqos     ;
            m_memory_wvalid     = m_axi4_if.wvalid    ;
            m_axi4_if.wready    = m_memory_wready     ;
            m_memory_wdata      = m_axi4_if.wdata     ;
            m_memory_wstrb      = m_axi4_if.wstrb     ;
            m_memory_wlast      = m_axi4_if.wlast     ;
            m_memory_wid        = m_axi4_if.wid       ;
            m_axi4_if.bvalid    = m_memory_bvalid     ;
            m_memory_bready     = m_axi4_if.bready    ;
            m_axi4_if.bresp     = m_memory_bresp      ;
            m_axi4_if.bid       = m_memory_bid        ;
            m_memory_arvalid    = m_axi4_if.arvalid   ;
            m_axi4_if.arready   = m_memory_arready    ;
            m_memory_araddr     = m_axi4_if.araddr    ;
            m_memory_arlen      = m_axi4_if.arlen     ;
            m_memory_arid       = m_axi4_if.arid      ;
            m_memory_arsize     = m_axi4_if.arsize    ;
            m_memory_arburst    = m_axi4_if.arburst   ;
            m_memory_arlock     = m_axi4_if.arlock    ;
            m_memory_arcache    = m_axi4_if.arcache   ;
            m_memory_arprot     = m_axi4_if.arprot    ;
            m_memory_arqos      = m_axi4_if.arqos     ;
            m_axi4_if.rvalid    = m_memory_rvalid     ;
            m_memory_rready     = m_axi4_if.rready    ;
            m_axi4_if.rdata     = m_memory_rdata      ;
            m_axi4_if.rlast     = m_memory_rlast      ;
            m_axi4_if.rresp     = m_memory_rresp      ;
            m_axi4_if.rid       = m_memory_rid        ;

            //disable acp
            s_axi_acp_awvalid    = 'h0;
            s_axi_acp_awaddr     = 'h0;
            s_axi_acp_awlen      = 'h0;
            s_axi_acp_awid       = 'h0;
            s_axi_acp_awsize     = 'h0;
            s_axi_acp_awburst    = 'h0;
            s_axi_acp_awlock     = 'h0;
            s_axi_acp_awcache    = 'h0;
            s_axi_acp_awprot     = 'h0;
            s_axi_acp_awqos      = 'h0;
            s_axi_acp_wvalid     = 'h0;
            s_axi_acp_wdata      = 'h0;
            s_axi_acp_wstrb      = 'h0;
            s_axi_acp_wlast      = 'h0;
            s_axi_acp_wid        = 'h0;
            s_axi_acp_bready     = 'h0;
            s_axi_acp_arvalid    = 'h0;
            s_axi_acp_araddr     = 'h0;
            s_axi_acp_arlen      = 'h0;
            s_axi_acp_arid       = 'h0;
            s_axi_acp_arsize     = 'h0;
            s_axi_acp_arburst    = 'h0;
            s_axi_acp_arlock     = 'h0;
            s_axi_acp_arcache    = 'h0;
            s_axi_acp_arprot     = 'h0;
            s_axi_acp_arqos      = 'h0;
            s_axi_acp_rready     = 'h0;
        end
    end

    


    /**
     *  wires
     */

(* mark_debug = "true" *)    logic go_read;      //start block operation
(* mark_debug = "true" *)    logic go_read_next;
(* mark_debug = "true" *)    logic go_write;      //start block operation
(* mark_debug = "true" *)    logic go_write_next;
(* mark_debug = "true" *)    logic go_read_acp;      //start block operation
(* mark_debug = "true" *)    logic go_read_acp_next;
(* mark_debug = "true" *)    logic go_write_acp;      //start block operation
(* mark_debug = "true" *)    logic go_write_acp_next;

(* mark_debug = "true" *)    logic [29:0] source_address;      //pointer to source data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [29:0] destination_address; //pointer to destination data in dram (aligned to 4bytes)
(* mark_debug = "true" *)    logic [31:0] length;              //length of data in dram
(* mark_debug = "true" *)    logic [15:0] axi_command_to_data_cycles;

    /**
     * Generate a single read memory access
     */

    sram_rd_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_mem_wr_read_sram_if(Clk,Rst_n);
//    sram_wr_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_mem_wr_write_sram_if();

    sram_rd_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_mem_rd_read_sram_if(Clk,Rst_n);
    //sram_wr_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_mem_rd_write_sram_if();

    sram_rd_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_regs_wr_read_sram_if(Clk,Rst_n);
    //sram_wr_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_regs_wr_write_sram_if();

    sram_rd_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_regs_rd_read_sram_if(Clk,Rst_n);
    //sram_wr_if #(.ADDR_WIDTH(32), .DATA_WIDTH(64)) debug_regs_rd_write_sram_if();

    simple_memory_access I_SIMPLE_MEMORY_ACCESS(
        .Clk                        (Clk                       ),
        .Rst_n                      (Rst_n                     ),
        .GoRead                     (go_read                   ),
        .GoWrite                    (go_write                  ),
        .source_address             (source_address            ), 
        .destination_address        (destination_address       ), 
        .length                     (length                    ),
        .axi_command_to_data_cycles (axi_command_to_data_cycles),
        .m_axi4_if                  (m_axi4_if                 ),
        .debug_mem_wr_read_sram_if  (debug_mem_wr_read_sram_if ),
        //.debug_mem_wr_write_sram_if        (debug_mem_wr_write_sram_if       ),
        .debug_mem_rd_read_sram_if  (debug_mem_rd_read_sram_if ),
        //.debug_mem_rd_write_sram_if        (debug_mem_rd_write_sram_if       )
        .Interrupt (Interrupt)
    );
    /**
     * Auto clear. When sw writes a 1 to this field
     * clear it the next cycle
     */

    auto_clear I_GO_READ_AUTO_CLEAR(
        .Clk        (Clk),
        .Rst_n      (Rst_n),
        .In         (go_read),
        .Out        (go_read_next)
        );
    auto_clear I_GO_WRITE_AUTO_CLEAR(
        .Clk        (Clk),
        .Rst_n      (Rst_n),
        .In         (go_write),
        .Out        (go_write_next)
        );

    /**
     *  Bridge from axi4lite to regbus
     */
    axi4lite2regbus I_AXI4LITE2REGBUS(
        .Clk        (Clk),
        .Rst_n      (Rst_n),
        .Axi4lite_if(m_axi4lite_if),
        .Regbus_if  (m_regbus_if),
        .debug_regs_wr_read_sram_if         (debug_regs_wr_read_sram_if        ),
        //.debug_regs_wr_write_sram_if        (debug_regs_wr_write_sram_if       ),
        .debug_regs_rd_read_sram_if         (debug_regs_rd_read_sram_if        )
        //.debug_regs_rd_write_sram_if        (debug_regs_rd_write_sram_if       )
    );


    logic rd_en0_ff;
    logic rd_en1_ff;
    logic rd_en2_ff;
    logic rd_en3_ff;
    /**
     *  Register module
     */
    soc_miner_regs I_SOC_MINER_REGS(
        .Clk                        (Clk),
        .RESET                      (~Rst_n),
        .RegBus_read                (~m_regbus_if.reg_write),
        .RegBus_val                 (m_regbus_if.addr_valid),
        .RegBus_write_data          (m_regbus_if.reg_wdata),
        .RegBus_address             (m_regbus_if.reg_addr[31:2]),
        .control_go_read_next            (go_read_next),
        .control_go_write_next            (go_write_next),
        .control_go_read_acp_next            (go_read_acp_next),
        .control_go_write_acp_next            (go_write_acp_next),
                                    
        .RegBus_read_data           (m_regbus_if.reg_rdata),
        .RegBus_access_complete     (m_regbus_if.reg_ready),
        .control_go_read                 (go_read),
        .control_go_write                 (go_write),
        .control_go_read_acp                 (go_read_acp),
        .control_go_write_acp                 (go_write_acp),
        .source_address_address     (source_address),
        .destination_address_address(destination_address),
        .length_length              (length),
        .axi_command_to_data_cycles(axi_command_to_data_cycles),
        //inputs
        .debug_mem_wr_sram_read_data        (debug_mem_wr_read_sram_if.rdData),
        .debug_mem_wr_sram_access_complete  (rd_en0_ff),
        .debug_mem_rd_sram_read_data        (debug_mem_rd_read_sram_if.rdData),
        .debug_mem_rd_sram_access_complete  (rd_en1_ff),
        .debug_regs_wr_sram_read_data       (debug_regs_wr_read_sram_if.rdData),
        .debug_regs_wr_sram_access_complete (rd_en2_ff),
        .debug_regs_rd_sram_read_data       (debug_regs_rd_read_sram_if.rdData),
        .debug_regs_rd_sram_access_complete (rd_en3_ff),

        //outputs
        .debug_mem_wr_sram_read             (debug_mem_wr_read_sram_if.rdEn),
        .debug_mem_wr_sram_address          (debug_mem_wr_read_sram_if.rdAddr[31:2]),
        .debug_mem_rd_sram_read             (debug_mem_rd_read_sram_if.rdEn),
        .debug_mem_rd_sram_address          (debug_mem_rd_read_sram_if.rdAddr[31:2]),
        .debug_regs_wr_sram_read            (debug_regs_wr_read_sram_if.rdEn),
        .debug_regs_wr_sram_address         (debug_regs_wr_read_sram_if.rdAddr[31:2]),
        .debug_regs_rd_sram_read            (debug_regs_rd_read_sram_if.rdEn),
        .debug_regs_rd_sram_address         (debug_regs_rd_read_sram_if.rdAddr[31:2]),

        .acp_acp_en (acp_enabled)

    );

    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            rd_en0_ff <= 1'b0;
            rd_en1_ff <= 1'b0;
            rd_en2_ff <= 1'b0;
            rd_en3_ff <= 1'b0;
        end
        else begin
            rd_en0_ff <= debug_mem_wr_read_sram_if.rdEn;    
            rd_en1_ff <= debug_mem_rd_read_sram_if.rdEn;    
            rd_en2_ff <= debug_regs_wr_read_sram_if.rdEn;    
            rd_en3_ff <= debug_regs_rd_read_sram_if.rdEn;    
        end
    end

endmodule


`default_nettype wire
