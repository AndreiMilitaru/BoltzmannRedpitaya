`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 7th December 2020
//////////////////////////////////////////////////////////////////////////////////


module kovacs_protocols (
    input wire clk_i,
    input wire [15:0] data_i,
    input wire [31:0] T1_i,
    input wire [31:0] T2_i,
    output wire [13:0] data0_o,
    output wire [13:0] data1_o,
    output wire [13:0] indicator0_o,
    output wire [13:0] indicator1_o
    );
              
    reg [13:0] data_d = 0, 
               data_q;
              
    reg [31:0] counter1_d = 0, 
               counter1_q, 
               counter2_d = 0, 
               counter2_q;
               
    reg [1:0] sel_d = 0,
              sel_q;
              
    reg ready_flag_d, ready_flag_q;
    
    assign data_o = data_q;
    
    always @(posedge clk_i) begin
        data_q <= data_d;
        sel_q <= sel_d;
        counter1_q <= counter1_d;
        counter2_q <= counter2_d;
        ready_flag_q <= ready_flag_d;
    end
    
    
    
    always @(*) begin
        out_d = data_d + data_q0;
    end
    
endmodule
