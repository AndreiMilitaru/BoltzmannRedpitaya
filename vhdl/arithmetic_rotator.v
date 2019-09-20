`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Date: 18th of September 2019
//////////////////////////////////////////////////////////////////////////////////

module arithmetic_rotator #(
    parameter WIDTH = 32,
    parameter SHIFT = 16
    )(
    input wire signed [WIDTH-1:0] data_i,
    output wire signed [WIDTH-1:0] right_data_o,
    output wire signed [WIDTH-1:0] left_data_o
    );
    
    assign right_data_o = data_i >>> SHIFT;
    assign left_data_o = data_i <<< SHIFT;
    
endmodule
