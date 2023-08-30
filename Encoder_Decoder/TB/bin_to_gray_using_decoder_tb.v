//--------------------------------------------------------------------------------
// File         : bin_to_gray_using_decoder_tb.v
// Dependencies : bin_to_gray_using_decoder.v
// Description  : Testbench for Binary to Gray Code Converter
//--------------------------------------------------------------------------------

module bin_to_gray_using_decoder_tb();

  // Signal Decleration
  reg  [3:0] b_i ;
  wire [3:0] g_o ;
  
  integer i;
  
  // Instantiation
  bin_to_gray_using_decoder dut(
    .b_i  (b_i ),
    .g_o  (g_o )
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<16; i=i+1)begin
      b_i = i;
      #5;
      // Display the output
      $write($time, "ns Binary : %b, Gray : %b", b_i, g_o);
      // Check output
      if(g_o == (b_i ^ (b_i>>1)))
        $display(" Pass");
      else
        $display(" Fail");
    end
    #10 $finish;
  end

endmodule
