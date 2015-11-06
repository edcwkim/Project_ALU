module Operation_1(
                   input [5:0] x,
                   output reg [11:0] out
);


always @(*)
    begin
out[11:10] = 2'b10;
out[9:6] = 4'bxxxx;
out[5:0] = x[5:0];
    end

endmodule



