`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    22:36:47 03/27/2014 
// Design Name: 
// Module Name:    reduce 
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
module reduce(in0, in1, in2, in3, m_in0, m_in1, m_in2, m_in3, control);
    input [4:0] in0;
    input [4:0] in1;
    input [4:0] in2;
    input [4:0] in3;
    output [4:0] m_in0;
    output [4:0] m_in1;
    output [4:0] m_in2;
    output [4:0] m_in3;
    output [1:0] control;
	wire [4:0] smallest;
function [4:0] find_smallest;
input [4:0] in0,in1,in2,in3; reg [4:0] a,b;
begin
if(in0 <= in1) a = in0; else a = in1;
if(in2 <= in3) b = in2; else b = in3;
if(a <= b) find_smallest = a;
else find_smallest = b;
end
endfunction
function [1:0] smallest_no;
input [4:0] in0,in1,in2,in3,smallest;
begin
if(smallest == in0) smallest_no = 0;
else if (smallest == in1) smallest_no = 1;
else if (smallest == in2) smallest_no = 2;
else smallest_no = 3;
end
endfunction
assign smallest = find_smallest(in0,in1,in2,in3);
assign m_in0 = in0 - smallest;
assign m_in1 = in1 - smallest;
assign m_in2 = in2 - smallest;
assign m_in3 = in3 - smallest;
assign control = smallest_no(in0,in1,in2,in3,smallest);

endmodule
