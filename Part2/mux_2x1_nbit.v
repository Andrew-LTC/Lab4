`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/08/2021 09:00:20 PM
// Design Name: 
// Module Name: mux_2x1_nbit
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


module mux_2x1_nbit
    #(parameter N = 4) (
    input [N - 1: 0] w0, w1,
    input s,
    input en,
    output reg [N - 1: 0] f
    );
    
    always @(w0, w1, en, s)
    begin
    if (en)
        begin
            case(s)
                2'b00: f = w0;
                2'b01: f = w1;
                default: f = 'bx;
            endcase
        end
    end
endmodule
