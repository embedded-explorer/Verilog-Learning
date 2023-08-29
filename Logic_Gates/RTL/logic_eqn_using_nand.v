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
  
  wire r_n, q_n; // Inverted Inputs
  wire [3:0] x; // Intermediate wires
  wire [1:0] y;
  wire [1:0] y_n;
  
  // Combinational Logic
  // Inverted Inputs
  nand nand_0(r_n, r_i, r_i);
  nand nand_1(q_n, q_i, q_i);
  
  // Stage 0
  nand nand_2(x[0], p_i, r_n);
  nand nand_3(x[1], p_i, d_i);
  nand nand_4(x[2], q_n, r_n);
  nand nand_5(x[3], q_n, d_i);
  
  // Stage 1
  nand nand_6(y[0], x[0], x[1]);
  nand nand_7(y[1], x[2], x[3]);
  
  // Stage 2
  nand nand_8(y_n[0], y[0], y[0]);
  nand nand_9(y_n[1], y[1], y[1]);
  
  // Stage 3
  nand nand_10(y_o, y_n[0], y_n[1]);
  
endmodule