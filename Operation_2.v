module Operation_2(
    input [4:0] x,
    input [4:0] y,
    output reg [11:0] out
    );

always @(*) begin
    out[11:10] = 2'b01;
    out[9] = 1'bx;
    if (x[4] == y[4]) begin
        out[8] = x[4];
        out[7:0] = x[3:0] + y[3:0];
    end
    else if (x[3:0] > y[3:0]) begin
        out[8] = x[4];
        out[7:0] = x[3:0] - y[3:0];
    end
    else if (x[3:0] < y[3:0]) begin
        out[8] = y[4];
        out[7:0] = y[3:0] - x[3:0];
    end
    else
        out[8:0] = 9'b0;
end

endmodule
