`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 03/06/2021 04:00:17 PM
// Design Name: 
// Module Name: reg_file_tb
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


module reg_file_tb(

    );
    parameter N = 2;
    parameter BITS = 4;
    reg [N-1:0] address_w, address_r;
    reg WE;
    reg CLK;
    reg [BITS-1:0] data_w;
    wire [BITS-1:0] data_r;
    
    reg_file #(.N(N),.BITS(BITS)) uut (
        .address_w(address_w),
        .address_r(address_r),
        .WE(WE),
        .CLK(CLK),
        .data_w(data_w),
        .data_r(data_r)
    );
    
    localparam T = 20; //clock period
    always
    begin
        CLK = 1'b0;
        #(T/2);
        CLK = 1'b1;
        #(T/2);
        CLK = 1'b0;
    end
    
    initial
    begin
        address_w = 0;
        data_w = 5;
        WE = 0;
        address_r = 0;
        
        #(T);
        WE = 1; 
        
        #(T);
        WE = 0;
        address_r = 1; 
        
        #(T);
        WE = 1;
        address_r = 1;
        
        #(T);
        address_w = 1;
        data_w = 9;
        WE = 0;
        address_r = 1;
        
        #(T);
        address_w = 1;
        data_w = 9;
        WE = 1;
        address_r = 1;
        
        #(2*T);      
        $stop;
    end
endmodule
