//--------------------------------------------------------------------------------
// File         : divisible_by_3_and_4.v
// Dependencies : 
// Description  : 4-bit number divisible by 3 & 4 using NOR NOR Implementation
//--------------------------------------------------------------------------------

module divisible_by_3_and_4(
  input  a_i, // Bit 3
  input  b_i, // Bit 2
  input  c_i, // Bit 1
  input  d_i, // Bit 0
  output y_o  // Output
);
  
  wire a_b, b_b; // Complemented Inputs
  wire [1:0] y; // Partial outputs
  
  // Combinational Logic
  // Inverted Inputs
  nor nor_0(a_b, a_i, a_i);
  nor nor_1(b_b, b_i, b_i);
  
  // Intermediate Logic
  nor nor_2(y[0], a_i, b_b);
  nor nor_3(y[1], a_b, b_i);
  
  // Final output
  nor nor_4(y_o, y[0], y[1], c_i, d_i);
  
endmodule