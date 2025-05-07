//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_regfile
//     Description: Test bench for simple behavorial register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps


`include "./regfile.sv"


// Testbench for the parameterized register file
module tb_regfile;
  parameter n = 32;
  parameter r = 5;
  logic clk;
  logic rst;

  logic [r-1:0] read_addr1; 
   logic [r-1:0] read_addr2;
    logic [r-1:0] write_addr;  

  logic [n-1:0] write_data;
  logic write_en;

  logic [n-1:0] read_data1;
  logic [n-1:0] read_data2;



  regfile #(.n(n), .r(r)) dut(.clk(clk), .rst(rst), .read_addr1(read_addr1), .read_addr2(read_addr2), .write_addr(write_addr), .write_data(write_data), .write_en(write_en), .read_data1(read_data1), .read_data2(read_data2));

  // Clock generation
  initial begin
    write_en = 1;
    clk = 0;
    read_addr1 = 0;
    read_addr2 = 0;
    write_addr = 0;
    write_data = 0;
    forever #5 clk = ~clk;
  end

  initial begin : dump_variables
    $dumpfile("tb_regfile.vcd"); 
    $dumpvars(0, dut);
  end

  initial begin: display_variables
      $monitor ("ns=%ot, clk=%b, rst=%b, read_addr1=%b, read_addr2=%b, write_addr1=%b, write_data=%b, write_en=%b, read_data1=%b, read_data2=%b", $time, clk, rst, read_addr1, read_addr2, write_addr, write_data, write_en, read_data1, read_data2);
  end

  // Test sequence
  initial begin
    write_addr=5'h6;
    write_data=8'hA7;
    #5
    write_addr=5'h2;
    #15 
    read_addr1 = 5'h6;
    write_data = 8'h23;
    write_en = 1;
    #15 write_en = 0;

    write_addr = 5'h05;
    write_data = 8'h15;
    #15 write_en = 1;
    #15 write_en = 0;
    write_data = 0;
    read_addr2 = 5'h05;
    #15 read_addr1 = 5'h5;
    #15;

    $finish;
  end

endmodule