/*********************************************************************
Description: Testbench for half subtractor
*********************************************************************/

module half_sub_dataflow_tb();

	reg   	a,b;
	wire  	diff, borrow;
	integer i;

	half_sub_dataflow dut(a, b, diff, borrow);

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
		$monitor("a = %b, b = %b, diff = %b, borrow = %b",a,b,diff,borrow);

	initial 
		#100 $finish;
			
endmodule

