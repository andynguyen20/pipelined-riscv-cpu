`timescale 1ns / 1ps

module datapath(
    input logic clk,
    input logic rst,
    input logic reg_write,
    input logic alu_source,
    input logic [3:0] alu_control,
    input logic pc_source,
    input logic mem_write,
    input logic mem_read,
    input logic mem_to_reg
    );
    
    logic [31:0] instruction;
    logic [31:0] read_data1, read_data2;
    logic [31:0] immediate;
    logic [31:0] immediate_shifted;
    logic [31:0] pc, pc_next;
    logic [31:0] write_data;    
    
    program_counter pc1(
        .clk(clk),
        .rst(rst),
        .pc_next(pc_next),             
        .pc(pc));
    
    instruction_memory im(
        .instruction_addr(pc),         
        .instruction(instruction));
    
    register_file rf(
        .clk(clk), 
        .read_addr1(instruction[19:15]), 
        .read_addr2(instruction[24:20]), 
        .write_addr(instruction[11:7]), 
        .write_en(reg_write), 
        .write_data(write_data),                                          // not filled
        .read_data1(read_data1), 
        .read_data2(read_data2));
        
    immediate_gen ig(
        .instruction(instruction), 
        .immediate(immediate));
        
    left_shift ls(
        .in(immediate),
        .out(immediate_shifted));
        
    logic [31:0] pc_instruction;
    logic [31:0] pc_offset;
    
        
    adder ad(
        .a(pc),
        .b(32'd4),
        .y(pc_instruction));
        
    adder ad1(
        .a(pc),
        .b(immediate_shifted),
        .y(pc_offset));
    
    mux2 m(
        .a(pc_instruction),
        .b(pc_offset),
        .sel(pc_source),
        .y(pc_next));
        
    logic [31:0] alu_input2;
        
    mux2 m1(
        .a(read_data2),
        .b(immediate),
        .sel(alu_source),
        .y(alu_input2));
        
    logic zero;
    logic [31:0] alu_result;
    
    alu al(
        .a(read_data1),
        .b(alu_input2),
        .alu_control(alu_control),
        .alu_result(alu_result),
        .zero(zero));
    
    logic [31:0] read_data;
    
   data_memory dm(
        .clk(clk),
        .addr(alu_result),
        .write_data(read_data2),
        .mem_write(mem_write),
        .mem_read(mem_read),
        .read_data(read_data));
   
    
    mux2 m2(
        .a(alu_result),
        .b(read_data),
        .sel(mem_to_reg),
        .y(write_data));
        
   
endmodule
