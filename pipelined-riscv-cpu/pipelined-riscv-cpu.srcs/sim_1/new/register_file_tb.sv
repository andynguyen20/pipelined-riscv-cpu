`timescale 1ns / 1ps

module register_file_tb;

    logic clk;
    logic [4:0] read_addr1;
    logic [4:0] read_addr2;
    logic [4:0] write_addr;
    logic write_en;
    logic [31:0] write_data;
    logic [31:0] read_data1;
    logic [31:0] read_data2;
    
    register_file dut ( 
        .clk(clk), 
        .read_addr1(read_addr1), 
        .read_addr2(read_addr2), 
        .write_addr(write_addr), 
        .write_en(write_en), 
        .write_data(write_data),
        .read_data1(read_data1), 
        .read_data2(read_data2));
    
    initial clk = 1'b0;
    always #5 clk = ~clk;
    
    initial begin
        write_addr = 32'd1;
        write_data = 32'd190;
        write_en = 1'b1;
        #10;
        
        write_en = 1'b0;
        read_addr1 = 32'd1;
        #10;
        
        write_addr = 32'd2;
        write_data = 32'd450;
        write_en = 1'b1;
        #10;
        
        write_en = 1'b0;
        read_addr2 = 32'd2;
        #10;
        
        write_addr = 32'd1;
        write_data = 32'd0;
        write_en = 1'b1;
        #10;
        
        $finish;
     end

endmodule