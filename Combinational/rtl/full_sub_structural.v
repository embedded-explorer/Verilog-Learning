/**************************************************************************
Description: full subtractor using structural modelling
full subtractor using 2 half subtractors and an or gate
***************************************************************************/

module full_sub_structural(
	input 		a_in,
    input		b_in,
	input		c_in,
	output		diff_out,
	output	    borrow_out
);

	wire	[2:0] x;

	half_sub_dataflow half_sub_1(
		.a_in		(a_in	),
		.b_in		(b_in	),
		.diff_out	(x[0]	),
		.borrow_out	(x[1]	)
	);
	
	half_sub_dataflow half_sub_2(
		.a_in		(x[0]		),
		.b_in		(c_in		),
		.diff_out	(diff_out	),
		.borrow_out	(x[2]		)
	);
	
	or or_1(borrow_out, x[1], x[2]);

endmodule

