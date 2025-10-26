`timescale 1ns / 1ps

module immediate_gen(
    input logic [31:0] instruction,
    output logic [31:0] immediate
    );
    
    always_comb begin
        case(instruction[6:0])
            7'b0010011: immediate = {{20{instruction[31]}}, instruction[31:20]}; // I-type
            7'b0000011: immediate = {{20{instruction[31]}}, instruction[31:20]}; // I-type load 
            7'b0100011: immediate = {{20{instruction[31]}}, instruction[31:25] ,instruction[11:7]}; // S-type
            7'b1100011: immediate = {{20{instruction[31]}}, instruction[7], instruction[30:25], instruction[11:8], 1'b0}; //B-type
        endcase
    end
        
    
endmodule
