`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:28:37 03/27/2014 
// Design Name: 
// Module Name:    metric 
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
module metric(m_in0, m_in1, m_in2, m_in3, m_out0, m_out1, m_out2, m_out3, clk, reset);
    input [4:0] m_in0;
    input [4:0] m_in1;
    input [4:0] m_in2;
    input [4:0] m_in3;
    output [4:0] m_out0;
    output [4:0] m_out1;
    output [4:0] m_out2;
    output [4:0] m_out3;
    input clk;
    input reset;
	dff #(5) metric3(m_in3, m_out3, clk, reset);
	dff #(5) metric2(m_in2, m_out2, clk, reset);
	dff #(5) metric1(m_in1, m_out1, clk, reset);
	dff #(5) metric0(m_in0, m_out0, clk, reset);

endmodule
