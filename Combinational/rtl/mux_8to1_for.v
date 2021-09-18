/************************************************************************
Description: 8 to 1 mux using for loop
************************************************************************/

module mux_8to1_for(
	input		[7:0]	in,
    input		[2:0]	sel,
	output	reg			out
);
	
	integer i;
	
	always@(*)
	begin
		out = 0;
		for(i=0; i<8; i=i+1)
			if(i == sel)
				out = in[i];
	end			

endmodule