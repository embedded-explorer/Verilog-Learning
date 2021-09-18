/*****************************************************************************
Description: Testbench for 8to3 priority encoder using Behavioral abstraction
******************************************************************************/

module prienc_8to3_behavioral_tb();

	reg		[7:0]	i;
	wire	[2:0]	y;
	integer         j;
	
	prienc_8to3_behavioral dut(
		.in		(i	),
		.out	(y	)
	);
	
	task initialize;
	begin
		i	= 8'h00;
	end
	endtask
	
	task data_in(
		input	[7:0] d_in
	);
	begin
		i = d_in;
	end
	endtask
	
	initial
	begin
		initialize;
		for(j=0; j<256; j=j+1)
		begin
			data_in(j);
			#10;
		end
	end
	
	initial
		$monitor("In = %b, Out = %b", i, y);
		
	initial
		#3000 $finish;

endmodule