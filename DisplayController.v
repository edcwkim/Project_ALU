`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    16:21:03 10/28/2015
// Design Name:
// Module Name:    DisplayController
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
module DisplayController(
	input [11:0] val0,
	input [11:0] val1,
	input [11:0] val2,
	input [11:0] val3,
	input [11:0] val4,
	input [11:0] val5,
	input [11:0] val6,
	input [2:0] mode,
	output [6:0] seg5,
	output [6:0] seg4,
	output [6:0] seg3,
	output [6:0] seg2,
	output [6:0] seg1,
	output [6:0] seg0
	);

wire [11:0] selected;
wire [3:0] seg_bcd [0:5];

Mux_8_1 mux(val0, val1, val2, val3, val4, val5, val6, 12'bx, mode, selected);

ValToBCD v(selected, seg_bcd[5], seg_bcd[4], seg_bcd[3], seg_bcd[2], seg_bcd[1], seg_bcd[0]);

BCDto7SegmentDecoder b5(seg_bcd[5], seg5);
BCDto7SegmentDecoder b4(seg_bcd[4], seg4);
BCDto7SegmentDecoder b3(seg_bcd[3], seg3);
BCDto7SegmentDecoder b2(seg_bcd[2], seg2);
BCDto7SegmentDecoder b1(seg_bcd[1], seg1);
BCDto7SegmentDecoder b0(seg_bcd[0], seg0);

endmodule
