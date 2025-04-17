//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: datapath
//     Description: simple behavorial datapath
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef DATAPATH
`define DATAPATH

`timescale 1ns/100ps

`include "../regfile/regfile.sv"
`include "../regfile/register.sv"
`include "../alu/alu.sv"
`include "../dff/dff.sv"
`include "../adder/adder.sv"
`include "../sl2/sl2.sv"
`include "../mux2/mux2.sv"
`include "../signext/signext.sv"

module datapath
  #(parameter n = 32)(
  input  logic clk, 
  input logic rst,
  input  logic memtoreg, 
  input logic pcsrc,
  input  logic alusrc, 
  input logic regdst,
  input  logic regwrite, 
  input logic jump,
  input  logic [2:0]  alucontrol,    // alu.sv expects 4-bit S
  output logic zero,
  output logic [(n-1):0] pc,
  input  logic [(n-1):0] instr,
  output logic [(n-1):0] aluout, 
  output logic [(n-1):0] writedata,
  input  logic [(n-1):0] readdata
);

  logic [4:0] writereg;
  logic [(n-1):0] pcnext; 
  logic [(n-1):0] pcnextbr; 
  logic [(n-1):0] pcplus4; 
  logic [(n-1):0] pcbranch;
  logic [(n-1):0] signimm;
  logic [(n-1):0] signimmsh;
  logic [(n-1):0] srca;
  logic [(n-1):0] srcb;
  logic [(n-1):0] result;

  // Next PC Logic
  register pcreg(clk, rst, 1'b1, pcnext, pc);  // enable always 1
  adder pcadd1(pc, 32'b100, pcplus4);
  sl2 immsh(signimm, signimmsh);
  adder pcadd2(pcplus4, signimmsh, pcbranch);
  mux2 #(n) pcbrmux(pcplus4, pcbranch, pcsrc, pcnextbr);
  mux2 #(n) pcmux(pcnextbr, {pcplus4[31:28], instr[25:0], 2'b00}, jump, pcnext);

  // Register File Logic
  regfile rf(clk, rst, instr[25:21], instr[20:16], writereg, result, regwrite, srca, writedata);
  mux2 #(5) wrmux(instr[20:16], instr[15:11], regdst, writereg);
  mux2 #(n) resmux(aluout, readdata, memtoreg, result);
  signext se(instr[15:0], signimm);

  // ALU Logic
  mux2 #(n) srcbmux(writedata, signimm, alusrc, srcb);
  alu #(n) alu(srca, srcb, alucontrol, aluout);

  assign zero = (aluout == 0);  // zero flag

endmodule

`endif // DATAPATH