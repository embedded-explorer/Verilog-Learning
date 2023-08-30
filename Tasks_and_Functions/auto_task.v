/****************************************************************************
Description: Advantage of using automatic task
****************************************************************************/

module auto_task();

	task automatic disp(
		input	integer	a,
		input	integer	b
	);
	begin
		#(a) $display("%t : a = %d, b = %d", $time, a, b);
	end
	endtask
	
	initial
	#10 disp(1, 2);
	
	initial
	#10 disp(1, 4);
	
	initial
	#10 disp(2, 3);
	
endmodule
	