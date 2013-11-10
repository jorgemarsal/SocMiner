/**
 * @file   axi_driver.svh
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   111013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */


`ifndef __AXI_DRIVER_SVH__
`define __AXI_DRIVER_SVH__
//import uvm_pkg::*;

class axi_driver;// extends uvm_component;
    virtual axi4lite_if m_if;
    task write(bit [31:0] addr, bit [31:0] data);
        $display("writing %h to addr %h", data, addr);
        /*
        m_if.awvalid  = 'h0;
        m_if.awready  = 'h0;
        m_if.awaddr   = 'h0;
        m_if.awlen    = 'h0;
        m_if.awid     = 'h0;
        m_if.awsize   = 'h0;
        m_if.awburst  = 'h0;
        m_if.awlock   = 'h0;
        m_if.awcache  = 'h0;
        m_if.awprot   = 'h0;
        m_if.awqos    = 'h0;
        m_if.wvalid   = 'h0;
        m_if.wready   = 'h0;
        m_if.wdata    = 'h0;
        m_if.wstrb    = 'h0;
        m_if.wlast    = 'h0;
        m_if.wid      = 'h0;
        m_if.bvalid   = 'h0;
        m_if.bready   = 'h0;
        m_if.bresp    = 'h0;
        m_if.bid      = 'h0;
        m_if.arvalid  = 'h0;
        m_if.arready  = 'h0;
        m_if.araddr   = 'h0;
        m_if.arlen    = 'h0;
        m_if.arid     = 'h0;
        m_if.arsize   = 'h0;
        m_if.arburst  = 'h0;
        m_if.arlock   = 'h0;
        m_if.arcache  = 'h0;
        m_if.arprot   = 'h0;
        m_if.arqos    = 'h0;
        m_if.rvalid   = 'h0;
        m_if.rready   = 'h0;
        m_if.rdata    = 'h0;
        m_if.rlast    = 'h0;
        m_if.rresp    = 'h0;
        m_if.rid      = 'h0;
        */

        //we're ready to receive the response
        m_if.bready <= 1'b1;
        
        @(posedge m_if.clk);
        m_if.awvalid  <= 'h1;
        m_if.awaddr   <= addr;
        m_if.wvalid  <= 'h1;
        m_if.wdata   <= data;
        while(!(m_if.awvalid && m_if.awready)) begin
            @(posedge m_if.clk);
        end
        m_if.awvalid  <= 'h0;
        m_if.wvalid  <= 'h0;
        @(posedge m_if.clk);
        while(!(m_if.bvalid && m_if.bready)) begin
            @(posedge m_if.clk);
        end
        


    endtask

    task read(bit [31:0] addr, output bit [31:0] data);

        m_if.rready <= 1'b1;
        @(posedge m_if.clk);
        m_if.arvalid  <= 'h1;
        m_if.araddr   <= addr;
        while(!(m_if.arvalid && m_if.arready)) begin
            @(posedge m_if.clk);
        end
        m_if.arvalid  <= 'h0;
        while(!(m_if.rvalid && m_if.rready)) begin
            @(posedge m_if.clk);
        end
        data = m_if.rdata;

        @(posedge m_if.clk);
        $display("read %h from addr %h", data, addr);
        
    endtask
endclass

`endif //__AXI_DRIVER_SVH__

