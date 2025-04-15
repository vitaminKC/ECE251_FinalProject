//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2024
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2023-02-07
//     Module Name: tb_adder
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/1ps


`include "./adder.sv"

module tb_adder;

    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
   parameter BITS = 32;
   logic [BITS-1:0] a;
   logic [BITS-1:0] b;


   wire [BITS-1:0] y;

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   adder #(.n(BITS)) dut(.A(a), .B(b), .Y(y));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin
        a <= #n'hFFFFFFFF;
        b <= #n'hFFFFFFFF;
    end

   initial begin : dump_variables
      $dumpfile("tb_adder.vcd");
      $dumpvars(0, dut);
   end

    /*
    * display variables
    */
   initial begin: display_variables
         $monitor ("ns=%0t, a=%b, b=%b, c_in=%b, c_out=%b, y=%b", $time, a, b, y);
   end


    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //



endmodule

// `endif // tb_adder