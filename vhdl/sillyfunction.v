`timescale 1ns / 1ps


module sillyfunction(
    input wire a,
    input wire b,
    input wire c,
    output wire y
    );
    
    assign y = ~b & ~c | a & ~b;
    
endmodule
