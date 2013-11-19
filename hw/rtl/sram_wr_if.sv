//synthesis translate_off
`default_nettype none
//synthesis translate_on
interface sram_wr_if #(parameter ADDR_WIDTH=10, DATA_WIDTH =  8) (input logic Clk, input logic Rst_n);
    logic [DATA_WIDTH-1:0] wrData;
    logic [ADDR_WIDTH-1:0] wrAddr;
    logic                  wrEn;

    modport master_mp(
        output wrData,
        output wrAddr,
        output wrEn
        );
    modport slave_mp(
        input wrData,
        input wrAddr,
        input wrEn
        );
    modport monitor_mp(
        input wrData,
        input wrAddr,
        input wrEn
        );
endinterface
//synthesis translate_off
`default_nettype wire
//synthesis translate_on
