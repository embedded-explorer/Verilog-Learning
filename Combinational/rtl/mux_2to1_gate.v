/************************************************************************
Description: 2 to 1 mux using conditional operator
************************************************************************/

module mux_2to1_gate(
	input	[1:0]	in,
    input			sel,
	output			out
);
	
	wire x, y, z;

	not n1	(x, sel);
	and a1	(y, x, in[0]);
	and a2 	(z, sel, in[1]);
	or  o1 	(out, y, z);

endmodule