//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2023-02-07
//     Module Name: adder
//     Description: simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef ADDER
`define ADDER

module adder (A, B, C_in, Y, C_out);

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
   assign {C_out, Y} = A + B;

endmodule

`endif // adder