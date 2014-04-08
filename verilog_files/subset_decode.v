`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:51:07 03/27/2014 
// Design Name: 
// Module Name:    subset_decode 
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
module subset_decode(in0, in1, in2, in3, in4, in5, in6, in7, s0, s1, s2, s3, sout0, sout1, sout2, sout3, clk, reset);
    input [2:0] in0;
    input [2:0] in1;
    input [2:0] in2;
    input [2:0] in3;
    input [2:0] in4;
    input [2:0] in5;
    input [2:0] in6;
    input [2:0] in7;
    output [2:0] s0;
    output [2:0] s1;
    output [2:0] s2;
    output [2:0] s3;
    output sout0;
    output sout1;
    output sout2;
    output sout3;
    input clk;
    input reset;
	 wire [2:0] sub0,sub1,sub2,sub3,sub4,sub5,sub6,sub7;
	dff #(3) subout0(in0, sub0, clk, reset);
	dff #(3) subout1(in1, sub1, clk, reset);
	dff #(3) subout2(in2, sub2, clk, reset);
	dff #(3) subout3(in3, sub3, clk, reset);
	dff #(3) subout4(in4, sub4, clk, reset);
	dff #(3) subout5(in5, sub5, clk, reset);
	dff #(3) subout6(in6, sub6, clk, reset);
	dff #(3) subout7(in7, sub7, clk, reset);
	function [2:0] subset_decode; input [2:0] a,b;
	begin
	subset_decode = 0;
	if (a<=b) subset_decode = a; else subset_decode = b;
	end
	endfunction
	function set_control; input [2:0] a,b;
	begin
	if (a<=b) set_control = 0; else set_control = 1;
	end
	endfunction
	assign s0 = subset_decode (sub0,sub4);
	assign s1 = subset_decode (sub1,sub5);
	assign s2 = subset_decode (sub2,sub6);
	assign s3 = subset_decode (sub3,sub7);
	assign sout0 = set_control(sub0,sub4);
	assign sout1 = set_control(sub1,sub5);
	assign sout2 = set_control(sub2,sub6);
	assign sout3 = set_control(sub3,sub7);


endmodule
