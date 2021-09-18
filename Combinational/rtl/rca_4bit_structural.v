/********************************************************************************************
Description: 4 bit ripple carry adder structural modelling
using 4 full adders
*********************************************************************************************/

module rca_4bit_structural(
	input	[3:0]	a_in,
    input	[3:0]	b_in,
	input			c_in,
	output	[3:0]	sum_out,
	output	    	carry_out
);

	wire	[2:0] x;

	full_adder_dataflow fa_1(
		.a_in		(a_in[0]	),
		.b_in		(b_in[0]	),
		.c_in		(c_in		),
		.sum_out	(sum_out[0]	),
		.carry_out	(x[0]       )
	);
	
	full_adder_dataflow fa_2(
		.a_in		(a_in[1]	),
		.b_in		(b_in[1]	),
		.c_in		(x[0]		),
		.sum_out	(sum_out[1]	),
		.carry_out	(x[1]       )
	);
	
	full_adder_dataflow fa_3(
		.a_in		(a_in[2]	),
		.b_in		(b_in[2]	),
		.c_in		(x[1]		),
		.sum_out	(sum_out[2]	),
		.carry_out	(x[2]       )
	);
	
	full_adder_dataflow fa_4(
		.a_in		(a_in[3]	),
		.b_in		(b_in[3]	),
		.c_in		(x[2]		),
		.sum_out	(sum_out[3]	),
		.carry_out	(carry_out  )
	);

endmodule

