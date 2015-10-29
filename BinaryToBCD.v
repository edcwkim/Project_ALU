module BinaryToBCD(
	input [7:0] x,
	output reg [3:0] bcd2,
	output reg [3:0] bcd1,
	output reg [3:0] bcd0
);

integer i;

always @(*) begin
	bcd2 = 4'd0;
	bcd1 = 4'd0;
	bcd0 = 4'd0;
	for (i = 7; i >= 0; i = i - 1) begin
		if (bcd2 >= 5)
			bcd2 = bcd2 + 3;
		if (bcd1 >= 5)
			bcd1 = bcd1 + 3;
		if (bcd0 >= 5)
			bcd0 = bcd0 + 3;
		bcd2 = bcd2 << 1;
		bcd2[0] = bcd1[3];
		bcd1 = bcd1 << 1;
		bcd1[0] = bcd0[3];
		bcd0 = bcd0 << 1;
		bcd0[0] = x[i];
	end
end

endmodule
