/********************************************************************************************
Description: test bench for 4:1 Mux using decoder and tristate buffers
*********************************************************************************************/

module mux_4to1_structural_tb();
		
	reg   	[3:0]	in;
	reg		[1:0]	sel;
	wire  		out;
	integer 		i, j;

	mux_4to1_structural dut(
		.in		(in	),
		.sel		(sel	),
		.out		(out	)
	);

	initial 
	begin
		in  = 4'b0000;
		sel	= 2'b00;
    	end
				
	initial
    	begin 
		for (i=0;i<4;i=i+1)
		begin
			sel = i;
			for (j=0;j<16;j=j+1)
			begin
				in = j;
				#10;
			end
		end
    	end
				
	initial 
		$monitor("sel=%b, in=%b, y=%b", sel, in, out);

	initial 
		#700 $finish;
			
endmodule

