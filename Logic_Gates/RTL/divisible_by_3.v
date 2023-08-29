//--------------------------------------------------------------------------------
// File         : divisible_by_3.v
// Dependencies : 
// Description  : 4-bit number divisible by 3 using NAND NAND Implementation
//--------------------------------------------------------------------------------

module divisible_by_3(
  input  a_i, // Bit 3
  input  b_i, // Bit 2
  input  c_i, // Bit 1
  input  d_i, // Bit 0
  output y_o  // Output
);
  
  wire a_b, b_b, c_b, d_b; // Complemented Inputs
  wire [5:0] y; // Partial outputs
  
  // Combinational Logic
  // Inverted Inputs
  nand nand_0(a_b, a_i, a_i);
  nand nand_1(b_b, b_i, b_i);
  nand nand_2(c_b, c_i, c_i);
  nand nand_3(d_b, d_i, d_i);
  
  // Intermediate Logic
  nand nand_4(y[0], a_b, b_b, c_b, d_b);
  nand nand_5(y[1], a_b, b_b, c_i, d_i);
  nand nand_6(y[2], a_b, b_i, c_i, d_b);
  nand nand_7(y[3], a_i, b_b, c_b, d_i);
  nand nand_8(y[4], a_i, b_i, c_b, d_b);
  nand nand_9(y[5], a_i, b_i, c_i, d_i);
  
  // Final Output
  nand nand_10(y_o, y[0], y[1], y[2], y[3], y[4], y[5]);
  
endmodule