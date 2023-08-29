//--------------------------------------------------------------------------------
// File         : logic_eqn_structural.v
// Dependencies : 
// Description  : Model below logic equations using structural abstraction
//                1. F = S(1, 2, 5, 7)
//                2. F1 = XZ + YZ'
//                   F2 = XY' + YZ'
//--------------------------------------------------------------------------------

/*
// 1. F = S(1, 2, 5, 7)
module logic_eqn_structural(
  input  a_i, // Input A
  input  b_i, // Input B
  input  c_i, // Input C
  output f_o  // Output F
);
  
  wire a_n, b_n, c_n; // Inverted inputs
  wire [2:0] x; // Intermediate wires
  
  // Combinational Logic
  // Inverted inputs
  not not_0(a_n, a_i);
  not not_1(b_n, b_i);
  not not_2(c_n, c_i);
  
  // Intermediate stage
  and and_0(x[0], b_n, c_i);
  and and_1(x[1], a_i, c_i);
  and and_2(x[2], a_n, b_i, c_n);
  
  // Output stage
  or or_0(f_o, x[0], x[1], x[2]);

endmodule
*/


// 2. F1 = XZ + YZ'
//    F2 = XY' + YZ'
module logic_eqn_structural(
  input  x_i , // Input X
  input  y_i , // Input Y
  input  z_i , // Input Z
  output f1_o, // Output F1
  output f2_o  // Output F2
);
  
  wire y_n, z_n; // Inverted inputs
  wire [2:0] x; // Intermediate wires
  
  // Combinational Logic
  // Inverted inputs
  not not_0(y_n, y_i);
  not not_1(z_n, z_i);
  
  // Intermediate stage
  and and_0(x[0], x_i, z_i);
  and and_1(x[1], y_i, z_n);
  and and_2(x[2], x_i, y_n);
  
  // Output stage
  or or_0(f1_o, x[0], x[1]);
  or or_1(f2_o, x[1], x[2]);

endmodule