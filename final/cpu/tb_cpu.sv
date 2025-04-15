//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_cpu
//     Description: Test bench for simple behavorial cpu
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps

`include "cpu.sv"

module cpu_tb;

  parameter n = 32;

  logic clk, reset;
  logic [n-1:0] instr;
  logic memwrite;
  logic [n-1:0] pc, aluout, writedata, readdata;

  // Instantiate CPU
  cpu #(n) dut (
    .clk(clk), .reset(reset),
    .pc(pc),
    .instr(instr),
    .memwrite(memwrite),
    .aluout(aluout),
    .writedata(writedata),
    .readdata(readdata)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    $dumpfile("tb_cpu.vcd");
    $dumpvars(0, dut);
  end


  initial begin: display_variables
      $monitor ("ns=%ot, clk=%b, reset=%b, pc=%b, intsr=%b, memwrite=%b, aluout=%b, writedata=%b, readdata=%b", $time, clk, reset, pc, instr, memwrite, aluout, writedata, readdata);
  end

  initial begin
    clk = 0;
    reset = 1;
    instr = 32'b0;
    readdata = 32'b0;

    // Apply reset pulse
    #10;
    reset = 0;

    // Wait a bit
    #10;

    // Simulate instruction fetch and execution
    // Example 1: R-type ADD $3 = $1 + $2
    instr = {6'b000000, 5'd1, 5'd2, 5'd3, 5'd0, 6'b100000}; // add $3, $1, $2
    #10;

    // Example 2: I-type ADDI $4 = $1 + 10
    instr = {6'b001000, 5'd1, 5'd4, 16'd10};  // addi $4, $1, 10
    #10;

    // Example 3: lw $5, 0($1)
    instr = {6'b100011, 5'd1, 5'd5, 16'd0};  // lw $5, 0($1)
    readdata = 32'hDEADBEEF; // simulate memory read data
    #10;

    // Example 4: sw $6, 0($1)
    instr = {6'b101011, 5'd1, 5'd6, 16'd0};  // sw $6, 0($1)
    #10;

    // Finish simulation
    #20;
    $finish;
  end

endmodule