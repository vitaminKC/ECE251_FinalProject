//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_sl2
//     Description: Test bench for sl2
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_SL2
`define TB_SL2

`timescale 1ns/100ps
`include "sl2.sv"

module tb_sl2;
    parameter n = 32;
    logic [(n-1):0] a, y;

   initial begin
        $dumpfile("sl2.vcd");
        $dumpvars(0, uut);
        //$monitor("a = %0b (0x%0h)(%0d) y = %0b (0x%0h)(%0d) ", a, a, a, y, y, y);
        $monitor("time=%0t \t a=%b y=%b",$realtime, a, y);
    end

    initial begin
        a <= #n'h00000001;
    end

    sl2 uut(
        .A(a), .Y(y)
    );
endmodule
`endif // TB_SL2