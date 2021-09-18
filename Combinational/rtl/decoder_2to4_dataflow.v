/********************************************************************************************
Description: 2 to 4 decoder using using dataflow modelling
*********************************************************************************************/

module decoder_2to4_dataflow(
	input 			a,
    input			b,
	output	[3:0]	y
);

	assign	y[0] = ~a & ~b;
	assign	y[1] = ~a &  b;
	assign	y[2] =  a & ~b;
	assign	y[3] =  a &  b;

endmodule
