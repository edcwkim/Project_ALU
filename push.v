module ModeSelector(
input [5:0] pushsw_input,
output reg [2:0] mode
);

always @(*) begin

if(pushsw_input[5] == 1)
mode = 2'd1;

else if(pushsw_input[4] == 1)
mode = 2'd2;

else if(pushsw_input[3] == 1)
mode = 2'd3;

else if(pushsw_input[2] == 1)
mode = 2'd4;

else if(pushsw_input[1] == 1)
mode = 2'd5;

else if(pushsw_input[0] == 1)
mode = 2'd6;

else
mode = 2'd0;

end
endmodule





