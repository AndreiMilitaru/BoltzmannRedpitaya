`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 26th of June 2019
//////////////////////////////////////////////////////////////////////////////////


module coarse_adjuster #(
    parameter WIDTH = 16
    )(
    input wire [WIDTH-1:0] data_i,
    input wire [2:0] adj_i,
    
    output wire [WIDTH-1:0] data_o
    );
    
    wire [WIDTH-1:0] adjusted_0,
                     adjusted_1,
                     adjusted_2,
                     adjusted_3,
                     adjusted_4,
                     adjusted_5,
                     adjusted_6,
                     adjusted_7;
    
    assign adjusted_0[WIDTH-1:0] = data_i;
    assign adjusted_1[WIDTH-1:0] = data_i <<< 1;
    assign adjusted_2[WIDTH-1:0] = data_i <<< 2;
    assign adjusted_3[WIDTH-1:0] = data_i <<< 3;
    assign adjusted_4[WIDTH-1:0] = data_i <<< 4;
    assign adjusted_5[WIDTH-1:0] = data_i <<< 5;
    assign adjusted_6[WIDTH-1:0] = data_i <<< 6;
    assign adjusted_7[WIDTH-1:0] = data_i <<< 7;  
    
    assign data_o = (adj_i[2] == 1'b0)   ?  ( 
                                            (adj_i[1] == 1'b0)   ?  (
                                                                    (adj_i[0] == 1'b0)  ?
                                                                                            adjusted_0
                                                                                        :   adjusted_1)
                                                                 :  (
                                                                    (adj_i[0] == 1'b0)  ?
                                                                                            adjusted_2
                                                                                        :
                                                                                            adjusted_3))
                                         :  (
                                            (adj_i[1] == 1'b0)  ?   (
                                                                    (adj_i[0] == 1'b0)  ?
                                                                                            adjusted_4
                                                                                        :   adjusted_5)
                                                                :   (
                                                                    (adj_i[0] == 1'b0)  ?
                                                                                            adjusted_6
                                                                                        :
                                                                                            adjusted_7));
    
endmodule
