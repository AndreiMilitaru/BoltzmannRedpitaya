`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// author: Andrei Militaru
// date: 25th of March 2019
//////////////////////////////////////////////////////////////////////////////////


module low_pass_ve #(
    parameter WIDTH = 16
    )(
    input wire clk_i,
    input wire rst_ni,
    input wire signed [WIDTH-1:0] data_i,
    input wire signed [WIDTH-1:0] cutoff_i,
    input wire signed [WIDTH-1:0] gain_i,
    
    output wire signed [2*WIDTH-1:0] out_o,
    output wire signed [WIDTH-1:0] in_sum_o,
    output wire signed [2*WIDTH-1:0] mid_sum_o
    );
    
    reg signed [WIDTH-1:0] data_d, data_q = 0;
    reg signed [2*WIDTH-1:0] out_d, out_q = 0;
    reg signed [WIDTH-1:0] in_sum_d, in_sum_q = 0;
    reg signed [2*WIDTH-1:0] mid_sum_d, mid_sum_q = 0;
    reg signed [2*WIDTH-1:0] temp1, temp2;
    wire signed [WIDTH:0] signed_gain, signed_cutoff;
    
    assign signed_gain = {1'b0,gain_i};
    assign signed_cutoff = {1'b0,cutoff_i};

    assign out_o = out_q;
    assign data_i = data_d;
    assign in_sum_o = in_sum_q;
    assign mid_sum_o = mid_sum_q;

    always @(posedge clk_i, negedge rst_ni) begin
        if (~rst_ni) begin
            out_q <= 0;
            data_q <= 0;
            in_sum_q <= 0;
            mid_sum_q <= 0;
        end else begin
            out_q <= out_d;
            data_q <= data_d;
            in_sum_q <= in_sum_d;
            mid_sum_q <= mid_sum_d;
        end
    end

    always @(*) begin
        in_sum_d = data_q + data_d;
    end
    
    always @(*) begin
        mid_sum_d = signed_gain * in_sum_q;
    end   
           
    always @(*) begin
        temp1 = signed_cutoff * out_q;
        temp2 = temp1 >>> WIDTH;
        out_d = mid_sum_q + temp2;
    end
    
endmodule
