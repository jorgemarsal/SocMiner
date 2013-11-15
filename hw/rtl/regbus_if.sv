
/********1*********2*********3*********4*********5*********6*********7*********8
*
* FILE      : regbus_if.sv
* HIERARCHY :
* FUNCTION  : 
* AUTHOR    : Jorge Martinez de Salinas
*
*_______________________________________________________________________________
*
* REVISION HISTORY
*
* Name         Date          Comments
* ------------------------------------------------------------------------------
* jmartinez    1/25/2010           Created
* ------------------------------------------------------------------------------
*_______________________________________________________________________________
*
* FUNCTIONAL DESCRIPTION
*     
*     
*_______________________________________________________________________________
*
* (c) Copyright Hewlett-Packard Company, year
* All rights reserved. Copying or other reproduction of this
* program except for archival purposes is prohibited without
* written consent of Hewlett-Packard Company.
* HEWLETT-PACKARD COMPANY
* INKJET COMERCIAL DIVISION
*
*********1*********2*********3*********4*********5*********6*********7*********/


//----------------------------------------------------------------------
// regbus_if
//----------------------------------------------------------------------
interface regbus_if 
  #(parameter ADDR_WIDTH = 32, 
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


