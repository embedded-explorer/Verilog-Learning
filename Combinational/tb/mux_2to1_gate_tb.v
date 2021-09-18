/*******************************************************************
Description: test bench for 2:1 Mux
*******************************************************************/

module mux_2to1_gate_tb();
		
	reg   	[1:0]	in;
	reg				sel;
	wire  			out;
	integer 		i;

	mux_2to1_gate dut(
		.in		(in	),
		.sel	(sel),
		.out	(out)
	);

	initial 
	begin
		{sel, in} = 3'b000;
    end
				
	initial
	begin
		for (i=0;i<8;i=i+1)
		begin
			{sel, in} = i;
			#10;
		end
    end
				
	initial 
		$monitor("sel=%b, in=%b, out=%b", sel, in, out);

	initial 
		#100 $finish;
			
endmodule