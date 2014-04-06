`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:09:07 03/27/2014 
// Design Name: 
// Module Name:    path_memory 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module path_memory(p0, p1, p2, p3, path0, clk, reset, ACS0, ACS1, ACS2, ACS3);
    output [2:0] p0;
    output [2:0] p1;
    output [2:0] p2;
    output [2:0] p3;
    input [11:0] path0;
    input clk;
    input reset;
    input ACS0;
    input ACS1;
    input ACS2;
    input ACS3;
	 wire [11:0]out1,out2,out3,out4,out5,out6,out7,out8,out9,out10,out11;
	path x1 (path0,out1 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x2 (out1, out2 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x3 (out2, out3 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x4 (out3, out4 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x5 (out4, out5 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x6 (out5, out6 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x7 (out6, out7 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x8 (out7, out8 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x9 (out8, out9 ,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x10(out9, out10,clk,reset,ACS0,ACS1,ACS2,ACS3),
	x11(out10,out11,clk,reset,ACS0,ACS1,ACS2,ACS3);
	assign p0 = out11[11:9];
	assign p1 = out11[ 8:6];
	assign p2 = out11[ 5:3];
	assign p3 = out11[ 2:0];
	
	
endmodule
