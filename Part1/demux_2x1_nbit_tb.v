`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/07/2021 07:40:16 PM
// Design Name: 
// Module Name: demux_4x1_nbit_tb
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


module demux_2x1_nbit_tb(

    );
    
    parameter N = 4;
    reg [N-1:0] f;
    reg  s;
    wire [N-1:0] w0,w1;
    
    demux_2x1_nbit uut (
        .f(f),
        .s(s),
        .w0(w0),
        .w1(w1)
    );
    
    initial
    begin
        f = 3;
        s = 0;
        
        #10
        s = 1;
        
        #10
        $stop;
    end
endmodule
