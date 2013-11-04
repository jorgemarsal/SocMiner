/********1*********2*********3*********4*********5*********6*********7*********8
*
* FILE      : sys_fm.v
* HIERARCHY : tb/sys
* FUNCTION  : Clock and reset generation functional model.
* AUTHOR    : Narcis Simon
*
*_______________________________________________________________________________
*
* REVISION HISTORY
*
* Name      Date         Comments
* ------------------------------------------------------------------------------
* nsimon    16/Feb/2001  Created from Marti Rius testbench template
* nsimon    02/Apr/2001  Added data skew support.
* jvidal    19/Dec/2001  Support for 32 concurrent waitCycles tasks
* nsimon    30/Jan/2003  Added floating point period and frequency display
* ------------------------------------------------------------------------------
*_______________________________________________________________________________
* 
* FUNCTIONAL DESCRIPTION 
* This module performs the clock and reset generation. It is user controllable
* using the tasks. The timings of the clock can be defined using the module
* parameters.
* Tasks defined:
*   clkOn: starts the clock generation.
*   clkOff: stops the clock generation.
*   rstOn: asserts the reset.
*   rstOff: deasserts the reset.
*   CycleCounter: register that returns the current cycle number.
*   waitDataSkew: waits DATA_SKEW time.
*   waitCycles(<cycles>): wait for <cycles> positive edges of clock plus a data
*      skew. A maximum of `MAX_WAIT_TASKS can be called simultaneously.
*   waitCyclesWoSkew(<cycles>): wait for <cycles> positive edges of clock w/o
*      the data skew. A maximum of `MAX_WAIT_TASKS can be called simultaneously.
*_______________________________________________________________________________
* 
* (c) Copyright Hewlett-Packard Company, 2001 
* All rights reserved. Copying or other reproduction of this 
* program except for archival purposes is prohibited without 
* written consent of Hewlett-Packard Company. 
* HEWLETT-PACKARD COMPANY 
* INKJET COMERCIAL DIVISION 
* 
*********1*********2*********3*********4*********5*********6*********7*********/

`timescale 1ns / 1ps

// This macro specifies the number of waitCycles<x> tasks defined
`define MAX_WAIT_TASKS 32
`ifndef DISP_NOTE
`define DISP_NOTE $display
`endif
`ifndef DISP_ERROR
`define DISP_ERROR $display
`endif
`ifndef DISP_FATAL
`define DISP_FATAL $display
`endif
module sys_fm (                  // Instantiation of the module
    Clk            ,
    Rst_n          ,
    Rst
    );
parameter CLK_H_PERIOD=31.3      ;   // High level clock period
parameter CLK_L_PERIOD=31.3      ;   // Low level clock period
parameter CLK_SKEW=10          ;   // Initial clock skew
parameter DATA_SKEW=1          ;   // Skew to wait after the clock
parameter RESET_CYCLES=25      ;   // Reset number of cycles in start task
parameter POST_RESET_CYCLES=100;   // Number of cycles after reset
parameter COUNTER_WIDTH=31     ;

parameter USE_PROBED_CLK=0     ;  // Used probed vs generated Clk for waitCycles

output          Clk            ;   // Generated clock
output          Rst_n          ;   // Generated low level reset
output          Rst            ;   // Generated high level reset

reg             Clk            ;   
reg             Rst_n          ;
wire            Rst            ;

// Local signals and variables
reg             clkEnable      ;
integer         i              ;
reg [`MAX_WAIT_TASKS-1:0] active_tasks   ;

// -----------------------------------------------------------------------------
// Register: cycleCounter
// This register counts the number of clock cycles
// -----------------------------------------------------------------------------
reg [COUNTER_WIDTH-1:0]   cycleCounter   ;

real iClkHPeriod ;
real iClkLPeriod ;

// Initialization of all signals and variables
initial begin
    iClkHPeriod = CLK_H_PERIOD;
    iClkLPeriod = CLK_L_PERIOD;
    Clk=0;
    Rst_n=0;
    clkEnable=0;
    i=0;
    active_tasks=0;
    cycleCounter=0;
    if ((CLK_H_PERIOD+CLK_L_PERIOD) == 0) begin
        `DISP_ERROR("Clock parametrized with period of 0 ns");
    end
end

initial begin: clkGenerator
    forever begin
        if (clkEnable) begin
            cycleCounter=cycleCounter+1;
            Clk=1;
            #(iClkHPeriod);
            Clk=0;
            #(iClkLPeriod);
        end else begin
            @(clkEnable);
        end
    end
end
// -----------------------------------------------------------------------------
// Task: sys.start
// Enables the clock generator
// -----------------------------------------------------------------------------
task start; begin
    rstOn;
    clkOn;
    waitCycles(RESET_CYCLES);
    #5;
    rstOff;
    waitCycles(POST_RESET_CYCLES);
end
endtask // start

// -----------------------------------------------------------------------------
// Task: sys.clkOn
// Enables the clock generator
// -----------------------------------------------------------------------------
task clkOn; begin
    #CLK_SKEW `DISP_NOTE("Enabling clock (period: %.2f ns, freq: %.2f MHz)",
                        CLK_H_PERIOD+CLK_L_PERIOD,
                        1000/(CLK_H_PERIOD+CLK_L_PERIOD));
    clkEnable=1;
