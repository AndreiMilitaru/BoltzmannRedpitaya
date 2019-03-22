`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// Institute: Photonics Laboratory, ETH
// Date: 5th of December 2018
//////////////////////////////////////////////////////////////////////////////////


module wire_v2(
        input wire [15:0] adc_data_i,
        
        output wire [15:0] adc_data_o
    );
    
    assign adc_data_o = ((adc_data_i[15] == 1'b1) ? (-adc_data_i) : (adc_data_i));
    //assign adc_data_o = adc_data_i;
endmodule