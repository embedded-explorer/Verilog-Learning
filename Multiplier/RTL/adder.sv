//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : 8-Bit Adder
// File        : adder.sv
//----------------------------------------------------------------------------

module adder(
  input   [7:0]  a_i, // Input A [7:0]
  input   [7:0]  b_i, // Input B [7:0]
  output  [7:0]  s_o  // Output Sum [7:0]
);
  
  // Assign sum output
  assign s_o = a_i + b_i;

endmodule