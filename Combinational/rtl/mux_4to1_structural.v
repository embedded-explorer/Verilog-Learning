/********************************************************************************************
Description: 4 to 1 mux using structural modelling
design 4 to 1 mux using 2 to 1 mux
*********************************************************************************************/

module mux_4to1_structural(
	input	[3:0]	in,
    input	[1:0]	sel,
	output			out
);

	wire	[1:0]	x;

	mux_2to1_conditional mux_1(
		.in		(in[1:0]),
		.sel	(sel[0]	),
		.out	(x[0]	)
	);
	
	mux_2to1_conditional mux_2(
		.in		(in[3:2]),
		.sel	(sel[0]	),
		.out	(x[1]	)
	);
	
	mux_2to1_conditional mux_3(
		.in		(x[1:0] ),
		.sel	(sel[1]	),
		.out	(out	)
	);

endmodule

