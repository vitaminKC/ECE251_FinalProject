//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: adder
//     Description: simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

module adder (A, B, Y);

   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   parameter n = 32;
   input logic [n-1:0] A;
   input logic [n-1:0] B;
   output logic [n-1:0] Y;



   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   assign {Y} = A + B;

endmodule

`endif // adder