/********************************************************************************************
Description: test bench for 4:1 Mux using decoder and tristate buffers
*********************************************************************************************/

module mux_4to1_decoder_tb();
		
	reg   	[3:0]	in;
	reg		[1:0]	sel;
	wire  			out;
	integer 		i;

	mux_4to1_decoder dut(
		.in		(in	),
		.sel	(sel),
		.y		(out)
	);

	initial 
	begin
		{sel, in} = 6'b0000_00;
    end
				
	initial
    begin 
		for (i=0;i<64;i=i+1)
		begin
			{sel, in} = i;
			#10;
		end
    end
				
	initial 
		$monitor("sel=%b, in=%b, out=%b", sel, in, out);

	initial 
		#700 $finish;
			
endmodule
