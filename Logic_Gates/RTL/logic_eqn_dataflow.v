//--------------------------------------------------------------------------------
// File         : logic_eqn_dataflow.v
// Dependencies : 
// Description  : Model below logic equations using dataflow abstraction
//                1. F = S(1, 2, 5, 7)
//                2. F1 = XZ + YZ'
//                   F2 = XY' + YZ'
//--------------------------------------------------------------------------------

/*
// 1. F = S(1, 2, 5, 7)
module logic_eqn_dataflow(
  input  a_i, // Input A
  input  b_i, // Input B
  input  c_i, // Input C
  output f_o  // Output F
);
  
  // Combinational Logic
  assign f_o = (~b_i & c_i) |
               (a_i & c_i) |
			   (~a_i & b_i & ~c_i);

endmodule
*/

// 2. F1 = XZ + YZ'
//    F2 = XY' + YZ'
module logic_eqn_dataflow(
  input  x_i , // Input X
  input  y_i , // Input Y
  input  z_i , // Input Z
  output f1_o, // Output F1
  output f2_o  // Output F2
);

  // Combinational Logic
  assign f1_o = (x_i & z_i) | (y_i & ~z_i);
  assign f2_o = (x_i & ~y_i) | (y_i & ~z_i);

endmodule