`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Date: 2nd of April 2019
//////////////////////////////////////////////////////////////////////////////////


module mux_2  #(
    parameter WIDTH = 16
    )(
    input wire [WIDTH-1:0] a_in,
    input wire [WIDTH-1:0] b_in,
    input wire             sel_i,
    
    output wire [WIDTH-1:0] out_o
    );
    
    assign out_o = sel_i ? a_in : b_in; 
    
endmodule
