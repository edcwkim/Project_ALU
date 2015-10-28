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

integer flag;
wire [11:0] selected;
Mux_8_1 mux(val0, val1, val2, val3, val4, val5, val6, 11'bx, mode, selected);

reg [3:0] seg_temp5;
reg [3:0] seg_temp4;
reg [3:0] seg_temp3;
reg [3:0] seg_temp2;
reg [3:0] seg_temp1;
reg [3:0] seg_temp0;

always @(*) begin
	if (selected[11:10] == 2'b00) begin
		// val[0][9:0]: sign i1 i1 i1 i1 sign i2 i2 i2 i2
		seg_temp5 = 4'd11 - selected[9];
		seg_temp4 = div10q(selected[8:5]);
		seg_temp3 = div10r(selected[8:5]);
		seg_temp2 = 4'd11 - selected[4];
		seg_temp1 = div10q(selected[3:0]);
		seg_temp0 = div10r(selected[3:0]);
		if (seg_temp1 == 4'd0) begin
			seg_temp1 = seg_temp2;
			seg_temp2 = 4'd11;
		end
		if (seg_temp4 == 4'd0) begin
			seg_temp4 = seg_temp5;
			seg_temp5 = 4'd11;
		end
		if (seg_temp0 == 4'd0 && seg_temp1 == 4'd10)
			seg_temp1 = 4'd11;
		if (seg_temp3 == 4'd0 && seg_temp4 == 4'd10)
			seg_temp4 = 4'd11;
		/*
		BCDto7SegmentDecoder b5(4'd11 - selected[9],   seg5);
		BCDto7SegmentDecoder b4(selected[8:5] / 4'd10, seg4);
		BCDto7SegmentDecoder b3(selected[8:5] % 4'd10, seg3);
		BCDto7SegmentDecoder b2(4'd11 - selected[4],   seg2);
		BCDto7SegmentDecoder b1(selected[3:0] / 4'd10, seg1);
		BCDto7SegmentDecoder b0(selected[3:0] % 4'd10, seg0);
		if (seg4 == 7'b1111110) begin
			seg4 = seg5;
			seg5 = 7'b0000000;
		end
		if (seg1 == 7'b1111110) begin
			seg1 = seg2;
			seg2 = 7'b0000000;
		end
		if (seg0 == 7'b1111110 && seg1 == 7'b0000001)
			seg1 = 7'b0000000;
		*/
	end
	else if (selected[11:10] == 2'b01) begin
		// val[2][9:0]: sign null i i i i i i i i
		seg_temp5 = 4'd0;
		seg_temp4 = 4'd0;
		seg_temp3 = 4'd11 - selected[8];
		seg_temp2 = div10q(div10q(selected[7:0]));
		seg_temp1 = div10r(div10q(selected[7:0]));
		seg_temp0 = div10r(selected[7:0]);
		if (seg_temp2 == 4'd0) begin
			seg_temp2 = seg_temp3;
			seg_temp3 = 4'd11;
			if (seg_temp1 == 4'd0) begin
				seg_temp1 = seg_temp2;
				seg_temp1 = 4'd11;
			end
		end
		if (seg_temp0 == 4'd0 && seg_temp1 == 4'd10)
			seg_temp1 = 4'd11;
		/*
		seg5 = 7'b0000000;
		seg4 = 7'b0000000;
		BCDto7SegmentDecoder b3(4'd11 - selected[8],             seg3);
		BCDto7SegmentDecoder b2(selected[7:0] / 4'd100,          seg2);
		BCDto7SegmentDecoder b1((selected[7:0] / 4'd10) % 4'd10, seg1);
		BCDto7SegmentDecoder b0(selected[7:0] % 4'd10,           seg0);
		flag = 2;
		while (flag) begin
			if (seg[flag] == 7'b1111110) begin
				seg[flag] = seg[flag + 1];
				seg[flag + 1] = 7'b0000000;
				flag = flag - 1;
			end
			else
				flag = 0;
		end
		if (seg0 == 7'b1111110 && seg1 == 7'b0000001)
			seg1 = 7'b0000000;
		*/
	end
	else if (selected[11:10] == 2'b10) begin
		// val[1][9:0]: null null null null i i i i i i
		seg_temp5 = selected[5];
		seg_temp4 = selected[4];
		seg_temp3 = selected[3];
		seg_temp2 = selected[2];
		seg_temp1 = selected[1];
		seg_temp0 = selected[0];
		/*
		BCDto7SegmentDecoder b5(selected[5], seg5);
		BCDto7SegmentDecoder b4(selected[4], seg4);
		BCDto7SegmentDecoder b3(selected[3], seg3);
		BCDto7SegmentDecoder b2(selected[2], seg2);
		BCDto7SegmentDecoder b1(selected[1], seg1);
		BCDto7SegmentDecoder b0(selected[0], seg0);
		*/
	end
end

task div10q;
	input [7:0] i;
	output [4:0] o;
	integer count, temp, safe;
	begin
		count = 0;
		temp = i;
		safe = 0;
		while (temp >= 10 && safe < 60) begin
			count = count + 1;
			temp = temp - 10;
			safe = safe + 1;
		end
		o = count;
	end
endtask

task div10r;
	input [7:0] i;
	output [3:0] o;
	integer temp, safe;
	begin
		temp = i;
		safe = 0;
		while (temp >= 10 && safe < 60) begin
			temp = temp - 10;
			safe = safe + 1;
		end
		o = temp;
	end
endtask

BCDto7SegmentDecoder b5(seg_temp5, seg5);
BCDto7SegmentDecoder b4(seg_temp4, seg4);
BCDto7SegmentDecoder b3(seg_temp3, seg3);
BCDto7SegmentDecoder b2(seg_temp2, seg2);
BCDto7SegmentDecoder b1(seg_temp1, seg1);
BCDto7SegmentDecoder b0(seg_temp0, seg0);

endmodule
