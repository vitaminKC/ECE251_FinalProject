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
   input logic [3:0] S;
   input logic sign;
   output logic [n-1:0] Z;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

    always @(*) begin
        case(S)
        4'b0000: //and
            Z = A & B; 
        4'b0001: //or
            Z = A | B;
        4'b0010: // addition
            Z = sign ? $signed(a) + $signed(b) : Z = A + B;
        4'b0011: //subtraction
            Z = sign ? $signed(a) + $signed(b) : Z = A - B;
        4'b0100: //multiplication
            Z = A * B;
        4'b0101: //division
            Z = sign ? $signed(a) + $signed(b) : Z = A / B;
        4'b0110: //shift left
            Z = A << B;
        4'b0111: //shift right
            Z = A >> B;
        4'b1000: //negation
            Z = ~A;
        // 4'b100
        endcase
    end

endmodule

`endif