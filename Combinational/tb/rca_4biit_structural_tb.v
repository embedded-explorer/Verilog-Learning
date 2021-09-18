/********************************************************************************************
Description: test bench for full adder using data flow abstraction
*********************************************************************************************/

module rca_4bit_structural_tb();

	reg   [3:0] a,b;
	reg   		cin;
	wire  [3:0]	sum;
	wire		cout;
	integer		i;

	rca_4bit_structural dut(
		.a_in		(a		),
		.b_in		(b		),
		.c_in		(cin	),
		.sum_out	(sum	),
		.carry_out	(cout 	)
	);

	initial 
	begin
		{cin, a, b}   = 9'h000;
    end
				
	initial
    begin 
		for(i=0;i<512;i=i+1)
		begin
			{cin, a, b} = i;
			#10;
		end
	end
		
	initial 
		$monitor("a=%b, b=%b, cin=%b, sum=%b, cout=%b",a,b,cin,sum,cout);
									
	initial 
		#6000 $finish;
			
endmodule
