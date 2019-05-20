`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Date: 2nd of April 2019
//////////////////////////////////////////////////////////////////////////////////


module shift_reg #(
    parameter WIDTH = 16
    )(
    input wire [WIDTH-1:0] data_i,
    input wire             clk_i,
    
    output wire [WIDTH-1:0] out_o
    );
    reg [WIDTH-1:0] data_q;
    assign out_o = data_q;
    
    always @(posedge clk_i) begin
        data_q <= data_i;
    end
endmodule
