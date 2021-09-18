/************************************************************************
Description: 1 to 8 demux using for loop
************************************************************************/

module demux_1to8_for(
	input				in,
    input		[2:0]	sel,
	output	reg	[7:0]	out
);
	
	integer i;
	
	always@(*)
	begin
		out = 8'h00;
		for(i=0; i<8; i=i+1)
			if(i == sel)
				out[i] = in;
	end			

endmodule