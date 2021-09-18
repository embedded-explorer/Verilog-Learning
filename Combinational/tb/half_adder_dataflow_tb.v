/********************************************************************************************
Description: test bench for half adder
*********************************************************************************************/

module half_adder_dataflow_tb();

	reg   	a,b;
	wire  	sum,carry;
	integer i;

	half_adder_dataflow dut(a, b, sum, carry);

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
		$monitor("a = %b, b = %b, sum = %b, carry = %b",a,b,sum,carry);

	initial 
		#100 $finish;
			
endmodule

