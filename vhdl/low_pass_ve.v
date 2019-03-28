`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// author: Andrei Militaru
// date: 25th of March 2019
//////////////////////////////////////////////////////////////////////////////////


module low_pass_ve #(
    parameter WIDTH = 16
)(
    input wire clk_i,
    input wire [WIDTH-1:0] data_i,
    input wire [WIDTH-1:0] cutoff_i,
    
    output wire [WIDTH-1:0] out_o
    );
    
    reg [WIDTH-1:0] data_d, data_q;
    assign out_o = data_q;
    
    
endmodule
