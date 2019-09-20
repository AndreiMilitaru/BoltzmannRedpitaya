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
    
    output wire signed [WIDTH-1:0] data_o,
    output wire signed [WIDTH:0] sum_o,
    output wire signed [WIDTH-1:0] shifted_o,
    output wire signed [WIDTH:0] lower_bound_o,
    output wire signed [WIDTH:0] upper_bound_o
    );
    
    reg signed [WIDTH:0] lower_bound = 'd0;
    reg signed [WIDTH:0] upper_bound = {1'b0,{WIDTH{1'b1}}};
    reg signed [WIDTH:0] temp;
    reg [WIDTH-1:0] wrapped_d, wrapped_q;
    reg signed [WIDTH:0] sum_d, sum_q;
    reg signed [WIDTH-1:0] data_q, data_q0;
    
    
    assign data_o = wrapped_q;
    assign sum_o = sum_q;
    assign lower_bound_o = lower_bound;
    assign upper_bound_o = upper_bound;
    assign shifted_o = data_q;
    
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            data_q <= 'd0;
            data_q0 <= 'd0;
            sum_q <= 'd0;
            wrapped_q <= 'd0;
        end else begin
            data_q <= data_q0;
            data_q0 <= data_i;
            wrapped_q <= wrapped_d;
            sum_q <= sum_d;
        end
    end
    
    always @(*) begin
        sum_d = data_q0 + sum_q;
    end
    
    always @(*) begin
        if (sum_q > upper_bound) begin    
            temp = sum_q - upper_bound;
            wrapped_d = temp[WIDTH-1:0];
        end else begin
            if (sum_q < lower_bound) begin
                temp = sum_q + upper_bound;
                wrapped_d = temp[WIDTH-1:0];
            end else begin
                wrapped_d = sum_q[WIDTH-1:0];
            end
        end
    end
    
endmodule
