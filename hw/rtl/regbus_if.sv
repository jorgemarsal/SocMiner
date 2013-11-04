/**
 * @file   regbus_if.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */

interface regbus_if #(parameter ADDR_WIDTH = 32,
                                DATA_WIDTH = 32)
  (input clk, input rst_n);

    logic                  addr_valid;
    logic                  reg_ready ;
    logic                  reg_write ;
    logic [ADDR_WIDTH-1:0] reg_addr  ;
    logic [DATA_WIDTH-1:0] reg_wdata ;
    logic [DATA_WIDTH-1:0] reg_rdata ;

  modport master_mp(
    output addr_valid,
    input  reg_ready ,
    output reg_write ,
    output reg_addr  ,
    output reg_wdata ,
    input  reg_rdata
   );

  modport slave_mp(
    input  addr_valid,
    output reg_ready ,
    input  reg_write ,
    input  reg_addr  ,
    input  reg_wdata ,
    output reg_rdata
  );

  modport monitor_mp(
    input addr_valid,
    input reg_ready ,
    input reg_write ,
    input reg_addr  ,
    input reg_wdata ,
    input reg_rdata
  );
endinterface

