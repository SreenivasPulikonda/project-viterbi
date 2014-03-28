`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:34:08 03/27/2014 
// Design Name: 
// Module Name:    viterbi_test_cdd 
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
module viterbi_test_cdd;

wire Error;
wire [2:0] Y, Out; // encoder out, decoder out
reg [1:0] X; // encoder inputs
reg Clk, Res; // clock and reset
wire [2:0] in0,in1,in2,in3,in4,in5,in6,in7;
always #500 $display("t Clk X Y Out Error");
initial $monitor("%4g",$time,,Clk,,,,X,,Y,,Out,,,,Error);
initial $dumpvars; initial #3000 $finish;
always #50 Clk = ~Clk; initial begin Clk = 0;
X = 3; // No special reason to start at 3.
#60 Res = 1;#10 Res = 0; end // Hit reset after inputs are stable.
always @(posedge Clk) #1 X = X + 1; // Drive the input with a counter.
viterbi_encode v_1
(X[1],X[0],Y[2],Y[1],Y[0],Clk,Res);
viterbi_distances v_2
(Y[2],Y[1],Y[0],Clk,Res,in0,in1,in2,in3,in4,in5,in6,in7);
viterbi v_3
(in0,in1,in2,in3,in4,in5,in6,in7,Out,Clk,Res,Error);
endmodule
