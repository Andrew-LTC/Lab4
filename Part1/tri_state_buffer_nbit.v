`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 12:29:23 PM
// Design Name: 
// Module Name: tri_state_buffer_nbit
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


module tri_state_buffer_nbit
#(parameter N = 4)(
    input [N-1:0] A,
    input EN,
    output [N-1:0] B
    );
    
    generate
    genvar k;
    
        for(k = 0; k < N; k = k + 1)
        begin: buffer
            tri_state_buffer TSB (
                .a(A[k]),
                .en(EN),
                .b(B[k])
            );
        end
    endgenerate
    
endmodule
