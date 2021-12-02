`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// @author: Andrei Militaru
// @date: 9th December 2020
//////////////////////////////////////////////////////////////////////////////////


module protocol_manager(
    input wire [13:0] data1_i,
    input wire [13:0] indicator1_i,
    input wire [13:0] data2_i,
    input wire [13:0] indicator2_i,
    input wire [13:0] data3_i,
    input wire [13:0] indicator3_i,
    input wire [13:0] data4_i,
    input wire [13:0] indicator4_i,
    input wire [13:0] data5_i,
    input wire [13:0] indicator5_i,
    input wire [13:0] DC_i,
    input wire [2:0] protocol_i,
    input wire clk_i,
    
    output wire [13:0] output0_o,
    output wire [13:0] output1_o
    );
    
    reg [13:0] output0_d, output0_q = 14'd0,
               output1_d, output1_q = 14'd0;
               
    assign output0_o = output0_q;
    assign output1_o = output1_q;
    
    always @(posedge clk_i) begin
        output0_q <= output0_d;
        output1_q <= output1_d;
    end
    
    always @(*) begin
        case(protocol_i)
            3'd0: begin
                      output0_d = DC_i;
                      output1_d = DC_i;
                  end
            3'd1: begin
                      output0_d = data1_i;
                      output1_d = indicator1_i;
                  end   
            3'd2: begin
                      output0_d = data2_i;
                      output1_d = indicator2_i;
                  end
            3'd3: begin
                      output0_d = data3_i;
                      output1_d = indicator3_i;
                  end
            3'd4: begin
                      output0_d = data4_i;
                      output1_d = indicator4_i;
                  end
            3'd5: begin
                      output0_d = data5_i;
                      output1_d = indicator5_i;
                  end
            default: begin
                      output0_d = 14'd0;
                      output1_d = 14'd0;
                  end
        endcase
    end
    
endmodule
