/********************************************************************************************
Description: 2 to 1 mux using conditional operator
*********************************************************************************************/

module mux_2to1_conditional(
	input	[1:0]	in,
    input			sel,
	output			out
);

	assign	out = sel ? in[1] : in [0];

endmodule

