//--------------------------------------------------------------------------------
// File         : pri_enc_8_to_3_tb.v
// Dependencies : pri_enc_8_to_3.v
// Description  : Testbench for 8 Input priority encoder
//--------------------------------------------------------------------------------

module pri_enc_8_to_3_tb();

  // Signal Decleration
  reg  [7:0] i_i ;
  reg        en_i;
  wire [2:0] y_o ;
  
  reg  [2:0] expected;
  
  // Instantiation
  pri_enc_8_to_3 dut(
    .i_i  (i_i ),
	.en_i (en_i),
    .y_o  (y_o )
  );

  // Logic to drive inputs and check outputs
  initial begin
    en_i = 1'b1;
    repeat(10)begin
      i_i = {$random}%256;
      #5;
      // Display the output
      $write($time, "ns Input : %b, En : %b, Y : %b", i_i, en_i, y_o);
      // Check output
      casex(i_i)
        8'b1xxx_xxxx : expected = 3'b111;
        8'b01xx_xxxx : expected = 3'b110;
        8'b001x_xxxx : expected = 3'b101;
        8'b0001_xxxx : expected = 3'b100;
        8'b0000_1xxx : expected = 3'b011;
        8'b0000_01xx : expected = 3'b010;
        8'b0000_001x : expected = 3'b001;
        8'b0000_0001 : expected = 3'b000;
	  endcase
	  if(en_i)
	    if(y_o == expected)
	      $display(" Pass");
	    else
	      $display(" Fail");
	  else
	    $display(" Disabled");
    end
    #10 $finish;
  end

endmodule