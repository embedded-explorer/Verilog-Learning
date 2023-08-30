//--------------------------------------------------------------------------------
// File         : seven_seg_decoder.v
// Dependencies : 
// Description  : Common cathode BCD to seven segment decoder
//--------------------------------------------------------------------------------

module seven_seg_decoder(
  input  [3:0] i_i, // Input
  output [6:0] y_o  // Output
);
  
  // Intermediate assignment for simplicity
  wire a, b, c, d;
  assign d = i_i[0];
  assign c = i_i[1];
  assign b = i_i[2];
  assign a = i_i[3];

  // Combinational Logic
  assign y_o[0] = a | c | (b & d) | (~b & ~d);
  assign y_o[1] = ~b | (~c & ~d) | (c & d);
  assign y_o[2] = b | ~c | d;
  assign y_o[3] = a | (~b & ~d) | (c & ~d) | (~b & c) | (b & ~c & d);
  assign y_o[4] = (~b & ~d) | (c & ~d);
  assign y_o[5] = a | (~c & ~d) | (b & ~c) | (b & ~d);
  assign y_o[6] = a | (b & ~c) | (c & ~d) | (~b & c);
  
endmodule