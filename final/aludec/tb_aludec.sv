//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_aludec
//     Description: Test bench for simple behavorial ALU decoder
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_ALUDEC
`define TB_ALUDEC

`timescale 1ns/100ps
`include "aludec.sv"

module tb_aludec;

    reg [5:0] funct;
    reg [1:0] aluop;

    wire [3:0] alucontrol;

    aludec uut (
        .funct(funct),
        .aluop(aluop),
        .alucontrol(alucontrol)
    );

    initial begin
        //aluop = 00
        $display("Test Case 1: aluop = 00 (Add)");
        aluop = 2'b00; funct = 6'b000000; // funct is don't care for this case
        #10; // Wait for 10 time units

        //aluop = 01
        $display("Test Case 2: aluop = 01 (Sub)");
        aluop = 2'b01; funct = 6'b000000; // funct is don't care for this case
        #10;

        //funct = 100000 (Add)
        $display("Test Case 3: R-type, funct = 100000 (Add)");
        aluop = 2'b10; funct = 6'b100000; 
        #10;

        //funct = 100010 (Sub)
        $display("Test Case 4: R-type, funct = 100010 (Sub)");
        aluop = 2'b10; funct = 6'b100010; 
        #10;

        //funct = 100100 (And)
        $display("Test Case 5: R-type, funct = 100100 (And)");
        aluop = 2'b10; funct = 6'b100100; 
        #10;

        //funct = 100101 (Or)
        $display("Test Case 6: R-type, funct = 100101 (Or)");
        aluop = 2'b10; funct = 6'b100101; 
        #10;

        //funct = 101010 (Slt)
        $display("Test Case 7: R-type, funct = 101010 (Slt)");
        aluop = 2'b10; funct = 6'b101010; 
        #10;

        //Invalid funct value (default case)
        $display("Test Case 8: Invalid funct value (Default)");
        aluop = 2'b10; funct = 6'b111111; // Invalid funct value
        #10;
        
        $finish;
    end

    // Monitor changes to inputs and outputs
    initial begin
        $monitor("At time %t, aluop = %b, funct = %b => alucontrol = %b",
                 $time, aluop, funct, alucontrol);
    end

endmodule
`endif // TB_ALUDEC