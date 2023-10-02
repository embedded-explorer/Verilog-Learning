//--------------------------------------------------------------------------------
// File         : comp_4_bit_using_sub.v
// Dependencies : 
// Description  : 4-bit comparator using Subtraction
//--------------------------------------------------------------------------------

module comp_4_bit_using_sub(
  input  [3:0] a_i , // Input A
  input  [3:0] b_i , // Input B
  output       eq_o, // A == B
  output       gr_o, // A >= B
  output       le_o  // A <= B
);
  
  wire [3:0] d; // Difference
  wire [3:0] b; // Borrow
  
  // Outputs
  assign eq_o = (~d[0]) & (~d[1]) & (~d[2]) & (~d[3]);
  assign gr_o = (~b[3]) | eq_o;
  assign le_o = b[3];

  // Full Adder Instantiation
  full_adder fa_0(
    .a_i (~a_i[0]),
	.b_i (b_i[0] ),
	.c_i (1'b1   ),
	.s_o (d[0]   ),
	.c_o (b[0]   )
  );
  
  full_adder fa_1(
    .a_i (~a_i[1]),
	.b_i (b_i[1] ),
	.c_i (b[0]   ),
	.s_o (d[1]   ),
	.c_o (b[1]   )
  );
  
  full_adder fa_2(
    .a_i (~a_i[2]),
	.b_i (b_i[2] ),
	.c_i (b[1]   ),
	.s_o (d[2]   ),
	.c_o (b[2]   )
  );
  
  full_adder fa_3(
    .a_i (~a_i[3]),
	.b_i (b_i[3] ),
	.c_i (b[2]   ),
	.s_o (d[3]   ),
	.c_o (b[3]   )
  );
  
endmodule

// Full Adder
module full_adder(
  input  a_i,
  input  b_i,
  input  c_i,
  output s_o,
  output c_o
);

  assign {c_o, s_o} = a_i + b_i + c_i;

endmodule