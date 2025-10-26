`timescale 1ns / 1ps

module data_memory(
    input clk,
    input logic [31:0] addr,
    input logic [31:0] write_data,
    input logic mem_write,
    input logic mem_read,
    output logic [31:0] read_data
    );
    
    logic [31:0] memory [63:0];
    
    always_ff@(posedge clk) begin
        if(mem_write == 1'b1) 
            memory[addr[31:2]] <= write_data;
    end
    
    always_comb begin
        if(mem_read == 1'b1)
            read_data = memory[addr[31:2]];
    end
    
    
endmodule
