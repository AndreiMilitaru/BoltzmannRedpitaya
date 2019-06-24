`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 24th of June 2019
//////////////////////////////////////////////////////////////////////////////////


module input_extractor(
    input wire [31:0] bundle_i,
    output wire [15:0] adcA_o,
    output wire [15:0] adcB_o
    );
    
    assign adcA_o = bundle_i[15:0] <<< 2;
    assign adcB_o = bundle_i[31:16] <<< 2;
    
endmodule
