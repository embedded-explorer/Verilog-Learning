//--------------------------------------------------------------------------------
// File         : divisible_by_3_and_4_tb.v
// Dependencies : divisible_by_3_and_4.v
// Description  : Testbench for 4-bit number divisible by 3 & 4
//--------------------------------------------------------------------------------

module divisible_by_3_and_4_tb();

  // Signal Decleration
  reg  a_i, b_i, c_i, d_i;
  wire y_o;
  
  integer i;
  
  // Instantiation
  divisible_by_3_and_4 dut(
    .a_i (a_i), // Bit 3
    .b_i (b_i), // Bit 2
    .c_i (c_i), // Bit 1
    .d_i (d_i), // Bit 0
    .y_o (y_o)  // Output
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<16; i = i+1)begin
	  {a_i, b_i, c_i, d_i} = i;
	  #5;
	  // Display the output
	  $write($time, "ns Input : %d, Output : %b", {a_i, b_i, c_i, d_i}, y_o);
	  // Check output
	  if(y_o == ((i%3 == 0) && (i%4 == 0)))
	    $display(" Pass");
	  else
	    $display(" Fail");
	  #5;
	end
	#10 $finish;
  end

endmodule