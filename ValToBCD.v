module ValToBCD(
	input [11:0] val,
	output reg [3:0] seg_bcd5,
	output reg [3:0] seg_bcd4,
	output reg [3:0] seg_bcd3,
	output reg [3:0] seg_bcd2,
	output reg [3:0] seg_bcd1,
	output reg [3:0] seg_bcd0
	);

	wire [11:0] bcd_a; wire [11:0] bcd_b; wire [11:0] bcd_c;
	BinaryToBCD ba({4'b0, val[8:5]}, bcd_a[11:8], bcd_a[7:4], bcd_a[3:0]);
	BinaryToBCD bb({4'b0, val[3:0]}, bcd_b[11:8], bcd_b[7:4], bcd_b[3:0]);
	BinaryToBCD bc(val[7:0],         bcd_c[11:8], bcd_c[7:4], bcd_c[3:0]);

	always @(*) begin
		if (val[11:10] == 2'b00) begin
			// val[9:0]: sign i1 i1 i1 i1 sign i2 i2 i2 i2
			seg_bcd5 = 4'd11 - val[9];
			seg_bcd4 = bcd_a[7:4];
			seg_bcd3 = bcd_a[3:0];
			seg_bcd2 = 4'd11 - val[4];
			seg_bcd1 = bcd_b[7:4];
			seg_bcd0 = bcd_b[3:0];
			if (seg_bcd1 == 4'd0) begin
				seg_bcd1 = seg_bcd2;
				seg_bcd2 = 4'd11;
			end
			if (seg_bcd4 == 4'd0) begin
				seg_bcd4 = seg_bcd5;
				seg_bcd5 = 4'd11;
			end
			if (seg_bcd0 == 4'd0 && seg_bcd1 == 4'd10)
				seg_bcd1 = 4'd11;
			if (seg_bcd3 == 4'd0 && seg_bcd4 == 4'd10)
				seg_bcd4 = 4'd11;
		end
		else if (val[11:10] == 2'b01) begin
			// val[9:0]: null sign i i i i i i i i
			seg_bcd5 = 4'd11;
			seg_bcd4 = 4'd11;
			seg_bcd3 = 4'd11 - val[8];
			seg_bcd2 = bcd_c[11:8];
			seg_bcd1 = bcd_c[7:4];
			seg_bcd0 = bcd_c[3:0];
			if (seg_bcd2 == 4'd0) begin
				seg_bcd2 = seg_bcd3;
				seg_bcd3 = 4'd11;
				if (seg_bcd1 == 4'd0) begin
					seg_bcd1 = seg_bcd2;
					seg_bcd2 = 4'd11;
				end
			end
			if (seg_bcd0 == 4'd0 && seg_bcd1 == 4'd10)
				seg_bcd1 = 4'd11;
		end
		else if (val[11:10] == 2'b10) begin
			// val[9:0]: null null null null i i i i i i
	      seg_bcd5 = val[5];
			seg_bcd4 = val[4];
			seg_bcd3 = val[3];
			seg_bcd2 = val[2];
			seg_bcd1 = val[1];
			seg_bcd0 = val[0];
		end
		else begin
			// error
			seg_bcd5 = 4'd10;
			seg_bcd4 = 4'd10;
			seg_bcd3 = 4'd10;
			seg_bcd2 = 4'd10;
			seg_bcd1 = 4'd10;
			seg_bcd0 = 4'd10;
		end
	end

endmodule
