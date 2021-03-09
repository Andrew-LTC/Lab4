`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 12:45:45 PM
// Design Name: 
// Module Name: tri_state_buffer_nbit_tb
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


module tri_state_buffer_nbit_tb(

    );
    parameter N = 4;
    
    reg [N-1:0] A;
    reg EN;
    wire [N-1:0] B;
    
    tri_state_buffer_nbit #(.N(N)) uut (
        .A(A),
        .EN(EN),
        .B(B)
    );
    
    initial
    begin
        A = 4'b0101;
        EN = 1;
        
        #10
        EN = 0;
        
        #10
        A = 4'b1001;
        EN = 0;
        
        #10
        EN = 1;
    end
    
    initial
    begin
        #40 $finish;
    end
endmodule
