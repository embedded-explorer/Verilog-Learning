//--------------------------------------------------------------------------------
// File         : half_adder_using_nand.v
// Dependencies : 
// Description  : Implement half adder using 2 input NAND gates
//--------------------------------------------------------------------------------

module half_adder_using_nand(
  input  a_i, // Input A
  input  b_i, // Input B
  output s_o, // Sum
  output c_o  // Carry output
);
  
  wire ab_n; // Complemented Inputs
  wire [1:0] y; // Intermediate outputs
  
  // Combinational Logic
  // Inverted Inputs
  nand nand_0(ab_n, a_i, b_i);
  
  // Intermediate Logic
  nand nand_1(y[0], a_i, ab_n);
  nand nand_2(y[1], b_i, ab_n);
  
  // Final output
  nand nand_3(s_o, y[0], y[1]);
  nand nand_4(c_o, ab_n, ab_n);
  
endmodule