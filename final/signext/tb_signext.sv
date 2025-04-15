//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_signext
//     Description: Test bench for sign extender
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_SIGNEXT
`define TB_SIGNEXT

`timescale 1ns/100ps
`include "signext.sv"

module tb_sign_extender;
    //
    // ---------------- DECLARATIONS OF DATA TYPES ----------------
    //

   parameter IN_WIDTH = 16;
   parameter OUT_WIDTH = 32;

   logic [IN_WIDTH-1:0] IN;   
   wire [OUT_WIDTH-1:0] OUT;     

   //
   // ---------------- INSTANTIATE UNIT UNDER TEST (DUT) ----------------
   //
   signext #(.IN_WIDTH(IN_WIDTH), .OUT_WIDTH(OUT_WIDTH)) dut(.IN(IN), .OUT(OUT));
   
    //
    // ---------------- INITIALIZE TEST BENCH ----------------
    //
    initial begin : initialize_variables
      {IN} <= 0;
    end

    initial begin : dump_variables
      $dumpfile("tb_signext.vcd");
      $dumpvars(0, dut);
    end

    /*
    * display variables
    */
    initial begin: display_variables
        $monitor ("ns=%0t, IN=%b, OUT=%b", $time, IN, OUT);
    end

    //
    // ---------------- APPLY INPUT VECTORS ----------------
    //
   initial begin
        reg [2**(IN_WIDTH)+1:0] DATA_IN;

        for (DATA_IN=0; DATA_IN<(2**(IN_WIDTH)); DATA_IN=DATA_IN+1) begin
            IN = DATA_IN[IN_WIDTH-1:0];
            #5;
         end      
         $finish;
   end

endmodule

`endif // tb_signext