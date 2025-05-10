//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_alu
//     Description: Test bench for simple behavorial ALU
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
// ensure you note the scale (ns) below in $monitor

`include "./alu.sv"

module tb_alu #(parameter n = 32);
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //

    //inputs are reg for test bench - or use logic
   reg [n-1:0] A, B;   //inputs are reg for test bench
   reg [3:0] S;

    //outputs are wire for test bench - or use logic
   wire [n-1:0] Z;     //outputs are wire for test bench

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   alu dut(.A(A), .B(B), .alucontrol(S), .Z(Z));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
    A = 0;
    B = 0;
    S = 0;
    end

    initial begin : dump_variables
      $dumpfile("tb_alu.vcd"); // for Makefile, make dump file same as module name
      $dumpvars(0, dut);
    end

    /*
    * display variables
    */
    initial begin: display_variables
        // note: currently only simple signals or constant expressions may be passed to $monitor.
        $monitor ($time, "ns\tA=%b\tB=%b\tS=%b\tZ=%b", A, B, S, Z);
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
    initial begin
        for (int i = 0; i < 256; i++) begin
            A = i;
            for (int j = 0; j < 256; j++) begin
                B = j;
                for (int k = 0; k < 8; k++) begin
                S = k;
                #10;
                end
            end
        end
    end

endmodule

// `endif 