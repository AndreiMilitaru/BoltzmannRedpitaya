`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 3rd of April 2019
//////////////////////////////////////////////////////////////////////////////////


module sum_filter #(
    parameter WIDTH = 16
    )(
    input wire clk_i,
    input wire rst_i,
    input wire [WIDTH-1:0] data_i,
    output wire [WIDTH-1:0] data_o
    );
    
    reg [WIDTH-1:0] data_q;
    
    assign data_o = data_i + data_q;
    
    
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            data_q <= 'd0;
        end else begin 
            data_q <= data_i;
        end
    end 
    
endmodule
