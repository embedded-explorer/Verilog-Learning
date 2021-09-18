/**************************************************************************
Description: full adder using structural modelling
full adder using 2 half adders and an or gate
***************************************************************************/

module full_adder_structural(
	input 		a_in,
    input		b_in,
	input		c_in,
	output		sum_out,
	output	    carry_out
);

	wire	[2:0] x;

	half_adder_dataflow half_adder_1(
		.a_in		(a_in	),
		.b_in		(b_in	),
		.sum_out	(x[0]	),
		.carry_out	(x[1]	)
	);
	
	half_adder_dataflow half_adder_2(
		.a_in		(x[0]	),
		.b_in		(c_in	),
		.sum_out	(sum_out),
		.carry_out	(x[2]	)
	);
	
	or or_1(carry_out, x[1], x[2]);

endmodule

