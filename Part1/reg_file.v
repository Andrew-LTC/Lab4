`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/05/2021 03:49:55 PM
// Design Name: 
// Module Name: reg_file
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


module reg_file 
#(  parameter N = 2,
    parameter BITS = 4)(
    input [N-1:0] address_w, address_r,
    input WE,
    input CLK,   
    input [BITS-1:0] data_w,
    output [BITS-1:0] data_r
    );
    
    //read and write ports data selection
    wire [0:2**N-1] load;
    wire [0:2**N-1] buffersEnable;
    
    //produce decoders for read and write ports
    decoder_generic #(.N(N)) D_write (
            .w(address_w),
            .en(WE),
            .y(load)
        );     
     decoder_generic #(.N(N)) D_read (
            .w(address_r),
            .en(1'b1),
            .y(buffersEnable)
        );
                
    generate//produce 2^N registers and buffers 
    genvar k;
    
        for(k = 0; k < 2**N; k = k + 1)
            begin:stage  
            //data movement for registers and buffers
            wire [BITS-1:0] buffersIN;
            wire [BITS-1:0] buffersOUT;
            
                simple_register_load #(.N(BITS)) RL (
                    .clk(CLK),
                    .load(load[k]),
                    .I(data_w),
                    .Q(buffersIN)
                );
                tri_state_buffer_nbit #(.N(4)) TSB (
                    .A(buffersIN),
                    .EN(buffersEnable[k]),
                    .B(buffersOUT)
                );
                assign data_r = buffersOUT;        
            end
    endgenerate 
endmodule
