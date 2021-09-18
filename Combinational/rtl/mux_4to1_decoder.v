/****************************************************************************
Description: 4:1 MUX using 2to4 decoder and tristate buffers
*****************************************************************************/

module mux_4to1_decoder(
	input	[3:0]	in,
	input	[1:0]	sel,
	output			y
);
	wire	[3:0]	x;

	decoder_2to4_dataflow dec0(
		.a	(sel[1]	),
		.b	(sel[0]	),
		.y	(x		)
	);
	
	bufif1  buf0(y, in[0], x[0]),
			buf1(y, in[1], x[1]),
			buf2(y, in[2], x[2]),
			buf3(y, in[3], x[3]);

endmodule