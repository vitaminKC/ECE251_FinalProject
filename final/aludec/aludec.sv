//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: aludec
//     Description: 32-bit RISC ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALUDEC
`define ALUDEC

`timescale 1ns/100ps

module aludec(input logic [5:0] funct,
              input logic [1:0] aluop,
              output logic [3:0] alucontrol);
    always_comb
        case(aluop)
            2'b00: alucontrol = 3'b010; // add (for lw/sw/addi)
            2'b01: alucontrol = 3'b110; // sub (for beq)
            default: case(funct) // R-type instructions
                6'b100000: alucontrol = 4'b0000; // and
                6'b100010: alucontrol = 4'b0001; // or
                6'b100100: alucontrol = 4'b0010; // add
                6'b100101: alucontrol = 4'b0011; // sub
                6'b101010: alucontrol = 4'b0100; // multiplication
                6'b011000: alucontrol = 4'b0101; // division
                6'b010010: alucontrol = 4'b0110; // shift left
                6'b010000: alucontrol = 4'b0111; // shift right
                6'b100111: alucontrol = 4'b1000; // not
                default: alucontrol = 4'bxxxx; 
            endcase
        endcase
endmodule

`endif // ALUDEC