//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: alu
//     Description: 32-bit RISC-based CPU alu (MIPS)
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef ALU
`define ALU
// DO NOT FORGET TO RENAME MODULE_NAME to match your module_name

module alu(A, B, S, Z); 
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   parameter n = 32;
   input logic [n-1:0] A, B; 
   input logic [2:0] S;
   output logic [n-1:0] Z;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

    always @(*) begin
        case(S)
        3'b010: // addition
            Z = A + B;
        3'b110: //subtraction
            Z = A - B;
        3'b000: //and
            Z = A & B; 
        3'b001: //or
            Z = A | B;
        3'b111: //slt
            Z = (A < B);
        endcase
    end

endmodule

`endif