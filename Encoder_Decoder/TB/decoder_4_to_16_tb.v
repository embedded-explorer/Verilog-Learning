//--------------------------------------------------------------------------------
// File         : decoder_4_to_16_tb.v
// Dependencies : decoder_4_to_16.v
// Description  : Testbench for 4 to 16 Line Decoder
//--------------------------------------------------------------------------------

module decoder_4_to_16_tb();

  // Signal Decleration
  reg  [ 3:0] i_i ;
  reg         en_i;
  wire [15:0] y_o ;
  
  // Instantiation
  decoder_4_to_16 dut(
    .i_i  (i_i ),
    .en_i (en_i),
    .y_o  (y_o )
  );

  // Logic to drive inputs and check outputs
  initial begin
    en_i = 1'b1;
    repeat(10)begin
      i_i = {$random % 16};
      #5;
      // Display the output
      $write($time, "ns Input : %b, En : %b, Y : %b", i_i, en_i, y_o);
      // Check output
      if(en_i)
        if(y_o[i_i] == 1)
          $display(" Pass");
      else
        $display(" Fail");
      else
        if(y_o == 16'h0)
          $display(" Pass");
        else
          $display(" Fail");
    end
    #10 $finish;
  end

endmodule
