/*****************************************************************************
Description: Testbench for 3 to 8 decoder using Behavioral abstraction
******************************************************************************/

module decoder_3to8_behavioural_tb();

	reg		[2:0]	i;
	wire	[7:0]	y;
	integer         j;
	
	decoder_3to8_behavioral dut(
		.in		(i	),
		.out	(y	)
	);
	
	task initialize;
	begin
		i	= 3'b000;
	end
	endtask
	
	task data_in(
		input	[2:0] d_in
	);
	begin
		i = d_in;
	end
	endtask
	
	initial
	begin
		for(j=0; j<8; j=j+1)
		begin
			data_in(j);
			#10;
		end
	end
	
	initial
		$monitor("In = %b, Out = %b", i, y);
		
	initial
		#100 $finish;

endmodule