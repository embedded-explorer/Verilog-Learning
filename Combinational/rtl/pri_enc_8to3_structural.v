/***********************************************************************
Description: 8 to 3 priority encoder using structural abstraction
************************************************************************/

module pri_enc_8to3_structural(
	input	[7:0]	i,
	output	[2:0]	y,
	output			idle
);
	wire	[7:0]	x;
	
	priority_8bit pri0(
		.in		(i		),
		.out	(x		),
		.idle	(idle	)
	);
	
	encoder_8to3_dataflow enc0(
		.i	(x	),
		.y	(y	)
	);

endmodule	