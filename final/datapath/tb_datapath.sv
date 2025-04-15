//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_datapath
//     Description: Test bench for simple behavorial datapath
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps

`include "datapath.sv"

module datapath_tb;

  parameter n = 32;

  logic clk, reset;
  logic memtoreg, pcsrc;
  logic alusrc, regdst;
  logic regwrite, jump;
  logic [2:0] alucontrol;
  logic [n-1:0] instr;
  logic [n-1:0] readdata;

  wire zero;
  wire [n-1:0] pc;
  wire [n-1:0] aluout;
  wire [n-1:0] writedata;

  // Instantiate datapath
  datapath #(n) dut (
    .clk(clk), .reset(reset),
    .memtoreg(memtoreg), .pcsrc(pcsrc),
    .alusrc(alusrc), .regdst(regdst),
    .regwrite(regwrite), .jump(jump),
    .alucontrol(alucontrol),
    .zero(zero),
    .pc(pc),
    .instr(instr),
    .aluout(aluout),
    .writedata(writedata),
    .readdata(readdata)
  );

  // Clock generation: 10ns period
  always #5 clk = ~clk;

  initial begin
    $dumpfile("datapath_tb.vcd");
    $dumpvars(0, datapath_tb);

    clk = 0;
    reset = 1;
    memtoreg = 0;
    pcsrc = 0;
    alusrc = 0;
    regdst = 0;
    regwrite = 0;
    jump = 0;
    alucontrol = 3'b010; // default to ADD
    instr = 32'b0;
    readdata = 32'b0;

    // Apply reset
    #10;
    reset = 0;

    // Test 1: ADD $3 = $1 + $2
    // Fake instruction: $rd = $rs + $rt
    instr = {6'b000000, 5'd1, 5'd2, 5'd3, 5'd0, 6'b100000}; // R-type ADD: $3 = $1 + $2
    regdst = 1;
    regwrite = 1;
    alusrc = 0;
    alucontrol = 3'b010;  // ADD
    #10;

    // Test 2: SUB $4 = $1 - $2
    instr = {6'b000000, 5'd1, 5'd2, 5'd4, 5'd0, 6'b100010}; // R-type SUB: $4 = $1 - $2
    alucontrol = 3'b110; // SUB
    #10;

    // Test 3: ADDI $5 = $1 + imm
    instr = {6'b001000, 5'd1, 5'd5, 16'd10}; // I-type ADDI
    regdst = 0;
    alusrc = 1;
    alucontrol = 3'b010; // ADD
    #10;

    // Test 4: Load word simulation (simulate memory read data)
    memtoreg = 1;
    readdata = 32'hABCD1234;
    instr = {6'b100011, 5'd1, 5'd6, 16'd0}; // lw $6, 0($1)
    regdst = 0;
    regwrite = 1;
    alusrc = 1;
    #10;

    // End simulation
    #20;
    $finish;
  end

endmodule