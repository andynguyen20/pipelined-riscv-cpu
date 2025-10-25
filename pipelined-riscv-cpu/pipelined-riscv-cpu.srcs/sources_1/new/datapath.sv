`timescale 1ns / 1ps

module datapath(
    input logic clk, 
    input logic rst,
    output logic [31:0] instruction
    );
    
    wire [31:0] addr;
    wire [31:0] addr1;
    program_counter pc(.clk(clk), .rst(rst), .pc_next(addr1), .pc(addr));
    adder ad(.a(32'd4), .b(addr), .y(addr1));
    
    
    instruction_memory im(.instruction_addr(addr), .instruction(instruction));
    
endmodule
