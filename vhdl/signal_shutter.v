`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 1st December 2021
//////////////////////////////////////////////////////////////////////////////////


module signal_shutter(
    input wire clk_i,
    input wire [15:0] switch_i,
    input wire [31:0] beam_off_i,
    input wire [31:0] beam_on_i,
    input wire [31:0] feedback_off_i,
    input wire [31:0] feedback_on_i,
    output wire beam_o,
    output wire feedback_o
    );
           
reg [15:0] switch_d,
           switch_q = 16'd0;
           
//reg beam_d, beam_q = 1'd0;
//reg feedback_d, feedback_q = 1'd0;
reg beam_shut_d, beam_shut_q = 1'd0;
reg feedback_shut_d, feedback_shut_q = 1'd0;

reg [31:0] feedback_off_q = 32'd0;
reg [31:0] feedback_on_q = 32'd0;
reg [31:0] beam_off_q = 32'd0;
reg [31:0] beam_on_q = 32'd0;

reg [31:0] beam_counter_d, beam_counter_previous = 32'd0, beam_counter_q = 32'd0;
reg [31:0] beam_counter_up_d, beam_counter_up_previous = 32'd0, beam_counter_up_q = 32'd0;
reg [31:0] feedback_counter_d, feedback_counter_previous = 32'd0, feedback_counter_q = 32'd0;
reg [31:0] feedback_counter_up_d, feedback_counter_up_previous = 32'd0, feedback_counter_up_q = 32'd0;
reg state_d, state_q = 1'd0, state_previous = 1'd0;
           
assign beam_o = beam_shut_q;
assign feedback_o = feedback_shut_q;

    //flip flops
    always @(posedge clk_i) begin
        switch_q <= switch_d;
        beam_shut_q <= beam_shut_d;
        feedback_shut_q <= feedback_shut_d;
        
        beam_counter_q <= beam_counter_d;
        beam_counter_previous <= beam_counter_q;
        beam_counter_up_q <= beam_counter_up_d;
        beam_counter_up_previous <= beam_counter_up_q;
        
        feedback_counter_q <= feedback_counter_d;
        feedback_counter_previous <= feedback_counter_q;
        feedback_counter_up_q <= feedback_counter_up_d;
        feedback_counter_up_previous <= feedback_counter_up_q;
        
        beam_off_q <= beam_off_i;
        beam_on_q <= beam_on_i;
        feedback_off_q <= feedback_off_i;
        feedback_on_q <= feedback_on_i;
        
        state_q <= state_d;
        state_previous = state_q;
        //beam_q <= beam_d;
        //feedback_q <= feedback_d;
    end
    
    //state control
    always @(*) begin
        switch_d = switch_i;
        if ($signed(switch_q) > $signed(16'd8192)) begin
            state_d = 1'd1;
        end else begin
            state_d = 1'd0;
        end
    end
    
    // beam signal control
    always @(*) begin
        case(state_q)
            2'd0 : begin
                       beam_counter_up_d = 32'd0;
                       beam_counter_d = 32'd0;
                       beam_shut_d = 1'd0;
                   end
            2'd1 : begin
                      if (state_previous == 1'd1) begin
                           if (beam_shut_q == 1'd0) begin
                               beam_counter_up_d = 32'd0;
                               beam_counter_d = (beam_counter_q == beam_on_q) ? 32'd0 : (beam_counter_q + 1);
                               beam_shut_d = (beam_counter_q < beam_counter_previous) ? 1'd1 : 1'd0;
                           end else begin
                               beam_counter_d = 32'd0;
                               beam_counter_up_d = (beam_counter_up_q == beam_off_q) ? 32'd0 : (beam_counter_up_q + 1);
                               beam_shut_d = (beam_counter_up_q < beam_counter_up_previous) ? 1'd0 : 1'd1;
                           end
                      end else begin
                           beam_shut_d = 1'd1;
                           beam_counter_d = 32'd0;
                           beam_counter_up_d = 32'd0;
                       end 
                   end
            default: begin
                       beam_counter_up_d = 32'd0;
                       beam_counter_d = 32'd0;
                       beam_shut_d = 1'd0;
                   end
        endcase
    end
    
    
    // feedback signal control
    always @(*) begin
        case(state_q)
            2'd0 : begin
                       feedback_counter_up_d = 32'd0;
                       feedback_counter_d = 32'd0;
                       feedback_shut_d = 1'd0;
                   end
            2'd1 : begin
                        if (state_previous == 1'd1) begin
                               if (feedback_shut_q == 1'd0) begin
                                   feedback_counter_up_d = 32'd0;
                                   feedback_counter_d = (feedback_counter_q == feedback_on_q) ? 32'd0 : (feedback_counter_q + 1);
                                   feedback_shut_d = (feedback_counter_q < feedback_counter_previous) ? 1'd1 : 1'd0;
                               end else begin
                                   feedback_counter_d = 32'd0;
                                   feedback_counter_up_d = (feedback_counter_up_q == feedback_off_q) ? 32'd0 : (feedback_counter_up_q + 1);
                                   feedback_shut_d = (feedback_counter_up_q < feedback_counter_up_previous) ? 1'd0 : 1'd1;
                               end
                          end else begin
                               feedback_shut_d = 1'd1;
                               feedback_counter_d = 32'd0;
                               feedback_counter_up_d = 32'd0;
                          end
                   end
            default: begin
                       feedback_counter_up_d = 32'd0;
                       feedback_counter_d = 32'd0;
                       feedback_shut_d = 1'd0;
                   end
        endcase
    end

endmodule