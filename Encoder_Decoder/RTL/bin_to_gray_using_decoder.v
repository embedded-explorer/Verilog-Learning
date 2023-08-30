//--------------------------------------------------------------------------------
// File         : bin_to_gray_using_decoder.v
// Dependencies : decoder_4_to_16.v
// Description  : Implementation of Binary to Gray Code Converter using decoder
//--------------------------------------------------------------------------------

module bin_to_gray_using_decoder(
  input  [3:0] b_i , // Binary Input
  output [3:0] g_o   // Gray Output
);
  
  wire [15:0] y; // Decoder output
  
  // Instantiation
  decoder_4_to_16 dut(
    .i_i  (b_i ),
    .en_i (1'b1),
    .y_o  (y   )
  );
  
  or or_0(g_o[0], y[1], y[2], y[5], y[6], y[9], y[10], y[13], y[14]);
  or or_1(g_o[1], y[2], y[3], y[4], y[5], y[10], y[11], y[12], y[13]);
  or or_2(g_o[2], y[4], y[5], y[6], y[7], y[8], y[9], y[10], y[11]);
  or or_3(g_o[3], y[8], y[9], y[10], y[11], y[12], y[13], y[14], y[15]);

endmodule
