`timescale 1ns / 1ps

module datapath(
    input logic clk,
    input logic reset,
    input logic reg_write,
    input logic alu_source,
    input logic alu_control,
    input logic pc_source,
    input logic mem_write,
    input logic mem_read,
    input logic mem_to_reg
    );
    
    logic [31:0] instruction;
    
    instruction_memory im(.instruction_addr(), .instruction(instruction));
    
    register_file rf(.clk(clk), .read_addr1(), .read_addr2(), .write_addr(), .write_en(), .write_data(), .read_data1(), .read_data2());
   
endmodule
