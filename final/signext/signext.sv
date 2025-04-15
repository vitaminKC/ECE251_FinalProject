//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: signext
//     Description: 16 to 32 bit sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef SIGNEXT
`define SIGNEXT

module signext #(parameter IN_WIDTH = 16, parameter OUT_WIDTH = 32)(IN, OUT);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input  [IN_WIDTH-1:0] IN;
   output [OUT_WIDTH-1:0] OUT;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   assign OUT = {{(OUT_WIDTH-IN_WIDTH){IN[IN_WIDTH-1]}}, IN};

endmodule

`endif // SIGN_EXTENDER