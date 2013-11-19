//synthesis translate_off
`default_nettype none
//synthesis translate_on
interface sram_rd_if #(parameter ADDR_WIDTH=10, DATA_WIDTH =  8) (input logic Clk, input logic Rst_n);
    logic [DATA_WIDTH-1:0] rdData;
    logic [ADDR_WIDTH-1:0] rdAddr;
    logic                  rdEn;

    modport master_mp(
        input rdData,
        output rdAddr,
        output rdEn
        );
    modport slave_mp(
        output rdData,
        input rdAddr,
        input rdEn
        );
    modport monitor_mp(
        input rdData,
        input rdAddr,
        input rdEn
        );
endinterface

module rd_sram_master_to_master_connection(
    sram_rd_if.master_mp if_src,
    sram_rd_if.master_mp if_dst

);
    assign if_dst.rdData = if_src.rdData;
    assign if_dst.rdAddr = if_src.rdAddr;
    assign if_dst.rdEn   = if_src.rdEn;

endmodule
//synthesis translate_off
`default_nettype wire
//synthesis translate_on
