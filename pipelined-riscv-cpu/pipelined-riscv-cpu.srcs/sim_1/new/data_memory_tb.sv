`timescale 1ns / 1ps

module data_memory_tb;

    logic clk;
    logic [31:0] addr;
    logic [31:0] write_data;
    logic mem_write;
    logic mem_read;
    logic [31:0] read_data;
    
    data_memory dut(
        .clk(clk), 
        .addr(addr), 
        .write_data(write_data), 
        .mem_write(mem_write), 
        .mem_read(mem_read), 
        .read_data(read_data));
        
     initial clk = 1'b0;
     always #5 clk = ~clk;
     
     initial begin
        addr = 32'd1;
        write_data = 32'd108;
        mem_write = 1'b1;
        mem_read = 1'b0;
        #10;
        
        mem_write = 1'b0;
        mem_read = 1'b1;
        #10;
        
        addr = 32'd9;
        write_data = 32'd63;
        mem_write = 1'b1;
        mem_read = 1'b0;
        
        #10;
        
        mem_write = 1'b0;
        mem_read = 1'b1;
        
        #10;
        
        addr = 32'd1;
        mem_write = 1'b1;
        #10;
        
        mem_write = 1'b0;
        #10;
        $finish;
     end
endmodule
