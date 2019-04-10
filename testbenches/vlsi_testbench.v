`timescale 1ns / 1ps

module vlsi_testbench();

    reg a,b,c;
    wire y;
    
    sillyfunction dut (.a(a), .b(b), .c(c), .y(y));
    
    initial begin
        a = 0;
        b = 0;
        c = 0;
        #10;
        $display("y is %b", y);
        c = 1;
        #10;
        $display("y is %b", y);
        b = 1;
        c = 0;
        #10;
        $display("y is %b", y);
    end

endmodule
