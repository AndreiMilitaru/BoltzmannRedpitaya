//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Institute: Photonics Laboratory, ETH
// Date: 30th November 2018
//////////////////////////////////////////////////////////////////////////////////

module Abs_verilog #
    (
    parameter integer data_width = 16
    )
    (
    // offset value contained in the data_width LSB of GPIO
    input wire [31:0] gpio0_i,
    
    // two's complement 16 bits signed inter
    input wire [data_width-1:0] adc_data_i,
    
    input wire clk_i,
    
    output wire [data_width-1:0] data_o,
    output wire valid_o
    );
    
    wire [data_width-1:0] offset;
    
    // for internal manipulation
    wire [data_width-1:0] data;
    reg [data_width-1:0] data_d = 0;
    reg [data_width-1:0] data_q = 0;
    reg [data_width-1:0] sum = 0;
    
    // synchronization
    wire i_clk;
    reg valid = 0;
    
    // wiring components
    assign i_clk = clk_i;
    assign offset = gpio0_i[data_width-1:0];
    assign data = adc_data_i;
    assign data_o = data_q;
    assign valid_o = valid;
    
    always @(data) begin
        valid = 0;
        sum = data + offset;
        data_d = (sum[data_width-1] & 1) ? (~(sum-1)) : (sum);
        valid = 1;
    end
    
    always @(posedge i_clk) begin
        data_q <= data_d;
    end
    
endmodule
