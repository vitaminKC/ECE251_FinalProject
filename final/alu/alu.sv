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
   output logic [n-1:0] Z;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

    always @(*) begin
        case(S)
        4'b0000: // addition
            Z = A + B;
        4'b0001: //subtraction
            Z = A - B;
        4'b0010: //multiplication
            Z = A * B;
        4'b0011: //division
            Z = A / B;
        4'b0100: //and
            Z = A & B; 
        4'b0101: //or
            Z = A | B;
          4'b0110: //not
            Z = ~A;
        4'b0111: //sll
            Z = A << 1;
        4'b1000: //slr
            Z = A >> 1;
        endcase
    end

endmodule

`endif