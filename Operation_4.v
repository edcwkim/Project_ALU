module Operation_4(
    input [5:0] x,
    output reg [11:0] out
	 );

integer i;

always @(*) begin
    out[11:10] = 2'b00;
    out[9] = 1'b0;
	 out[4] = 1'b0;
    out[8:5] = 4'b0;
	 out[3:0] = 4'b0;
    for (i = 0; i < 5; i = i + 1) begin
        out[8:5] = out[8:5] + x[i];
        out[3:0] = out[3:0] + ~x[i];
    end
end

endmodule
