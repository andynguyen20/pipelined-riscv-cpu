`timescale 1ns / 1ps

module datapath_tb;

   logic clk;
   logic rst;
   logic reg_write;
   logic alu_source;
   logic [3:0] alu_control;
   logic pc_source;
   logic mem_write;
   logic mem_read;
   logic mem_to_reg;
   
   datapath dut(
       .clk(clk),
       .rst(rst),
       .reg_write(reg_write),
       .alu_source(alu_source),
       .alu_control(alu_control),
       .pc_source(pc_source),
       .mem_write(mem_write),
       .mem_read(mem_read),
       .mem_to_reg(mem_to_reg));
       
   initial clk = 1'b0;
   always #5 clk = ~clk;
   
   initial begin
        rst = 1'b1;
        #10;
        rst = 1'b0;
        
        
        pc_source = 1'b0;
        alu_source = 1'b0;
        alu_control = 4'b0010;
        reg_write = 1'b1;
        mem_write = 1'b0;
        mem_read = 1'b0;
        mem_to_reg = 1'b0;
        #10;
        
        
         pc_source = 1'b0;
        alu_source = 1'b0;
        alu_control = 4'b0000;
        reg_write = 1'b0;
        mem_write = 1'b0;
        mem_read = 1'b0;
        mem_to_reg = 1'b0;
        
        
        
        $finish;
    end
    
endmodule
