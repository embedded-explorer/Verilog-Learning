/*****************************************************************************
Description: 3 to 8 decoder using Behavioral abstraction
******************************************************************************/

module decoder_3to8_behavioral(
	input		[2:0]	in,
	output	reg	[7:0]	out
);

	always@(*)
	begin
		out = 8'h00;
		case(in)
			3'b000	: out[0] = 1'b1;
			3'b001	: out[1] = 1'b1;
			3'b010	: out[2] = 1'b1;
			3'b011	: out[3] = 1'b1;
			3'b100	: out[4] = 1'b1;
			3'b101	: out[5] = 1'b1;
			3'b110	: out[6] = 1'b1;
			3'b111	: out[7] = 1'b1;
			default	: out    = 8'h00;
		endcase
	end

endmodule