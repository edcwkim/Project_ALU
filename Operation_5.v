module Operation_5(
                   input [5:0] x,
                   input [3:0] shift,
                   output reg [11:0] out
                   );

integer i;
integer shift_count;

always @(*) begin
	shift_count = x[3:1];

	out[11:10] = 2'b01;
	out[9:6] = 4'bxxxx;

	out[5:0] = x[5:0];

	if(shift[0] == 1) begin
		 for(i=0; i<6; i = i + 1)
			 if(i+shift_count>5)
				out[i] = 0;
			 else
				out[i] = out[i+shift_count];
	end

	else if(shift[0] == 0) begin
		 for(i=5; i>0; i = i - 1)
			 if(i-shift_count<0)
				out[i] = 0;
			 else
				out[i] = out[i-shift_count];
	end
end

endmodule