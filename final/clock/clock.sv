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

`ifndef CLOCK
`define CLOCK

`timescale 1ns/100ps

module clock (enable, clk);
   //
   // ---------------- PORT DEFINITIONS ----------------
   //
   parameter FREQ = 100;
   parameter DUTY = 50;
   input enable;
   output reg clk;
   reg start_clk;

   //
   // ---------------- MODULE DESIGN IMPLEMENTATION ----------------
   //
   initial begin
      clk = 0;
   end
   
   always @ (posedge enable or negedge enable) begin
      if (enable) begin
         start_clk = 1;
      end else begin
         start_clk = 0;
    end
  end

   always @(posedge start_clk) begin
      if (start_clk) begin
         clk = 1;

          while (start_clk) begin
              #((1000 / FREQ) * DUTY / 100)  
            clk = 0;
               #((1000 / FREQ) -((1000 / FREQ) * DUTY / 100))
            clk = 1;
         end

          clk = 0;
    end
  end

endmodule

`endif // CLOCK