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
    input wire [WIDTH-1:0] data_i,
    input wire [WIDTH-1:0] cutoff_i,
    
    output wire [WIDTH-1:0] out_o
    );
    
    reg [WIDTH-1:0] data_d, data_q;
    reg [WIDTH-1:0] out_d, out_q;

    assign out_o = data_q;
    assign data_i = data_d;

    always @(posedge clk_i, negedge rst_ni) begin
        if (~rst_ni) begin
            out_q <= 0;
            data_q <= 0;
        end else begin
            out_q <= out_d;
            data_q <= data_d;
        end
    end

    always @(*) begin
        data

endmodule
