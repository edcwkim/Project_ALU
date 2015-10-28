module Operation_3(
    input [4:0] x,
    input [4:0] y,
    output reg [11:0] out
    );

always @(*) begin
    out[11:10] = 2'b01;
    out[9] = 1'bx;
    out[8] = x[4] ^ y[4];
    out[7:0] = x[3:0] * y[3:0];
end

endmodule
