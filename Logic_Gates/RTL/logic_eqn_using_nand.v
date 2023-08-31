//--------------------------------------------------------------------------------
// File         : logic_eqn_using_nand.v
// Dependencies : 
// Description  : Implement (P + Q').(R' + D) using 2 input NAND gates
//--------------------------------------------------------------------------------

module logic_eqn_using_nand(
  input  p_i, // Input P
  input  q_i, // Input Q
  input  r_i, // Input R
  input  d_i, // Input D
  output y_o  // Output
);

  wire p_n, d_n; // Inverted Inputs
  wire [1:0] y; // Intermediate wires
  wire       y_n;
  
  // Combinational Logic
  // Inverted Inputs
  nand nand_0(p_n, p_i, p_i);
  nand nand_1(d_n, d_i, d_i);
  
  // Stage 0
  nand nand_2(y[0], p_n, q_i);
  nand nand_3(y[1], d_n, r_i);

  // Stage 3
  nand nand_4(y_n, y[0], y[1]);
  
  // Output Stage
  nand nand_5(y_o, y_n, y_n);
  
endmodule