/***************************************************************
Description: test bench for 8:1 Mux 
***************************************************************/

module demux_1to8_for_tb();
		
	reg   			in;
	reg		[2:0]	sel;
	wire  	[7:0]	out;
	integer 		i;

	demux_1to8_for dut(
		.in		(in	),
		.sel	(sel),
		.out	(out)
	);

	initial 
	begin
		{sel, in} = 4'h0;
    	end
				
	initial
    begin 
		for (i=0;i<16;i=i+1)
		begin
			{sel, in} = i;
			#10;
		end
    end
				
	initial 
		$monitor("sel=%b, in=%b, out=%b", sel, in, out);
			
endmodule

