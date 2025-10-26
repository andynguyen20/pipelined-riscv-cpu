`timescale 1ns / 1ps

module mux2(
    input logic [31:0] a,
    input logic [31:0] b,
    input logic sel,
    output logic [31:0] y
    );
    
    assign y = (sel == 1'b1) ? b : a;
    
endmodule
