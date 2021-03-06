`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 7th December 2020
//////////////////////////////////////////////////////////////////////////////////


module kovacs_protocol1 (
    input wire clk_i,
    input wire [15:0] data_i,
    input wire [15:0] data_rescaled_i,
    input wire [15:0] data_low_i,
    input wire [31:0] T1_i,
    input wire [31:0] T2_i,
    output wire [13:0] data_o,
    output wire [13:0] indicator_o
    );
              
    reg [13:0] data_d, 
               data_q = 14'd0,
               indicator_d,
               indicator_q = 14'd0;
              
    reg [31:0] counter_d, 
               counter_q = 32'd0,
               counter_previous,
               T1_q,
               T2_q;
               
    reg [1:0] state_d, state_q = 2'd0;
    
    assign data_o = data_q;
    assign indicator_o = indicator_q;
    
    always @(posedge clk_i) begin
        data_q <= data_d;
        counter_q <= counter_d;
        counter_previous <= counter_q;
        T1_q <= T1_i;
        T2_q <= T2_i;
        state_q <= state_d;
        indicator_q <= indicator_d;
    end

    
    always @(*) begin
        case(state_q)
            2'd0 : begin
                       counter_d = (counter_q == T1_q) ? 32'd0 : (counter_q + 1);
                       state_d = (counter_q < counter_previous) ? 2'd2 : 2'd0;
                   end
            2'd1 : begin
                       counter_d = (counter_q == T1_q) ? 32'd0 : (counter_q + 1);
                       state_d = (counter_q < counter_previous) ? 2'd0 : 2'd1;
                   end
            2'd2 : begin
                       counter_d = (counter_q == T2_q) ? 32'd0 : (counter_q + 1);
                       state_d = (counter_q < counter_previous) ? 2'd1 : 2'd2;
                   end
            default : begin
                       counter_d = 32'd0;
                       state_d = 2'd0;
                   end
        endcase
    end
    
    always @(*) begin
        case(state_q)
            2'd0 : data_d = data_i[15:2];
            2'd1 : data_d = data_rescaled_i[15:2];
            2'd2 : data_d = data_low_i[15:2];
            default: data_d = data_low_i[15:2];
        endcase
    end
    
    always @(*) begin
        case(state_q)
            2'd0 : indicator_d = 14'd8191;
            2'd1 : indicator_d = 14'd4096;
            2'd2 : indicator_d = 14'd0;
            default: indicator_d = 14'd0;
        endcase
    end
        
        
    
endmodule
