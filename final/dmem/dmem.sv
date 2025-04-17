//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: dmem
//     Description: simple behavorial dmem
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`ifndef DMEM
`define DMEM

`timescale 1ns/100ps

module dmem
// n=bit length of register; r=bit length of addr to limit memory and not crash your verilog emulator
    #(parameter n = 32, parameter r = 6)(
    //
    // ---------------- PORT DEFINITIONS ----------------
    // 
    input  logic clk,
    input logic write_enable,
    input  logic [(n-1):0] addr,
    input  logic [(n-1):0] writedata,
    output logic [(n-1):0] readdata
);
    //
    // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
    //
    logic [(n-1):0] RAM[(2**r-1):0];

    assign readdata = RAM[addr[(n-1):2]]; // word aligned (ignores lower 2 bits of address)

    always_ff @(posedge clk) // write on posedge
        if (write_enable) RAM[addr[(n-1):2]] <= writedata;

endmodule

`endif // DMEM