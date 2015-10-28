`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    16:52:09 10/28/2015 
// Design Name: 
// Module Name:    Mux_8_1 
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
module Mux_8_1(
    input [11:0] d0,
	 input [11:0] d1,
	 input [11:0] d2,
	 input [11:0] d3,
	 input [11:0] d4,
	 input [11:0] d5,
	 input [11:0] d6,
	 input [11:0] d7,
    input [2:0] s,
	 output reg [11:0] out
    );

always @(*) begin
	case (s)
		3'b000: out = d0;
		3'b001: out = d1;
		3'b010: out = d2;
		3'b011: out = d3;
		3'b100: out = d4;
		3'b101: out = d5;
		3'b110: out = d6;
		3'b111: out = d7;
	endcase
end

endmodule
