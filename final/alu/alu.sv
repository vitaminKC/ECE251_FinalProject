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

module alu(clk, A, B, alucontrol, sign, Z, HiLo); 
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   parameter N = 32;
   input logic clk;
   input logic [N-1:0] A, B; 
   input logic [3:0] alucontrol;
   input logic sign;
   output logic [N-1:0] Z;
   output logic HiLo;


   logic [2*N-1:0] result;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
    always @(*) begin
        case(alucontrol)
        4'b0000: //and
            Z = A & B;
        4'b0001: //or
            Z = A | B;
        4'b0010: // addition
            Z = sign ? $signed(A) + $signed(B) : A + B;
        4'b0011: //subtraction
            Z = sign ? $signed(A) - $signed(B) : A - B;
        4'b0100: //multiplication
            Z = (HiLo == 0) ? result[N-1:0] : result[2*N-1:N]; 
        4'b0101: //division
            Z = sign ? $signed(A) / $signed(B) : A / B;
        4'b0110: //shift left
            Z = A << B;
        4'b0111: //shift right
            Z = A >> B;
        4'b1000: //negation
            Z = ~A;
        default: Z = {N{1'b0}};
        endcase
    end

   always_ff @(posedge clk) begin
        if (alucontrol == 4'b0100) begin
            result <= sign ? $signed(A) * $signed(B) : A * B;
            HiLo <= ~HiLo;
        end
   end

endmodule
`endif