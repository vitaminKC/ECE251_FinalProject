//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: register
//     Description: simple behavorial register
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef REGISTER
`define REGISTER
`include "../dff/dff.sv"

module register #(
  parameter n = 32 // Default width of 8 bits
) (
  input logic clk,
  input logic rst,
  input logic enable,
  input logic [n-1:0] d, // Data input, parameterized width
  output logic [n-1:0] q2 // Data output, parameterized width
);

  // Array of D flip-flops to form the register
  logic [n-1:0] q_internal; // Internal storage for the register

  genvar i;
  generate
    for (i = 0; i < n; i++) begin : flip_flops
      dff flip_flop_inst (
        .clk(clk),
        .reset(rst),
        .enable(enable),
        .d(d[i]),      // Connecting individual bits of d
        .q(q_internal[i]) // Connecting individual bits of q_internal
      );
    end
  endgenerate

  assign q2 = q_internal; // Assign the internal storage to the output

endmodule

`endif // register