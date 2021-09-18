/***********************************************************************
Description: 8 to 3 binary encoder using dataflow abstraction
************************************************************************/

module encoder_8to3_dataflow(
	input	[7:0]	i,
	output	[2:0]	y
);

	assign y[0] = i[1] | i[3] | i[5] | i[7];
	assign y[1] = i[2] | i[3] | i[6] | i[7];
	assign y[2] = i[4] | i[5] | i[6] | i[7];
	
endmodule
	