//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: clock
//     Description: Clock generator; duty cycle = 50%
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////
`timescale 1ns/100ps
// ensure you note the scale (ns) below in $monitor

`include "./clock.sv"

module tb_clock;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
   parameter FREQ = 100;
   parameter DUTY = 50;
   logic enable;
   wire clk;    

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   clock dut(.enable(enable), .clk(clk));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
      enable <=0;
    end

    initial begin : dump_variables
      $dumpfile("tb_clock.vcd"); 
      $dumpvars(0, dut);
    end

    /*
    * display variables
    */
    initial begin: display_variables
        $monitor ("ns=%0t, enable=%b, clk=%b", $time, enable, clk);
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
   
    initial begin
      #10;
      enable = 1;
      #100;
      enable = 0;
      #10;
      $finish;
    end 

endmodule

// `endif // tb_clock