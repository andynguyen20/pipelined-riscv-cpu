`timescale 1ns / 1ps

module program_counter_tb;

    logic clk;
    logic [31:0] pc_next;
    logic [31:0] pc;
    
    program_counter dut(
        .clk(clk), 
        .pc_next(pc_next), 
        .pc(pc));
    
    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        #10;
        pc_next = 32'd900;
        
        #10;
        pc_next = 32'd157;
        
        #10;
        pc_next = 32'd992;
        
        #10;
        $finish;
     end
        

endmodule
