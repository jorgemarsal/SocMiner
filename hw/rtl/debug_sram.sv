//synthesis translate_off
`default_nettype none
//synthesis translate_on

module debug_sram(
    input logic Clk,
    input logic Rst_n,

    sram_rd_if.slave_mp sram_rd_if,
    //sram_wr_if.master_mp sram_wr_if,
    input logic Condition,
    input logic [31:0] WrData   

);


    /*
     * debug sram for read accesses
     */

    logic [7:0] wr_addr; //sram has 
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            wr_addr <= 'h0;
        end
        else begin
            if(Condition) begin
                wr_addr <= wr_addr + 1;
            end
        end
    end

/*
    always_ff @(posedge Clk or negedge Rst_n) begin
        if (!Rst_n) begin
            sram_wr_if.wrEn <= 'h0;
            sram_wr_if.wrData <= 'h0;
        end
        else begin
            if(Condition) begin
                sram_wr_if.wrEn <= 'h1;
                //32unused, write, addr[31:4] len(4bits)
                sram_wr_if.wrData <= {32'h0, WrData}; 
            end
            else begin
                sram_wr_if.wrEn <= 'h0;
            end   
        end
    end
*/
    xilinx_64x256_sram I_XCR_SRAM_INPUT (
          .clka (Clk),
          .wea  (Condition),
          .addra(wr_addr),
          .dina (WrData),
          .clkb (Clk),
          .addrb(sram_rd_if.rdAddr[9:2]),
          .doutb(sram_rd_if.rdData)
        );


endmodule
//synthesis translate_off
`default_nettype wire
//synthesis translate_on
