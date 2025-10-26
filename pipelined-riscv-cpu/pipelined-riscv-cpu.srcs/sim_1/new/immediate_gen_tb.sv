`timescale 1ns / 1ps

module immediate_gen_tb;

    logic [31:0] instruction;
    logic [31:0] immediate;
    
    immediate_gen dut(
        .instruction(instruction), 
        .immediate(immediate));
    
    initial begin
        instruction = 32'b111011000000_00000_000_00000_0010011; //I-type immediate
        
        #10;
        
        instruction = 32'b1111111_00000_00000_010_00100_0100011; //S-type immediate
        
        #10;
        
        instruction = 32'b0000000_00000_00000_000_11111_1100011; // B-type
        
        #10;
        
        $finish;
    end
        

endmodule
