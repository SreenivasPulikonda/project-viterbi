`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:12:57 03/27/2014 
// Design Name: 
// Module Name:    pathin 
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
module pathin(sout0, sout1, sout2, sout3, ACS0, ACS1, ACS2, ACS3, path0, clk, reset);
    input sout0;
    input sout1;
    input sout2;
    input sout3;
    input ACS0;
    input ACS1;
    input ACS2;
    input ACS3;
    input clk;
    input reset;
    output [11:0] path0;
	wire [2:0] sig0,sig1,sig2,sig3; wire [11:0] path_in;
	dff #(12) firstpath(path_in,path0,clk,reset);
	function [2:0] subset0; input sout0;
	begin
	if(sout0 == 0) subset0 = 0; else subset0 = 4;
	end
	endfunction
	function [2:0] subset1; input sout1;
	begin
	if(sout1 == 0) subset1 = 1; else subset1 = 5;
	end
	endfunction
	function [2:0] subset2; input sout2;
	begin
	if(sout2 == 0) subset2 = 2; else subset2 = 6;
	end
	endfunction
	function [2:0] subset3; input sout3;
	begin
	if(sout3 == 0) subset3 = 3; else subset3 = 7;
	end
	endfunction
	function [2:0] find_path; input [2:0] a,b; input control;
	begin
	if(control==0) find_path = a; else find_path = b;
	end
	endfunction
	assign sig0 = subset0(sout0);
	assign sig1 = subset1(sout1);
	assign sig2 = subset2(sout2);
	assign sig3 = subset3(sout3);
	assign path_in[11:9] = find_path(sig0,sig2,ACS0);
	assign path_in[ 8:6] = find_path(sig2,sig0,ACS1);
	assign path_in[ 5:3] = find_path(sig1,sig3,ACS2);
	assign path_in[ 2:0] = find_path(sig3,sig1,ACS3);

endmodule
