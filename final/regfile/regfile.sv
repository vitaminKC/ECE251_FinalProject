//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: regfile
//     Description: simple behavorial register file
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef REGFILE
`define REGFILE
`include "../regfile/register.sv"

module regfile #(
  parameter n = 32,  // bit width
  parameter r = 5    // address width
) (
  input  logic clk,
  input  logic rst,
  input  logic [r-1:0] read_addr1,
  input  logic [r-1:0] read_addr2,
  input  logic [r-1:0] write_addr,
  input  logic [n-1:0] write_data,
  input  logic write_en,
  output logic [n-1:0] read_data1,
  output logic [n-1:0] read_data2
);

  // Internal outputs
  logic [n-1:0] q_internal [(2**r)-1:0];

  // Generate 32 registers
  genvar i;
  generate
    for (i = 0; i < (2**r); i++) begin : register_instances
      register #( .n(n) ) reg_inst (
        .clk(clk),
        .rst(rst),
        .enable(write_en && (write_addr == i)),  // Write only if write_en and matching address
        .d(write_data),
        .q2(q_internal[i])
      );
    end
  endgenerate

  // Combinational read logic
  assign read_data1 = (read_addr1 != 0) ? q_internal[read_addr1] : '0;
  assign read_data2 = (read_addr2 != 0) ? q_internal[read_addr2] : '0;

endmodule

`endif // REGFILE