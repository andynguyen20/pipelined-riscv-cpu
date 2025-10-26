`timescale 1ns / 1ps

module left_shift(
    input logic [31:0] in,
    output logic [31:0] out
    );
    
    assign out = in << 1'b1;
    
endmodule
