/***********************************************************************
Description: 8 to 3 priority encoder testbench
************************************************************************/

module pri_enc_8to3_structural_tb();

	reg		[7:0] 	in;
	wire	[2:0] 	out;
	wire			idle;
	integer			i;
	
	pri_enc_8to3_structural dut(
		.i		(in		),
		.y		(out	),
		.idle	(idle	)
	);
	
	initial
		i = 8'h00;
		
	initial
	begin
		for(i=0;i<256;i=i+1)
		begin
			in = i;
			#10;
		end
	end
	
	initial
		$monitor("in = %b, out = %b, idle = %b", in, out, idle);
		
	initial
		#3000 $finish;
		
endmodule