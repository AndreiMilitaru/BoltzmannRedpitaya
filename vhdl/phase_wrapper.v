`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Date: 18th of September 2019
//////////////////////////////////////////////////////////////////////////////////

module phase_wrapper #(
    parameter WIDTH = 14
    )(
    input wire clk_i,
    input wire rst_i,
    input wire signed [WIDTH-1:0] data_i,
    
    output wire signed [WIDTH:0] sum_o
    );
    
    reg signed [WIDTH:0] lower_bound = 'd0;
    reg signed [WIDTH:0] upper_bound = {1'b0,{WIDTH{1'b1}}};
    reg signed [WIDTH:0] sum_d, sum_q;
    
    assign sum_o = sum_q;
    
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            sum_q <= 'd0;
        end else begin
            sum_q <= sum_d;
        end
    end
    
    always @(*) begin
        sum_d = data_i + sum_q;
    end
    
endmodule
