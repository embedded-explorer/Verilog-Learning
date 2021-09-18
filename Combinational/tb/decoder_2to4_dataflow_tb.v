/********************************************************************************************
Description: test bench for full adder using data flow abstraction
*********************************************************************************************/

module decoder_2to4_dataflow_tb();

	reg   			a,b;
	wire  	[3:0]	y;
	integer 		i;

	decoder_2to4_dataflow dut(
		.a	(a	),
		.b	(b	),
		.y	(y	)
	);

	initial 
	begin
		a   = 1'b0;
		b   = 1'b0;
    end
				
	initial
    begin 
		for (i=0;i<4;i=i+1)
	    begin
			{a,b}=i;
			#10;
	    end
    end

	initial 
		$monitor("Input a=%b, b=%b, Output y=%b",a,b,y);

	initial #100 $finish;
			
endmodule
