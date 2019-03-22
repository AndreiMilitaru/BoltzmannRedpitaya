`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Institute: Photonics Laboratory, ETH
// Date: 3rd of December 2018
//////////////////////////////////////////////////////////////////////////////////


module Abs_v2 #(
    parameter integer data_width = 16
    )
    ( 
    input wire clk_i,
    input wire [data_width-1:0] adc_data_i,
    
    output wire [data_width-1:0] adc_data_o,
    output wire [data_width-1:0] abs_o,
    output wire valid_o
    );
    
    reg [data_width-1:0] data_d, data_q = 0, abs_d, abs_q = 0;
    reg valid_d,valid_q;
    
    assign adc_data_o = data_q;
    assign abs_o = abs_q;
    assign valid_o = valid_q;
    
    always @(*) begin
        valid_d = 1'b1;
        data_d = adc_data_i;
        abs_d = (data_q[data_width-1] == 1'b1) ? (-data_d) : (data_d);
    end
    
    always @(posedge clk_i) begin
        data_q <= data_d;
        abs_q <= abs_d;
        valid_q <= valid_d;
    end
    
endmodule
