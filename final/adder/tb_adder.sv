//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
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
        a <= 0;
        b <= 0;
    end

   initial begin : dump_variables
      $dumpfile("tb_adder.vcd");
      $dumpvars(0, dut);
   end

    /*
    * display variables
    */
   initial begin: display_variables
         $monitor ("ns=%0t, a=%b, b=%b, y=%b", $time, a, b, y);
   end


    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
    initial begin
        reg [(2*BITS)+1:0] DATA_IN;
        #20;


        for (DATA_IN=0; DATA_IN<(2**(BITS*2))*2; DATA_IN=DATA_IN+1) begin
            a = DATA_IN[BITS-1:0];
            b = DATA_IN[(2*BITS)-1:BITS];

            #20;
        end      
        $finish;
    end


endmodule

// `endif // tb_adder