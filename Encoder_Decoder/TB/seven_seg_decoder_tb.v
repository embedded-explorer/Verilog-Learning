//--------------------------------------------------------------------------------
// File         : seven_seg_decoder_tb.v
// Dependencies : seven_seg_decoder.v
// Description  : Testbench for Common cathode BCD to seven segment decoder
//--------------------------------------------------------------------------------

module seven_seg_decoder_tb();

  // Signal Decleration
  reg  [3:0] i_i ;
  wire [6:0] y_o ;
  
  reg  [6:0] expected;
  integer i;
  
  // Instantiation
  seven_seg_decoder dut(
    .i_i  (i_i ),
    .y_o  (y_o )
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<16; i=i+1)begin
      i_i = i;
      #5;
      // Display the output
      $write($time, "ns Input : %b, Y : %b", i_i, y_o);
      // Check output
      case(i_i)
        4'h0    : expected = 7'b011_1111;
        4'h1    : expected = 7'b000_0110;
        4'h2    : expected = 7'b101_1011;
        4'h3    : expected = 7'b100_1111;
        4'h4    : expected = 7'b110_0110;
        4'h5    : expected = 7'b110_1101;
        4'h6    : expected = 7'b111_1101;
        4'h7    : expected = 7'b000_0111;
        4'h8    : expected = 7'b111_1111;
        4'h9    : expected = 7'b110_1111;
	  endcase
	  if((i_i >= 4'h0) && (i_i <= 4'h9))
	    if(y_o == expected)
	      $display(" Pass");
	    else
	      $display(" Fail");
	  else
	    $display(" Invalid");
    end
    #10 $finish;
  end

endmodule