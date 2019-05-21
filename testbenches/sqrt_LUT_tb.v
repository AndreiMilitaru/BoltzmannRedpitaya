`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 10th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module sqrt_LUT_tb();

    reg clk, reset;
    reg signed [15:0] signal_in;
    wire signed [15:0] signal_out;
    reg signed [15:0] stimuli [0:60000];
    
    reg signed [15:0] responses [0:60000];
    
    reg [15:0] vectornum;

    sqrtLUT dut (
        .clk_i(clk),
        .rst_i(reset),
        .data_i(signal_in),
        .data_o(signal_out)
    );
    
    initial begin
        $readmemb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_sine.tv",stimuli);
        reset = 1'b1;
        #100;
        vectornum = 16'd0;
        reset = 1'b0;
        $display("=======================");
        $display("Simulation started");
        $display("=======================");
        $display("\n");
    end
    
    always begin
        clk = 1'b1;
        #32;
        clk = 1'b0;
        #32;
    end
    
    always @(posedge clk) begin
        #1;
        signal_in = stimuli[vectornum];
    end
      
    always @(negedge clk) begin
        if (~reset) begin
            responses[vectornum] = signal_out;
            vectornum = vectornum + 1;
            if (stimuli[vectornum] === 16'bx) begin
                $writememb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_sine_out.tv",
                            responses);
                $display("=======================");
                $display("End of simulation");
                $finish;
            end
        end
    end
endmodule
