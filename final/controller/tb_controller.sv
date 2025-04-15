//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_controller
//     Description: Test bench for controller
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_CONTROLLER
`define TB_CONTROLLER

`timescale 1ns/100ps
`include "controller.sv"

module tb_controller;
    parameter n = 32;
    logic [5:0] op, funct;
    logic zero;

    logic memtoreg, memwrite;
    logic pcsrc, alusrc;
    logic regdst, regwrite;
    logic jump;
    logic [3:0] alucontrol;

    controller uut (
        .op(op),
        .funct(funct),
        .zero(zero),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .pcsrc(pcsrc),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .alucontrol(alucontrol)
    );

    task print_outputs;
        begin
            $display("op=%b funct=%b zero=%b => regwrite=%b regdst=%b alusrc=%b branch&zero=%b memwrite=%b memtoreg=%b jump=%b alucontrol=%b",
                      op, funct, zero, regwrite, regdst, alusrc, pcsrc, memwrite, memtoreg, jump, alucontrol);
        end
    endtask

    initial begin
        // R-type: ADD
        op = 6'b000000; funct = 6'b100000; zero = 0; #10; print_outputs(); // ADD
        // R-type: SUB
        op = 6'b000000; funct = 6'b100010; zero = 1; #10; print_outputs(); // SUB (zero = 1 for BEQ effect)
        // LW
        op = 6'b100011; funct = 6'bxxxxxx; zero = 0; #10; print_outputs();
        // SW
        op = 6'b101011; funct = 6'bxxxxxx; zero = 0; #10; print_outputs();
        // BEQ (zero = 0)
        op = 6'b000100; funct = 6'bxxxxxx; zero = 0; #10; print_outputs();
        // BEQ (zero = 1)
        op = 6'b000100; funct = 6'bxxxxxx; zero = 1; #10; print_outputs();
        // ADDI
        op = 6'b001000; funct = 6'bxxxxxx; zero = 0; #10; print_outputs();
        // JUMP
        op = 6'b000010; funct = 6'bxxxxxx; zero = 0; #10; print_outputs();
        $finish;
    end

endmodule
`endif