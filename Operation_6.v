module Operation_6(
                   input [5:0] x,
                   output reg [11:0] out
                   );

integer i;

always @(*)
begin

out[11:10] = 2'b10;
out[9:6] = 4'bxxxx;

out[5:0] = x[5:0];


for(i=0; i<4; i = i + 1) begin
    if(out[5-i] == 1 && out[4-i] == 0 && out[3-i] == 1)
        out[4-i] = 1;
    end

end
endmodule
