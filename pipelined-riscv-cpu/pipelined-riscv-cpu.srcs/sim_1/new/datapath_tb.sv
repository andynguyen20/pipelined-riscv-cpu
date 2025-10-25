`timescale 1ns / 1ps

module datapath_tb;

    logic clk;
    logic rst;
    logic [31:0] instruction;
    
    datapath dut(
        .clk(clk), 
        .rst(rst),
        .instruction(instruction));
    
    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        rst = 1'b1;
        #10;
        rst = 1'b0;
        #60;
        $finish;
    end
    
endmodule
