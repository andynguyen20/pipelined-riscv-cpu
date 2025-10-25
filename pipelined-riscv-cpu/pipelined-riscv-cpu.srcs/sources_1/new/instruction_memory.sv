`timescale 1ns / 1ps

module instruction_memory(
    input logic [31:0] instruction_addr,
    output logic [31:0] instruction
    );
    
    logic [31:0] instruction_mem [63:0];
    
    initial begin
        $readmemb("instruction.mem", instruction_mem);
    end
    
    assign instruction = instruction_mem[instruction_addr[31:2]];
    
endmodule
