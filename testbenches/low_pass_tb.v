`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 3rd of April 2019
//////////////////////////////////////////////////////////////////////////////////


module low_pass_tb();

    reg clk, reset;
    reg signed [15:0] signal_in;
    wire signed [15:0] in_sum;
    reg signed [15:0] stimuli [0:1000];
    reg [15:0] vectornum;

    sum_filter #(.WIDTH(16)) dut (
        .clk_i(clk),
        .rst_i(reset),
        .data_i(signal_in),
        .data_o(in_sum)
    );
    
    initial begin
        $readmemb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file.tv",stimuli);
        vectornum = 16'd0;
        
        reset = 1'b1;
        #1;
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
        if (vectornum == 16'd5) begin
            reset = 1;
            #2;
            reset = 0;
        end
    end
      
    always @(negedge clk) begin
        if (~reset) begin
            $display("Input number: %d",vectornum);
            $display("Stimulus is: %d", signal_in);
            $display("in_sum is: %d", in_sum);
            $display("---\n");
            
            vectornum = vectornum + 1;
            if (stimuli[vectornum] === 16'bx) begin
                $display("=======================");
                $display("End of simulation");
                $finish;
            end
        end
    end
endmodule
