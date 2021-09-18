/****************************************************************************
Description: Half Subtractor Using Dataflow
*****************************************************************************/

module half_sub_dataflow(
	input 		a_in,
    input		b_in,
	output		diff_out,
	output	    borrow_out
);

	assign	diff_out 	= a_in ^ b_in;
	assign 	borrow_out 	= ~a_in & b_in; 

endmodule