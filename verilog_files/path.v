`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:06:02 03/27/2014 
// Design Name: 
// Module Name:    path 
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
module path(in, out, clk, reset, ACS0, ACS1, ACS2, ACS3);
    input [11:0] in;
    output [11:0] out;
    input clk;
    input reset;
    input ACS0;
    input ACS1;
    input ACS2;
    input ACS3;
	 wire [11:0] p_in;
	dff #(12) path0(p_in,out,clk,reset);
	function [2:0] shift_path; input [2:0] a,b; input control;
	begin
	if (control == 0) shift_path = a; else shift_path = b;
	end
	endfunction
	assign p_in[11:9] = shift_path(in[11:9],in[5:3],ACS0);
	assign p_in[ 8:6] = shift_path(in[11:9],in[5:3],ACS1);
	assign p_in[ 5:3] = shift_path(in[8: 6],in[2:0],ACS2);
	assign p_in[ 2:0] = shift_path(in[8: 6],in[2:0],ACS3);


endmodule
