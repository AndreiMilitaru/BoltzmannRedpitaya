`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Author: Andrei Militaru
// date: 19th of September 2019
//////////////////////////////////////////////////////////////////////////////////


module phase_wrapper_tb();
    reg clk, reset;
    reg signed [13:0] signal_in;
    reg [16:0] iteration;
    wire signed [13:0] signal_out;
    wire signed [14:0] sum_out;
    wire signed [13:0] shifted_out;
    wire signed [14:0] upper_bound;
    wire signed [14:0] lower_bound;
    
    phase_wrapper dut (
        .clk_i(clk),
        .rst_i(reset),
        .data_i(signal_in),
        .data_o(signal_out),
        .sum_o(sum_out),
        .shifted_o(shifted_out),
        .upper_bound_o(upper_bound),
        .lower_bound_o(lower_bound)
    );
    
    initial begin
        reset = 1'b1;
        #100;
        signal_in = 14'd100;
        reset = 1'b0;
        iteration = 16'd0;
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
    
    always @(negedge clk) begin
        if (~reset) begin
        
        
            $display("Input number: %d",signal_in);
            $display("Shifted input is: %d", shifted_out);
            $display("Sum is: %d", sum_out);
            
            $display("Lower bound is: %d", lower_bound);
            $display("Upper bound is: %d", upper_bound);
            $display("Wrapped output is: %d", signal_out);
            $display("---\n");
            signal_in = signal_in + 16'd200;
            
            if (iteration == 16'd100) begin
                $display("=======================");
                $display("End of simulation");
                $finish;
            end
        end
    end    
    
endmodule
