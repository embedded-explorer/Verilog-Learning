//--------------------------------------------------------------------------------
// File         : full_adder_using_nand.v
// Dependencies : 
// Description  : Implement full adder using 2 input NAND gates
//--------------------------------------------------------------------------------

module full_adder_using_nand(
  input  a_i, // Input A
  input  b_i, // Input B
  input  c_i, // Carry input
  output s_o, // Sum
  output c_o  // Carry output
);
  
  wire ab_n; // Complemented Inputs
  wire [1:0] w; // Intermediate wires
  wire       x;
  wire       y;
  wire [1:0] z;
  
  // Combinational Logic
  // Stage 0
  nand nand_0(ab_n, a_i, b_i);
  
  // Stage 1
  nand nand_1(w[0], a_i, ab_n);
  nand nand_2(w[1], b_i, ab_n);
  
  // Stage 2
  nand nand_3(x, w[0], w[1]);
  
  // Stage 3
  nand nand_4(y, x, c_i);
  
  // Stage 4
  nand nand_5(z[0], x, y);
  nand nand_6(z[1], y, c_i);
  
  // Final output
  nand nand_7(s_o, z[0], z[1]);
  nand nand_8(c_o, ab_n, y);
  
endmodule