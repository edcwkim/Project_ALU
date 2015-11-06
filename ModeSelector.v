module ModeSelector(
input [5:0] pushsw_input,
output reg [2:0] mode
);

always @(*) begin

if(pushsw_input[5] == 1'b1)
mode = 3'd1;

else if(pushsw_input[4] == 1'b1)
mode = 3'd2;

else if(pushsw_input[3] == 1'b1)
mode = 3'd3;

else if(pushsw_input[2] == 1'b1)
mode = 3'd4;

else if(pushsw_input[1] == 1'b1)
mode = 3'd5;

else if(pushsw_input[0] == 1'b1)
mode = 3'd6;

else
mode = 3'd0;

end
endmodule





