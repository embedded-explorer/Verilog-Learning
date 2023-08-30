/****************************************************************************
Description: Drawback of using static function
****************************************************************************/

module static_function();
	
	integer result;
	integer i;
	
	initial
		for(i=0; i<7; i=i+1)
			$display("Factorial of %d = %d", i, fact(i));
	
	function integer fact(
		input	integer	num
	);
		if (num >= 2)
			fact = fact(num - 1) * num;
		else
			fact = 1;
	endfunction
	
endmodule
	