end
endtask // clkOn

// -----------------------------------------------------------------------------
// Task: sys.clkOff
// Disables the clock generator
// -----------------------------------------------------------------------------
task clkOff; begin
    clkEnable=0;
end
endtask // clkOff

// -----------------------------------------------------------------------------
// Task: sys.rstOn
// Asserts reset (Rst_n=0 & Rst=1)
// -----------------------------------------------------------------------------
task rstOn; begin
    Rst_n=0;
end
endtask // rstOn

// -----------------------------------------------------------------------------
// Task: sys.rstOff
// Deasserts reset (Rst_n=0 & Rst=1)
// -----------------------------------------------------------------------------
task rstOff; begin
    Rst_n=1;
end
endtask // rstOff

assign Rst=~Rst_n;

// -----------------------------------------------------------------------------
// Task: sys.waitDataSkew
// Waits DATA_SKEW time.
// -----------------------------------------------------------------------------
task waitDataSkew;
begin
    #DATA_SKEW;
end
endtask // waitDataSkew

// -----------------------------------------------------------------------------
// Task: sys.waitCycles(<cycles>)
// <cycles>: number of clock positive edges to wait
// Waits for an specific number of clock positive edges plus the a data skew.
// -----------------------------------------------------------------------------
// This special way of defining this task is necessary for the limitations
// of Verilog XL. NC Verilog could define this task simply as:
//     task waitCycles0;input [31:0] cycles;begin
//         repeat (cycles) @(posedge Clk);
//     end
// and would work without any problem.
task waitCycles;
input [31:0] cycles;
integer j;
begin
    j=0;
    while (active_tasks[i]) begin
        if (i == `MAX_WAIT_TASKS-1) begin
            i = 0;
        end else begin
            i = i + 1;
        end
        j = j + 1;
        if (j == `MAX_WAIT_TASKS-1) begin
            `DISP_FATAL("Overflow. More than %d waitCycles tasks cannot be used at the same time.",`MAX_WAIT_TASKS);
        end
    end // while (active_tasks[i])
    active_tasks[i] = 1'b1;

    // THERE MUST BE `MAX_WAIT_TASKS CASE SENTENCES
    case (i)
        0: waitCycles0(cycles);
        1: waitCycles1(cycles);
        2: waitCycles2(cycles);
        3: waitCycles3(cycles);
        4: waitCycles4(cycles);
        5: waitCycles5(cycles);
        6: waitCycles6(cycles);
        7: waitCycles7(cycles);
        8: waitCycles8(cycles);
        9: waitCycles9(cycles);
        10: waitCycles10(cycles);
        11: waitCycles11(cycles);
        12: waitCycles12(cycles);
        13: waitCycles13(cycles);
        14: waitCycles14(cycles);
        15: waitCycles15(cycles);
        16: waitCycles16(cycles);
        17: waitCycles17(cycles);
        18: waitCycles18(cycles);
        19: waitCycles19(cycles);
        20: waitCycles20(cycles);
        21: waitCycles21(cycles);
        22: waitCycles22(cycles);
        23: waitCycles23(cycles);
        24: waitCycles24(cycles);
        25: waitCycles25(cycles);
        26: waitCycles26(cycles);
        27: waitCycles27(cycles);
        28: waitCycles28(cycles);
        29: waitCycles29(cycles);
        30: waitCycles30(cycles);
        31: waitCycles31(cycles);
//        default: `DISP_ERROR("'i' variable has an illegal value: %d", i);
    endcase // case(i)
    #DATA_SKEW;
end
endtask // waitCycles

