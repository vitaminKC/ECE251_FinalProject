//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: dff
//     Description: simple behavorial D-flip flop
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef DFF
`define DFF
// DO NOT FORGET TO RENAME MODULE_NAME to match your module_name

module dff #(parameter n = 32) (clk, reset, enable, d, q) ;
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   input  clk;
   input reset;
   input enable;
   input [n-1:0] d;
   output [n-1:0] q;

   logic Q;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //

   always_ff @(posedge clk) begin
    if (reset) begin
      Q <= 0; // Synchronous reset
    end else if (enable) begin
      Q <= d; // Data is loaded only when enable is high
    end
  end

  assign q = Q;

endmodule

`endif // dff