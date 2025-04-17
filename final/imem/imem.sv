//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-17
//     Module Name: imem
//     Description: 32-bit RISC memory
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef IMEM
`define IMEM

`timescale 1ns/100ps

module imem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 32, parameter r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    //
    input  logic [(r-1):0] address,
    output logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[0:(2**r-1)];

  initial
    begin
      // read memory in hex format from file 
      // $readmemh("program_exe",RAM);
      $readmemh("mult-prog_exe",RAM);
    end

  assign readdata = RAM[address]; // word aligned

endmodule

`endif // IMEM