//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: controller
//     Description: 32-bit RISC-based CPU controller (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef CONTROLLER
`define CONTROLLER

`timescale 1ns/100ps

`include "../maindec/maindec.sv"
`include "../aludec/aludec.sv"

module controller(
        input logic [5:0] op, funct,
        input logic zero,
        output logic memtoreg, memwrite,
        output logic pcsrc, alusrc,
        output logic regdst, regwrite,
        output logic jump,
        output logic [3:0] alucontrol
    );

    logic [1:0] aluop;
    logic branch;
    maindec md(op, memtoreg, memwrite, branch, alusrc, regdst, regwrite, jump, aluop);
    aludec ad(funct, aluop, alucontrol);
    assign pcsrc = branch & zero;
endmodule
`endif