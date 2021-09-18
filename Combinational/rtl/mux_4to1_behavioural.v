/*****************************************************************************
Description: 4 to 1 MUX using Behavioural abstraction
******************************************************************************/
 
module mux_4to1_behavioural(
	input 		[3:0]	data_in,
	input		[1:0]	sel_in,
	output	reg      	y_out
);

	always@(*)
	begin
		case(sel_in)
			2'b00	: y_out = data_in[0];
			2'b01	: y_out = data_in[1];
			2'b10	: y_out = data_in[2];
			2'b11	: y_out = data_in[3];
			default	: y_out = 1'b0;
		endcase
	end
	
endmodule
		
