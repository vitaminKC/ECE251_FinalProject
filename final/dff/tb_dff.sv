//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_dff
//     Description: Test bench for simple behavorial adder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`timescale 1ns/100ps
// ensure you note the scale (ns) below in $monitor

`include "./dff.sv"

module tb_dff;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //
    logic clk;
    logic reset;
    logic enable;
    logic d;
    wire q;


   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   dff dut(.clk(clk), .reset(reset), .enable(enable), .d(d), .q(q));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
      reset = 1;
      enable = 0;
      d = 0;
      clk = 0;
      forever #5 clk = ~clk;
    end

    initial begin : dump_variables
      $dumpfile("tb_dff.vcd"); 
      $dumpvars(0, dut);
    end

    /*
    * display variables
    */
    initial begin: display_variables
        $monitor ("ns=%0t, clk=%b, reset=%b, enable=%b, d=%b, q=%b", $time, clk, reset, enable, d, q);
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
    initial begin
      #10 reset = 0; 

      d = 1;
      enable = 1;
      #10; 

      d = 0;
      #10;

      enable = 0; 
      d = 1;      
      #10;   

      enable = 1; 
      #10;       

      $finish;
   end

endmodule

// `endif // tb_dff