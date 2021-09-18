/***************************************************************************
Description: test bench for full subtractor using structural modelling
***************************************************************************/

module full_sub_structural_tb();

	reg   	a,b,c;
	wire  	diff,borrow;
	integer i;

	full_sub_structural dut(
		.a_in		(a		),
		.b_in		(b		),
		.c_in		(c		),
		.diff_out	(diff	),
		.borrow_out	(borrow	)
	);

	initial 
	begin
		a   = 1'b0;
		b   = 1'b0;
		c	= 1'b0;
    end
				
	initial
    begin 
		for (i=0;i<8;i=i+1)
	    begin
			{a,b,c}=i;
			#10;
	    end
    end
				
	initial 
		$monitor("a = %b, b = %b, c = %b, diff = %b, borrow = %b"
					,a,b,c,diff,borrow);
		
	initial #100 $finish;
			
endmodule
