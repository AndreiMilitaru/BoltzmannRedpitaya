`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 7th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module low_pass_v2_tb();

    reg clk, reset;
    reg signed [15:0] signal_in;
    
    wire signed [15:0] signal_out1,
                       signal_out2,
                       signal_out3,
                       signal_out4,
                       signal_out5,
                       signal_out6,
                       signal_out7;
                       
    reg signed [31:0] alpha1,
                      alpha2,
                      alpha3,
                      alpha4,
                      alpha5,
                      alpha6,
                      alpha7;
    
    reg signed [15:0] stimuli [0:600000];
    
    reg signed [15:0] responses1 [0:600000],
                      responses2 [0:600000],
                      responses3 [0:600000],
                      responses4 [0:600000],
                      responses5 [0:600000],
                      responses6 [0:600000],
                      responses7 [0:600000];
                      
    reg [19:0] vectornum;

    low_pass_v2 #(.WIDTH(16),
                  .alpha_WIDTH(32)) dut1 (.clk_i(clk),
                                          .rst_i(reset),
                                          .data_i(signal_in),
                                          .alpha_i(alpha1),
                                          .data_o(signal_out1)
                                          );
    low_pass_v2 #(.WIDTH(16),
                .alpha_WIDTH(32)) dut2 (.clk_i(clk),
                                        .rst_i(reset),
                                        .data_i(signal_in),
                                        .alpha_i(alpha2),
                                        .data_o(signal_out2)
                                        ); 
                                        
    low_pass_v2 #(.WIDTH(16),
                  .alpha_WIDTH(32)) dut3 (.clk_i(clk),
                                          .rst_i(reset),
                                          .data_i(signal_in),
                                          .alpha_i(alpha3),
                                          .data_o(signal_out3)
                                          );   
                                          
    low_pass_v2 #(.WIDTH(16),
                .alpha_WIDTH(32)) dut4 (.clk_i(clk),
                                        .rst_i(reset),
                                        .data_i(signal_in),
                                        .alpha_i(alpha4),
                                        .data_o(signal_out4)
                                        );   
                                        
    low_pass_v2 #(.WIDTH(16),
                  .alpha_WIDTH(32)) dut5 (.clk_i(clk),
                                          .rst_i(reset),
                                          .data_i(signal_in),
                                          .alpha_i(alpha5),
                                          .data_o(signal_out5)
                                          );     
                                          
    low_pass_v2 #(.WIDTH(16),
                .alpha_WIDTH(32)) dut6 (.clk_i(clk),
                                        .rst_i(reset),
                                        .data_i(signal_in),
                                        .alpha_i(alpha6),
                                        .data_o(signal_out6)
                                        );             
                                        
    low_pass_v2 #(.WIDTH(16),
                  .alpha_WIDTH(32)) dut7 (.clk_i(clk),
                                          .rst_i(reset),
                                          .data_i(signal_in),
                                          .alpha_i(alpha7),
                                          .data_o(signal_out7)
                                          );                                                                                                                                                                                                 
    
    
    initial begin
        $readmemb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file.tv",stimuli);
        vectornum = 16'd0;
        
        reset = 1'b1;
        
        vectornum = 19'd0;
        
        alpha1 = 32'd42950;
        alpha2 = 32'd429497;
        alpha3 = 32'd4294967;
        alpha4 = 32'd42949673;
        alpha5 = 32'd429496730;
        alpha6 = 32'd2147483648;
        alpha7 = 32'd4294967295;
        
        #100;
        
        reset = 1'b0;
        
        vectornum = 16'd0;
        
        $display("=======================");
        $display("Simulation started");
        $display("=======================");
        $display("\n");
    end
    
    always begin
        clk = 1'b1;
        #64;
        clk = 1'b0;
        #64;
    end
    
    always @(posedge clk) begin
        #1;
        signal_in = stimuli[vectornum];
    end
      
    always @(negedge clk) begin
        if (~reset) begin
            responses1[vectornum] = signal_out1;
            responses2[vectornum] = signal_out2;
            responses3[vectornum] = signal_out3;
            responses4[vectornum] = signal_out4;
            responses5[vectornum] = signal_out5;
            responses6[vectornum] = signal_out6;
            responses7[vectornum] = signal_out7;
            
            vectornum = vectornum + 1;
            if (stimuli[vectornum] === 16'bx) begin
            
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp1.tv",
                            responses1,0,vectornum);
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp2.tv",
                            responses2,0,vectornum);       
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp3.tv",
                            responses3,0,vectornum);                                        
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp4.tv",
                            responses4,0,vectornum);                                        
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp5.tv",
                            responses5,0,vectornum);                                        
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp6.tv",
                            responses6,0,vectornum);                                        
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_resp7.tv",
                            responses7,0,vectornum);        
                                                                 
                $display("=======================");
                $display("End of simulation");
                $finish;
            end
        end
    end
endmodule
