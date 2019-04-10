`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 7th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module low_pass_v2 #(
    parameter WIDTH = 16,
    parameter alpha_WIDTH = 32
    )(
    
    input wire clk_i,
    input wire rst_i,
    input wire signed [WIDTH-1:0] data_i,
    input wire [alpha_WIDTH-1:0] alpha_i,
    
    output wire signed [WIDTH-1:0] data_o
    );
    
    wire signed [WIDTH-1:0] output_exp;
    
    
    exp_filter_ve #(.WIDTH(WIDTH),                  
                    .alpha_WIDTH(alpha_WIDTH))
        i_exp_filter_ve (.clk_i(clk_i),
                         .rst_i(rst_i),
                         .data_i(data_i),
                         .alpha_i(alpha_i),
                         .data_o(output_exp) 
                         );
    
    sum_filter #(.WIDTH(16)) 
        i_sum_filter (.clk_i(clk_i),
                      .rst_i(rst_i),
                      .data_i(output_exp),
                      .data_o(data_o)
                      );
    
endmodule
