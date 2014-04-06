`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:32:31 03/27/2014 
// Design Name: 
// Module Name:    out_decision 
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
module out_decision(p0, p1, p2, p3, control, out);
    input [2:0] p0;
    input [2:0] p1;
    input [2:0] p2;
    input [2:0] p3;
    input [1:0] control;
    output [2:0] out;
		function [2:0] decide;
	input [2:0] p0,p1,p2,p3; input [1:0] control;
	begin
	if(control == 0) decide = p0;
	else if(control == 1) decide = p1;
	else if(control == 2) decide = p2;
	else decide = p3;
	end
	endfunction
	assign out = decide(p0,p1,p2,p3,control);
	
endmodule
