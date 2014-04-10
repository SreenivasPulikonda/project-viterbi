`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:09:54 03/27/2014 
// Design Name: 
// Module Name:    viterbi_encode 
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
module viterbi_encode(X2N, X1N, Y2N, Y1N, Y0N, clk, res);  	//(2/3) encoder. X2N and X1N are the inputs
								//Y2N, Y1N, Y0N are the outputs of the encoder
    input X2N;
    input X1N;
    output Y2N;
    output Y1N;
    output Y0N;
    input clk;
    input res;
    wire X1N_1, X2N_2, Y2N, Y1N, Y0N;

    dff dff_1(X1N,X1N_1,clk,res); 				//Using D Flipflops as the Shift registers
    dff dff_2(X1N_1,X1N_2,clk,res);
    
    assign Y2N = X2N; 
    assign Y1N = X1N ^ X1N_2; 
    assign Y0N = X1N_1;

endmodule
