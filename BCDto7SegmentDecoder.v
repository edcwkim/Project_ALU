`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date:    15:44:52 10/28/2015
// Design Name:
// Module Name:    BCDto7SegmentDecoder
// Project Name:
// Target Devices:
// Tool versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////
module BCDto7SegmentDecoder(
   input [3:0] bcd,
   output reg [6:0] display
   );

always @ (*) begin
	case (bcd)
		4'd0: display = 7'b1111110;
      4'd1: display = 7'b0110000;
      4'd2: display = 7'b1101101;
      4'd3: display = 7'b1111001;
      4'd4: display = 7'b0110011;
      4'd5: display = 7'b1011011;
      4'd6: display = 7'b1011111;
      4'd7: display = 7'b1110000;
      4'd8: display = 7'b1111111;
      4'd9: display = 7'b1111011;
		4'd10: display = 7'b0000001;
		default: display = 7'b0000000;
	endcase
end

endmodule
