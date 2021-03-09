`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 03:27:43 PM
// Design Name: 
// Module Name: demux_4x1_nbit
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


module demux_2x1_nbit
#(parameter N = 4)(
    input [N-1:0] f,
    input s,
    output reg [N-1:0] w0,w1
    );
    
    always @(f,s)
    begin
        if(~s)
            begin
                w0 = f;
                w1 = 'bz;
            end
        else
            begin
                w0 = 'bz;
                w1 = f;
            end
//        case(s)
//            2'b00: w0 = f;
//            2'b01: w1 = f;
//            2'b10: w2 = f;
//            2'b11: w3 = f;
//            default: {w0,w1,w2,w3} = 'bx;
//        endcase
    end
endmodule
