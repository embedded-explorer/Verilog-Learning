/********************************************************************************************
Description: test bench for full adder using structural modelling
*********************************************************************************************/

module full_adder_structural_tb();

	reg   	a,b,cin;
	wire  	sum,carry;
	integer i;

	full_adder_structural dut(
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
		$monitor("a = %b, b = %b, c = %b, sum = %b, carry = %b"
					,a,b,cin,sum,carry);
		
	initial #100 $finish;
			
endmodule
