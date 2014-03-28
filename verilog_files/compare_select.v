`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:02:03 03/27/2014 
// Design Name: 
// Module Name:    compare_select 
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
module compare_select(p0_0, p2_0, p0_1, p2_1, p1_2, p3_2, p1_3, p3_3, out0, out1, out2, out3, ACS0, ACS1, ACS2, ACS3);
    input [4:0] p0_0;
    input [4:0] p2_0;
    input [4:0] p0_1;
    input [4:0] p2_1;
    input [4:0] p1_2;
    input [4:0] p3_2;
    input [4:0] p1_3;
    input [4:0] p3_3;
    output [4:0] out0;
    output [4:0] out1;
    output [4:0] out2;
    output [4:0] out3;
    output ACS0;
    output ACS1;
    output ACS2;
    output ACS3;
		 function [4:0] find_min_metric; input [4:0] a,b;
	begin
	if (a <= b) find_min_metric = a; else find_min_metric = b;
	end
	endfunction
	function set_control; input [4:0] a,b;
	begin
	if (a <= b) set_control = 0; else set_control = 1;
	end
	endfunction
	assign out0 = find_min_metric(p0_0,p2_0);
	assign out1 = find_min_metric(p0_1,p2_1);
	assign out2 = find_min_metric(p1_2,p3_2);
	assign out3 = find_min_metric(p1_3,p3_3);
	assign ACS0 = set_control (p0_0,p2_0);
	assign ACS1 = set_control (p0_1,p2_1);
	assign ACS2 = set_control (p1_2,p3_2);
	assign ACS3 = set_control (p1_3,p3_3);
	
	
endmodule
