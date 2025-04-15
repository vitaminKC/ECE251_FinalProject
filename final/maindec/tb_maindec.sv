//////////////////////////////////////////////////////////////////////////////////
// The Cooper Union
// ECE 251 Spring 2025
// Engineer: Amanda Su and Casey Ye
// 
//     Create Date: 2025-04-15
//     Module Name: tb_maindec
//     Description: Test bench for main dec
//
// Revision: 1.0
//
//////////////////////////////////////////////////////////////////////////////////

`ifndef TB_MAINDEC
`define TB_MAINDEC

`timescale 1ns/100ps
`include "maindec.sv"

module tb_maindec;
    parameter n = 32;
    logic [5:0] op;
    logic memtoreg, memwrite;
    logic branch, alusrc;
    logic regdst, regwrite;
    logic jump;
    logic [1:0] aluop;

    maindec uut (
        .op(op),
        .memtoreg(memtoreg),
        .memwrite(memwrite),
        .branch(branch),
        .alusrc(alusrc),
        .regdst(regdst),
        .regwrite(regwrite),
        .jump(jump),
        .aluop(aluop)
    );

    // Task for displaying outputs
    task print_outputs;
        begin
            $display("op = %b => regwrite=%b, regdst=%b, alusrc=%b, branch=%b, memwrite=%b, memtoreg=%b, jump=%b, aluop=%b",
                     op, regwrite, regdst, alusrc, branch, memwrite, memtoreg, jump, aluop);
        end
    endtask

    // Stimulus
    initial begin
        op = 6'b000000; #10; print_outputs(); // RTYPE
        op = 6'b100011; #10; print_outputs(); // LW
        op = 6'b101011; #10; print_outputs(); // SW
        op = 6'b000100; #10; print_outputs(); // BEQ
        op = 6'b001000; #10; print_outputs(); // ADDI
        op = 6'b000010; #10; print_outputs(); // J
        op = 6'b111111; #10; print_outputs(); // Invalid op
        $finish;
    end


endmodule
`endif // TB_MAINDEC