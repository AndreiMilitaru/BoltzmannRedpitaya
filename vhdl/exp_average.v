`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// author: Andrei Militaru
// date: 4th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module exp_average #(
    parameter WIDTH = 16,
    parameter alpha_WIDTH = 32,
    parameter CARRY =  $clog2(WIDTH),
    parameter alpha_CARRY =  $clog2(alpha_WIDTH + 1)
    )(
    
    input wire clk_i,
    input wire rst_i,
    input wire signed [WIDTH-1:0] data_i,
    input wire [alpha_WIDTH-1:0] alpha_i,
    
    output wire signed [WIDTH-1:0] data_o
    );
    
    wire signed [alpha_WIDTH:0] signed_alpha;
    reg signed [WIDTH - 1 : 0] out_d, out_q;
    reg signed [WIDTH + CARRY - 1 : 0] difference;
    reg signed [alpha_WIDTH + WIDTH + CARRY : 0] adjustment, temp;
    reg signed [alpha_WIDTH : 0] scaled_adjustment;
    reg signed [alpha_WIDTH + alpha_CARRY - 1 : 0] scaled_out_d, scaled_out_q;
    
    assign data_o = out_q;
    assign signed_alpha = {1'b0,alpha_i};
    
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            out_q <= 0;
            scaled_out_q <= 0;
        end else begin
            out_q <= out_d;
            scaled_out_q <= scaled_out_d;
        end
    end
    
    always @(*) begin
        difference = data_i - out_q;
        adjustment = signed_alpha * difference;
        temp = adjustment >>> alpha_WIDTH;
        scaled_adjustment = temp[alpha_WIDTH : 0]; 
        scaled_out_d = scaled_out_q + scaled_adjustment;
        out_d = scaled_out_d[WIDTH - 1 : 0];
    end
    
endmodule
