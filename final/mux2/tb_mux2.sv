//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_mux2
//     Description: Test bench for 2 to 1 multiplexer
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_MUX2
`define TB_MUX2

`timescale 1ns/100ps
`include "mux2.sv"

module tb_mux2;
    parameter n = 32; // #bits for an operand
    logic s;
    logic [(n-1):0] d0, d1;
    logic [(n-1):0] y;


   initial begin
        $dumpfile("mux2.vcd");
        $dumpvars(0, uut0);
        // $monitor("s = %0b d0 = (0x%0h)(%0d) d1 = (0x%0h)(%0d) y = (0x%0h)(%0d)", s, d0, d0, d1, d1, y, y);
        $monitor("time=%0t \t s=%0b y=%h d0=%h d1=%h",$realtime, s, y, d0, d1);
    end

    initial begin
        s = 0;
        d0 = #8'h80000000;
        d1 = #8'h00000001;
        s = 0;
        #10 s = 1;
        #10;
        $finish;
    end

    mux2 uut0(
        .S(s), .D0(d0), .D1(d1), .Y(y)
    );

    // clock uut1(
    //     .enable(enable),
    //     .clk(clk)
    // );
endmodule
`endif // TB_MUX2