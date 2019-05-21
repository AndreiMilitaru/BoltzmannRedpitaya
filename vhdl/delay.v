`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// author: Andrei Militaru
// date: 11th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module delay #(
    parameter WIDTH = 16,
    parameter DELAY_WIDTH = 8
    )(
    input wire [WIDTH-1:0] data_i,
    input wire [DELAY_WIDTH-1:0] delta_i,
    input wire clk_i,
    input wire rst_i,
    
    output wire [WIDTH-1:0] data_o
    );
    
    
    
endmodule
