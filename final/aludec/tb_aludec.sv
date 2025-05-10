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
        // I-type: LW, SW -> ADD
        aluop = 2'b00; funct = 6'bxxxxxx;
        #1 $display("I-type ADD (LW/SW)");

        // I-type: BEQ -> SUB
        aluop = 2'b01; funct = 6'bxxxxxx;
        #1 $display("I-type SUB (BEQ)");

        // R-type: add
        aluop = 2'b10; funct = 6'b100000;
        #1 $display("R-type ADD");

        // R-type: sub
        aluop = 2'b10; funct = 6'b100010;
        #1 $display("R-type SUB");

        // R-type: and
        aluop = 2'b10; funct = 6'b100100;
        #1 $display("R-type AND");

        // R-type: or
        aluop = 2'b10; funct = 6'b100101;
        #1 $display("R-type OR");

        // R-type: multiplication
        aluop = 2'b10; funct = 6'b011000;
        #1 $display("R-type MULT");

        // R-type: division
        aluop = 2'b10; funct = 6'b101010;
        #1 $display("R-type DIV");

        // R-type: shift left
        aluop = 2'b10; funct = 6'b010010;
        #1 $display("R-type SLL");

        // R-type: shift right
        aluop = 2'b10; funct = 6'b010000;
        #1 $display("R-type SRL");

        // R-type: not
        aluop = 2'b10; funct = 6'b100111;
        #1 $display("R-type NOT");

        // Invalid funct
        aluop = 2'b10; funct = 6'b111111;
        #1 $display("R-type Invalid Function");
        
        $finish;
    end

    // Monitor changes to inputs and outputs
    initial begin
        $monitor("At time %t, aluop = %b, funct = %b => alucontrol = %b",
                 $time, aluop, funct, alucontrol);
    end

endmodule
`endif // TB_ALUDEC