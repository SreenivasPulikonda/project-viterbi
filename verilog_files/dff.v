`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:38:21 03/27/2014 
// Design Name: 
// Module Name:    dff 
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
module dff(D, Q, Clock, Reset);
    input D;
    output Q;
    input Clock;
    input Reset;
	 parameter CARDINALITY = 1;
	 reg [CARDINALITY-1:0] Q;
	 wire [CARDINALITY-1:0] D;
always @(posedge Clock) 
if (Reset !== 0) #1 Q = D;
else 
Q = 0;
endmodule
