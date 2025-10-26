`timescale 1ns / 1ps

module alu(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic [3:0] alu_control,
    output logic [31:0] alu_result,
    output logic zero
    );
    
    always_comb begin
        case(alu_control)
            4'b0000: alu_result = a & b;
            4'b0001: alu_result = a | b;
            4'b0010: alu_result = a + b;
            4'b0110: alu_result = a - b;
            4'b0111: alu_result = ($signed(a) < $signed(b)) ? 32'd1 : 32'd0;
            default: alu_result = 32'd0;
        endcase
        
        assign zero = (alu_result == 32'd0) ? 1'b1 : 1'b0;
        
     end 
    
endmodule
