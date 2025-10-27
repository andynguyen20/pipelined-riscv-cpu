`timescale 1ns / 1ps

module program_counter(
    input logic clk,
    input logic rst,
    input logic [31:0] pc_next,
    output logic [31:0] pc
    );
    
    always_ff@(posedge clk, posedge rst) begin
        if (rst == 1'b1)
            pc <= 32'd0;
        else
            pc <= pc_next;
    end
         
endmodule
