`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    18:13:22 10/28/2015 
// Design Name: 
// Module Name:    ALU 
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
module ALU(
    input [9:0] DIP_input,
    input [5:0] PUSHSW_input
    );

wire [11:0] val [0:6];
wire [2:0] mode;
wire [6:0] seg_output [0:5];

Operation_0 o0(DIP_input[9:5], DIP_input[4:0], val[0]);
Operation_1 o1(DIP_input[9:4], val[1]);
Operation_2 o2(DIP_input[9:5], DIP_input[4:0], val[2]);
Operation_3 o3(DIP_input[9:5], DIP_input[4:0], val[3]);
Operation_4 o4(DIP_input[9:4], val[4]);
Operation_5 o5(DIP_input[9:4], DIP_input[3:1], val[5]);
Operation_6 o6(DIP_input[9:4], val[6]);
ModeSelector s(PUSHSW_input, mode);

DisplayController dc(val[0], val[1], val[2], val[3], val[4], val[5], val[6], mode, seg_output[0], seg_output[1], seg_output[2], seg_output[3], seg_output[4], seg_output[5]);

endmodule
