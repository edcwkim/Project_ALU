module Operation_0(
    input [4:0] x,
    input [4:0] y,
    output reg [11:0] out
    );

always @(*) begin
    out[11:10] = 2'b00;
    out[9:5] = x;
    out[4:0] = y;
end

endmodule
