//--------------------------------------------------------------------------------
// File         : comparator_4_bit.v
// Dependencies : 
// Description  : 4-bit comparator using behavioural modelling
//--------------------------------------------------------------------------------

module comparator_4_bit(
  input      [3:0] a_i , // Input A
  input      [3:0] b_i , // Input B
  output reg       eq_o, // A == B
  output reg       gr_o, // A > B
  output reg       le_o  // A < B
);
  
  // Combinational Logic
  always@(*)begin
    if(a_i > b_i)begin
	// A greater than B
	  eq_o = 1'b0;
	  gr_o = 1'b1;
	  le_o = 1'b0;
	end else if(a_i == b_i)begin
	// A equal to B
	  eq_o = 1'b1;
	  gr_o = 1'b0;
	  le_o = 1'b0;
	end else begin
	// A less than B
	  eq_o = 1'b0;
	  gr_o = 1'b0;
	  le_o = 1'b1;
	end
  end
  
endmodule