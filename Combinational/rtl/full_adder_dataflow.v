/**************************************************************************
Description: full adder using data flow abstraction
***************************************************************************/

module full_adder_dataflow(
	input 		a_in,
    input		b_in,
	input		c_in,
	output		sum_out,
	output	    carry_out
);

	assign	sum_out 	= a_in ^ b_in ^ c_in;
	assign 	carry_out 	= (a_in & b_in) | (b_in & c_in) | (a_in & c_in); 

endmodule

