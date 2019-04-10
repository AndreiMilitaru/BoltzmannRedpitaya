`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 5th of April 2019
//////////////////////////////////////////////////////////////////////////////////


module exp_filter_ve_tb();

    reg clk, reset;
    reg signed [15:0] signal_in;
    wire signed [15:0] signal_out;
    reg signed [15:0] stimuli [0:200000];
    
    //wire signed [19:0] difference;
    //wire signed [51:0] adjustment;
    //wire signed [36:0] scaled_out;
    //wire signed [31:0] scaled_adjustment;
    
    reg signed [15:0] responses [0:200000];
    
    reg [15:0] vectornum;
    reg [31:0] alpha;

    exp_filter_ve #(.WIDTH(16), .alpha_WIDTH(32)) dut (
        .clk_i(clk),
        .rst_i(reset),
        .data_i(signal_in),
        .alpha_i(alpha),
        .data_o(signal_out)//,
        //.difference_o(difference),
        //.adjustment_o(adjustment),
        //.scaled_out_o(scaled_out),
        //.scaled_adjustment_o(scaled_adjustment)
    );
    
    initial begin
        $readmemb("C:/red-pitaya/temp/boltzmann_redpitaya/python_scripts/tb_file_sine.tv",stimuli);
        vectornum = 16'd0;
        alpha = 32'd2147484;
        reset = 1'b1;
        #100;
        reset = 1'b0;
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
            $display("Input number: %d",vectornum);
            $display("Stimulus is: %d", signal_in);
            $display("Output is: %d", signal_out);
            //$display("Difference is: %d", difference);
            //$display("Adjustment is: %d", adjustment);
            //$display("Scaled_adjustment is: %d", scaled_adjustment);
            //$display("scaled_out is: %d", scaled_out);
            $display("---\n");
            
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
