`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:45:06 03/27/2014 
// Design Name: 
// Module Name:    viterbi 
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
module viterbi(in0, in1, in2, in3, in4, in5, in6, in7, out, clk, reset, error);
    input [2:0] in0;
    input [2:0] in1;
    input [2:0] in2;
    input [2:0] in3;
    input [2:0] in4;
    input [2:0] in5;
    input [2:0] in6;
    input [2:0] in7;
    output [2:0] out;
    input clk;
    input reset;
    output error;
	 
	 wire sout0,sout1,sout2,sout3;
    wire [2:0] s0,s1,s2,s3;
    wire [4:0] m_in0,m_in1,m_in2,m_in3;
    wire [4:0] m_out0,m_out1,m_out2,m_out3;
    wire [4:0] p0_0,p2_0,p0_1,p2_1,p1_2,p3_2,p1_3,p3_3;
    wire ACS0,ACS1,ACS2,ACS3;
    wire [4:0] out0,out1,out2,out3;
    wire [1:0] control;
    wire [2:0] p0,p1,p2,p3;
    wire [11:0] path0;
    subset_decode u1(in0,in1,in2,in3,in4,in5,in6,in7,
	s0,s1,s2,s3,sout0,sout1,sout2,sout3,clk,reset);
	metric u2(m_in0,m_in1,m_in2,m_in3,m_out0,
	m_out1,m_out2,m_out3,clk,reset);
	compute_metric u3(m_out0,m_out1,m_out2,m_out3,s0,s1,s2,s3,
	p0_0,p2_0,p0_1,p2_1,p1_2,p3_2,p1_3,p3_3,error);
	compare_select u4(p0_0,p2_0,p0_1,p2_1,p1_2,p3_2,p1_3,p3_3,
	out0,out1,out2,out3,ACS0,ACS1,ACS2,ACS3);
	reduce u5(out0,out1,out2,out3,
	m_in0,m_in1,m_in2,m_in3,control);
	pathin u6(sout0,sout1,sout2,sout3,
	ACS0,ACS1,ACS2,ACS3,path0,clk,reset);
	path_memory u7(p0,p1,p2,p3,path0,clk,reset,
	ACS0,ACS1,ACS2,ACS3);
	out_decision u8(p0,p1,p2,p3,control,out);


endmodule
