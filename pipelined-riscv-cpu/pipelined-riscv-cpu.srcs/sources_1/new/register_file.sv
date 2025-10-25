`timescale 1ns / 1ps

module register_file(
    input logic clk,
    input logic [4:0] read_addr1,
    input logic [4:0] read_addr2,
    input logic [4:0] write_addr,
    input logic write_en,
    input logic [31:0] write_data,
    output logic [31:0] read_data1,
    output logic [31:0] read_data2 
    );
    
    logic [31:0] registers [31:0];
    
    assign read_data1 = (read_addr1 != 5'b00000) ? registers[read_addr1] : 32'd0;
    assign read_data2 = (read_addr2 != 5'b00000) ? registers[read_addr2] : 32'd0;
    
    always_ff@(posedge clk) begin
        if(write_en & write_addr != 5'd0) 
            registers[write_addr] <= write_data;
    end
            
endmodule
