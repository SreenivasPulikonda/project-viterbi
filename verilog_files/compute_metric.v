`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    21:57:44 03/27/2014 
// Design Name: 
// Module Name:    compute_metric 
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
module compute_metric(m_out0, m_out1, m_out2, m_out3, s0, s1, s2, s3, p0_0, p2_0, p0_1, p2_1, p1_2, p3_2, p1_3, p3_3, error);
    input [4:0] m_out0;
    input [4:0] m_out1;
    input [4:0] m_out2;
    input [4:0] m_out3;
    input [2:0] s0;
    input [2:0] s1;
    input [2:0] s2;
    input [2:0] s3;
    output [4:0] p0_0;
    output [4:0] p2_0;
    output [4:0] p0_1;
    output [4:0] p2_1;
    output [4:0] p1_2;
    output [4:0] p3_2;
    output [4:0] p1_3;
    output [4:0] p3_3;
    output error;
	 assign
	p0_0 = m_out0 + s0,
	p2_0 = m_out2 + s2,
	p0_1 = m_out0 + s2,
	p2_1 = m_out2 + s0,
	p1_2 = m_out1 + s1,
	p3_2 = m_out3 + s3,
	p1_3 = m_out1 + s3,
	p3_3 = m_out3 + s1;
	function is_error; input x1,x2,x3,x4,x5,x6,x7,x8;
	begin
	if (x1||x2||x3||x4||x5||x6||x7||x8) is_error = 1;
	else is_error = 0;
	end
	endfunction
	assign 
	error = is_error(p0_0[4],p2_0[4],p0_1[4],p2_1[4],
	p1_2[4],p3_2[4],p1_3[4],p3_3[4]);


endmodule
