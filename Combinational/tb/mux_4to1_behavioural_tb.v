/*****************************************************************************
Description: Testbench for 4 to 1 MUX using Behavioural abstraction
******************************************************************************/

module mux_4to1_behavioural_tb();

	reg		[3:0]	data;
	reg		[1:0]	sel;
	wire			out;
	integer         i, j;
	
	mux_4to1_behavioural dut(
		.data_in	(data	),
		.sel_in		(sel	),
		.y_out		(out	)
	);
	
	task initialize;
	begin
		data	= 4'b0000;
		sel  	= 2'b00;
	end
	endtask
	
	task data_in;
		input	[3:0] d_in;
	begin
		data = d_in;
	end
	endtask
	
	task sel_in;
		input	[1:0] s_in;
	begin
		sel = s_in;
	end
	endtask
	
	initial
	begin
		for(i=0; i<4; i=i+1)
		begin
			sel_in(i);
			for(j=0; j<16; j=j+1)
			begin
				data_in(j);
				#10;
			end
		end
	end
	
	initial
		$monitor("Data = %b, Sel = %b, Out = %b", data, sel, out);
		
	initial
		#700 $finish;

endmodule