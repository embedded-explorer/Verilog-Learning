/***************************************************************
Description: test bench for 8:1 Mux 
***************************************************************/

module mux_8to1_for_tb();
		
	reg   	[7:0]	in;
	reg		[2:0]	sel;
	wire  			out;
	integer 		i, j;

	mux_8to1_for dut(
		.in		(in	),
		.sel	(sel),
		.out	(out)
	);

	initial 
	begin
		{sel, in} = 11'h000;
    	end
				
	initial
    	begin 
		for (i=0;i<8;i=i+1)
		begin
			sel = i;
			for (j=0;j<256;j=j+1)
			begin
				in = j;
				#10;
			end
		end
    	end
				
	initial 
		$monitor("sel=%b, in=%b, out=%b", sel, in, out);
			
endmodule

