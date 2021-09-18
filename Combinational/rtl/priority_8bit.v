/***********************************************************************
Description: Circuit to give priority among 8 inputs
************************************************************************/

module priority_8bit(
	input	[7:0]	in,
	output	[7:0]	out,
	output			idle
);

	assign idle	= 	~in[0] & ~in[1] & ~in[2] & ~in[3] & 
					~in[4] & ~in[5] & ~in[6] & ~in[7];
					

	assign out[0] = in[0] & ~in[1] & ~in[2] & ~in[3] & ~in[4] & ~in[5] & ~in[6] & ~in[7];
	assign out[1] = in[1] & ~in[2] & ~in[3] & ~in[4] & ~in[5] & ~in[6] & ~in[7];
	assign out[2] = in[2] & ~in[3] & ~in[4] & ~in[5] & ~in[6] & ~in[7];
	assign out[3] = in[3] & ~in[4] & ~in[5] & ~in[6] & ~in[7];
	assign out[4] = in[4] & ~in[5] & ~in[6] & ~in[7];
	assign out[5] = in[5] & ~in[6] & ~in[7];
	assign out[6] = in[6] & ~in[7];
	assign out[7] = in[7];

endmodule

	