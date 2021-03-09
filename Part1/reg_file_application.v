`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 10:35:53 PM
// Design Name: 
// Module Name: reg_file_application
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


module reg_file_application(
    input [3:0] data_w,
    input [6:0] address,
    input select_address,
    input Button,
    input CLK100MHZ,
    output [6:0] SSEG,
    output [7:0] AN
    );
    //only turn on first SSEG display
    assign AN = 8'b1111_1110;
    
    wire [6:0] address_w;
    wire [6:0] address_r;
    wire WE;
    wire [3:0] data_r;
    
    demux_2x1_nbit #(.N(7)) DM (
        .f(address),
        .s(select_address),
        .w0(address_w),
        .w1(address_r)
    );
    button B (
        .clk(CLK100MHZ),
        .in(Button),
        .out(WE)
    );
    reg_file #(.N(7),.BITS(4)) RF (
        .address_w(address_w),
        .address_r(address_r),
        .WE(WE),
        .CLK(CLK100MHZ),
        .data_w(data_w),
        .data_r(data_r)
    );
    hex2sseg H2S (
        .hex(data_r),
        .sseg(SSEG)
    );
endmodule
