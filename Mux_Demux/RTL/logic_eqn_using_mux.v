//--------------------------------------------------------------------------------
// File         : logic_eqn_using_mux.v
// Dependencies : mux_4_to_1.v
// Description  : Implement F(A, B, C) = (0, 1, 3, 4, 6) using 4 to 1 Mux
//--------------------------------------------------------------------------------

module logic_eqn_using_mux(
  input  a_i, // Input A
  input  b_i, // Input B
  input  c_i, // Input C
  output y_o  // Output
);
  
  wire a_n; // Inverted Input

  // Combinational Logic
  assign a_n = ~a_i;

  // Instantiation
  mux_4_to_1 mux_4_to_1(
    .i_i ({a_n, a_i, a_n, 1'b1}),
    .s_i ({b_i, c_i}),
    .y_o (y_o)
  );
  
endmodule
