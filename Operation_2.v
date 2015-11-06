module Operation_2(
    input [4:0] x,
    input [4:0] y,
    output reg [11:0] out
    );

integer i, j;

always @(*) begin
    out[11:10] = 2'b01;
    out[9] = 1'bx;
	 i = {28'b0, x[3:0]};
	 j = {28'b0, y[3:0]};
    if (x[4] == y[4]) begin
        out[8] = x[4];
        out[7:0] = i + j;
    end
    else if (i > j) begin
        out[8] = x[4];
        out[7:0] = i - j;
    end
    else if (i < j) begin
        out[8] = y[4];
        out[7:0] = j - i;
    end
    else begin
		  out[8] = 1'b0;
        out[7:0] = 8'b0;
	 end
end

endmodule
