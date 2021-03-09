`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 10:21:18 PM
// Design Name: 
// Module Name: accumulator
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module accumulator(
    input [3:0] X,
    input op_sel,
    input CLK100MHZ,
    input loadButton,   
    input resetButton, 
    output [6:0] SSEG,
    output [7:0] AN
    );
    
    assign AN = 8'b1111_1110; //turn on only first SSEG
    
    wire [3:0] sum;
    wire [3:0] accumulator_output;
    wire load;
    wire resetn; 
    //question   
//    wire [3:0] accumulator_output_comp;
//    assign accumulator_output_comp = ~accumulator_output;
//    wire [3:0] muxout;
    
    adder_subtractor #(.n(4)) AS (
        .x(X),
        .y(accumulator_output),
        .add_n(op_sel),
        .s(sum)
    ); 
    button LoadB (
        .clk(CLK100MHZ),
        .in(loadButton),
        .out(load)
    );
    button ResetB (
        .clk(CLK100MHZ),
        .in(resetButton),
        .out(resetn)
    );
    simple_register_load_reset #(.N(4)) RL (
        .clk(CLK100MHZ),
        .load(load),
        .reset(resetn),
        .I(sum),
        .Q(accumulator_output)
    );
    hex2sseg H2S (
        .hex(accumulator_output),
        .sseg(SSEG)
    );
//    mux_2x1_nbit #(.N(4)) Check (
//        .w0(accumulator_output),
//        .w1(accumulator_output_comp),
//        .s(accumulator_output [3]),
//        .en(op_sel),
//        .f(muxout)
//    );
endmodule
