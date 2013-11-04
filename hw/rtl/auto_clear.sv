/**
 * @file   auto_clear.sv
 * @Author Jorge Martinez <jorge.marsal@gmail.com>
 * @date   093013
 * @brief  Brief description of file.
 *
 * Detailed description of file.
 */


//`default_nettype none
module auto_clear #(parameter WIDTH=1)
(
    input logic Clk, 
    input logic Rst_n, 
    input logic [WIDTH-1:0] In, 
    output logic [WIDTH-1:0] Out
);

    genvar i;
    generate for (i = 0; i < WIDTH; i++) begin : auto_clear_gen
        always @(posedge Clk or negedge Rst_n) begin
            if(!Rst_n) begin
                Out[i] <= 1'b0;
            end
            else begin
                if (In[i]) 
                   Out[i] <= 1'b0;
                else 
                   Out[i] <= In[i];
            end
        end
    end
    endgenerate

endmodule
//`default_nettype wire
