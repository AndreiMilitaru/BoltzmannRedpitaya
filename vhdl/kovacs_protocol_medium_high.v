`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 1st of February 2021
//////////////////////////////////////////////////////////////////////////////////


module kovacs_protocol_medium_high (
    input wire clk_i,
    input wire [15:0] data_i,
    input wire [15:0] data_rescaled_i,
    input wire [31:0] T1_i,
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
               T1_q;
               
    reg state_d, state_q = 1'd0;
    
    assign data_o = data_q;
    assign indicator_o = indicator_q;
    
    always @(posedge clk_i) begin
        data_q <= data_d;
        counter_q <= counter_d;
        counter_previous <= counter_q;
        T1_q <= T1_i;
        state_q <= state_d;
        indicator_q <= indicator_d;
    end
    
    always @(*) begin
        counter_d = (counter_q == T1_q) ? 32'd0 : (counter_q + 1);
        state_d = (counter_q < counter_previous) ? !state_q : state_q;
    end
    
    always @(*) begin
        case(state_q)
            1'd0 : data_d = data_i[15:2];
            1'd1 : data_d = data_rescaled_i[15:2];
            default: data_d = 14'd0;
        endcase
    end
    
    always @(*) begin
        case(state_q)
            1'd0 : indicator_d = 14'd8191;
            1'd1 : indicator_d = 14'd0;
            default: indicator_d = 14'd0;
        endcase
    end
        
        
    
endmodule