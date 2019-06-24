`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 24th of June 2019
//////////////////////////////////////////////////////////////////////////////////


module delay_wrapper(
    input wire [15:0] data_i,
    input wire [7:0] sel_i,
    input wire clk_i,
    input wire rst_i,
    
    output wire [15:0] data_o
    );
    
    wire [7:0] sel_int;
    wire [15:0] data_int;
    
    assign sel_int = (sel_i == 8'd0) ? sel_i : (sel_i - 1);
    
    delay_max256clocks delay_max256clocks_i (
        .data_i (data_i),
        .sel_i (sel_int),
        .clk_i (clk_i),
        .rst_i (rst_i),
        .data_o (data_int)
        );
        
    assign data_o = (sel_i == 8'd0) ? data_i : data_int;
    
endmodule
