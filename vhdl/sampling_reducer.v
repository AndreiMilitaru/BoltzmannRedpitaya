`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 4th April 2019
//////////////////////////////////////////////////////////////////////////////////


module sampling_reducer #(
    parameter WIDTH = 16
    )(
    input wire clk_i,
    input wire [WIDTH-1:0] data_i,
    output wire [WIDTH-1:0] data_o
    );
              
    reg [WIDTH-1:0] data_d, 
                    data_q0;

    reg [WIDTH:0] out_d, out_q;
    assign data_o = out_q[WIDTH:1];
    assign data_i = data_d;
    
    always @(posedge clk_i) begin
        out_q <= out_d;
    end
    
    always @(*) begin
        out_d = data_d + data_q0;
    end
    
endmodule