// -----------------------------------------------------------------------------
// Task: sys.waitCyclesWoSkew(<cycles>)
// <cycles>: number of clock positive edges to wait
// Waits for an specific number of clock positive edges without data skew.
// -----------------------------------------------------------------------------
task waitCyclesWoSkew;
input [31:0] cycles;
integer j;
begin
    j=0;
    while (active_tasks[i]) begin
        if (i == `MAX_WAIT_TASKS-1) begin
            i = 0;
        end else begin
            i = i + 1;
        end
        j = j + 1;
        if (j == `MAX_WAIT_TASKS-1) begin
            `DISP_FATAL("Overflow. More than %d waitCycles tasks cannot be used at the same time.",`MAX_WAIT_TASKS);
        end
    end // while (active_tasks[i])
    active_tasks[i] = 1'b1;

    // THERE MUST BE `MAX_WAIT_TASKS CASE SENTENCES
    case (i)
        0: waitCycles0(cycles);
        1: waitCycles1(cycles);
        2: waitCycles2(cycles);
        3: waitCycles3(cycles);
        4: waitCycles4(cycles);
        5: waitCycles5(cycles);
        6: waitCycles6(cycles);
        7: waitCycles7(cycles);
        8: waitCycles8(cycles);
        9: waitCycles9(cycles);
        10: waitCycles10(cycles);
        11: waitCycles11(cycles);
        12: waitCycles12(cycles);
        13: waitCycles13(cycles);
        14: waitCycles14(cycles);
        15: waitCycles15(cycles);
        16: waitCycles16(cycles);
        17: waitCycles17(cycles);
        18: waitCycles18(cycles);
        19: waitCycles19(cycles);
        20: waitCycles20(cycles);
        21: waitCycles21(cycles);
        22: waitCycles22(cycles);
        23: waitCycles23(cycles);
        24: waitCycles24(cycles);
        25: waitCycles25(cycles);
        26: waitCycles26(cycles);
        27: waitCycles27(cycles);
        28: waitCycles28(cycles);
        29: waitCycles29(cycles);
        30: waitCycles30(cycles);
        31: waitCycles31(cycles);
        //default: `DISP_ERROR("'i' variable has an illegal value: %d", i);
    endcase // case(i)
end
endtask // waitCyclesWoSkew

// THERE MUST BE THE `MAX_WAIT_TASKS
task waitCycles0;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[0]=1'b0;
end
endtask // waitCycles0
task waitCycles1;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[1]=1'b0;
end
endtask // waitCycles1
task waitCycles2;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[2]=1'b0;
end
endtask // waitCycles2
task waitCycles3;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[3]=1'b0;
end
endtask // waitCycles3
task waitCycles4;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[4]=1'b0;
end
endtask // waitCycles4
task waitCycles5;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[5]=1'b0;
end
endtask // waitCycles5
task waitCycles6;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[6]=1'b0;
end
endtask // waitCycles6
task waitCycles7;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[7]=1'b0;
end
endtask // waitCycles7
task waitCycles8;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[8]=1'b0;
end
endtask // waitCycles8
task waitCycles9;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[9]=1'b0;
end
endtask // waitCycles9
task waitCycles10;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[10]=1'b0;
end
endtask // waitCycles10
task waitCycles11;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[11]=1'b0;
end
endtask // waitCycles11
task waitCycles12;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[12]=1'b0;
end
endtask // waitCycles12
task waitCycles13;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[13]=1'b0;
end
endtask // waitCycles13
task waitCycles14;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[14]=1'b0;
end
endtask // waitCycles14
task waitCycles15;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[15]=1'b0;
end
endtask // waitCycles15
task waitCycles16;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[16]=1'b0;
end
endtask // waitCycles16
task waitCycles17;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[17]=1'b0;
end
endtask // waitCycles17
task waitCycles18;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[18]=1'b0;
end
endtask // waitCycles18
task waitCycles19;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[19]=1'b0;
end
endtask // waitCycles19
task waitCycles20;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[20]=1'b0;
end
endtask // waitCycles20
task waitCycles21;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[21]=1'b0;
end
endtask // waitCycles21
task waitCycles22;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[22]=1'b0;
end
endtask // waitCycles22
task waitCycles23;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[23]=1'b0;
end
endtask // waitCycles23
task waitCycles24;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[24]=1'b0;
end
endtask // waitCycles24
task waitCycles25;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[25]=1'b0;
end
endtask // waitCycles25
task waitCycles26;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[26]=1'b0;
end
endtask // waitCycles26
task waitCycles27;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[27]=1'b0;
end
endtask // waitCycles27
task waitCycles28;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[28]=1'b0;
end
endtask // waitCycles28
task waitCycles29;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[29]=1'b0;
end
endtask // waitCycles29
task waitCycles30;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[30]=1'b0;
end
endtask // waitCycles 30
task waitCycles31;
input [31:0] cycles;
begin
    repeat (cycles) @(posedge Clk);
    active_tasks[31]=1'b0;
end
endtask // waitCycles 31

endmodule
