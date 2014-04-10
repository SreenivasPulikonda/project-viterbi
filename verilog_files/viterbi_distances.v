`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:21:13 03/27/2014 
// Design Name: 
// Module Name:    viterbi_distances 
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

//This module simulates the front end of a receiver. Normally the 
//received analog signal (with noise) is converted into a series of
//distance measures from the known eight possible transmitted PSK
//signals: s0,...,s7. We are not simulating the analog part or noise in
//this version, so we just take the digitally encoded 3-bit signal, Y,
//from the encoder and convert it directly to the distance measures.
//d[N] is the distance from signal = N to signal = 0
//inN is the distance from signal = N to encoder signal.
//d[N] is the distance from signal = N to encoder signal = 0.
//If encoder signal = J, shift the distances by 8-J positions.

module viterbi_distances(clk, res, Y2N, Y1N, Y0N, in0, in1, in2, in3, in4, in5, in6, in7);
    
    	input clk;
    	input res;
    	input Y2N;
    	input Y1N;
    	input Y0N;
    	output in0;
    	output in1;
    	output in2;
    	output in3;
    	output in4;
    	output in5;
    	output in6;
    	output in7;
    	reg [2:0] J,in0,in1,in2,in3,in4,in5,in6,in7;
	reg [2:0] d [7:0];
initial
	 begin
	 d[0] = 'b000;
	 d[1] = 'b001;
	 d[2] = 'b100;
	 d[3] = 'b110;
	 d[4] = 'b111;
	 d[5] = 'b110;
    	 d[6] = 'b100;
    	 d[7] = 'b001;
	 end
always @ (Y2N or Y1N or Y0N)
	 begin
	 J[0] = Y0N;
	 J[1] = Y1N;
	 J[2] = Y2N;
	 J = 8-J;
	 in0 = d[J];
	 J = J+1;
	 in1 = d[J];
	 J = J+1;
	 in2 = d[J];
    	 J = J+1;
    	 in3 = d[J];
    	 J = J+1;
    	 in4 = d[J];
    	 J = J+1;
    	 in5 = d[J];
    	 J = J+1;
    	 in6 = d[J];
    	 J = J+1;
    	 in7 = d[J];
	end 

endmodule
