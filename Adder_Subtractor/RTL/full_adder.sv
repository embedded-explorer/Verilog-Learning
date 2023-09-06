//--------------------------------------------------------------------------------
// File         : full_adder.sv
// Dependencies : 
// Description  : Full adder using dataflow abstarction
//--------------------------------------------------------------------------------

module full_adder(
  input  a_i, // Input A
  input  b_i, // Input B
  input  c_i, // Input Carry
  output s_o, // Sum Output
  output c_o  // Carry Output
);
  
  // Combinational Logic
  assign s_o = (a_i ^ b_i ^ c_i);
  assign c_o = (a_i & b_i) | (b_i & c_i) | (c_i & a_i);

endmodule