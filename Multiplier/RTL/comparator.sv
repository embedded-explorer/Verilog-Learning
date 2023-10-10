//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : 4-Bit comparator to check whether input is zero
// File        : comparator.sv
//----------------------------------------------------------------------------

module comparator(
  input    [3:0]  a_i   , // Input A [3:0]
  output          zero_o  // Output A == 0
);
  
  // Need to check for 1 instead of 0 as decrement and comparison are done in same cycle
  assign zero_o = (a_i == 4'h1);
  
endmodule