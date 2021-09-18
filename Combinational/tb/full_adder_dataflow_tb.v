/**************************************************************************
Description: test bench for full adder using data flow abstraction
***************************************************************************/

module full_adder_dataflow_tb();
		
	reg   	a,b,cin;
	wire  	sum,carry;
	integer i;
	
	full_adder_dataflow dut(
		.a_in		(a		),
		.b_in		(b		),
		.c_in		(cin	),
		.sum_out	(sum	),
		.carry_out	(carry	)
	);

	initial 
	begin
		a   = 1'b0;
		b   = 1'b0;
		cin = 1'b0;
    end
				
	initial
    begin 
		for (i=0;i<8;i=i+1)
	    begin
			{a,b,cin}=i;
			#10;
	    end
    end
				
	initial 
		$monitor("Input a=%b, b=%b, c=%b, Output sum=%b, carry=%b"
					,a,b,cin,sum,carry);

	initial 
		#100 $finish;
			
endmodule
