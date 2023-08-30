//--------------------------------------------------------------------------------
// File         : mux_4_to_1_tb.v
// Dependencies : mux_4_to_1.v
// Description  : Testbench for 4 to 1 multiplexer
//--------------------------------------------------------------------------------

module mux_4_to_1_tb();

  // Signal Decleration
  reg  [3:0] i_i;
  reg  [1:0] s_i;
  wire       y_o;
  
  integer i;
  
  // Instantiation
  mux_4_to_1 dut(
    .i_i (i_i),
    .s_i (s_i),
    .y_o (y_o)
  );

  // Logic to drive inputs and check outputs
  initial begin
    repeat(10)begin
      {s_i, i_i} = {$random % 64};
      #5;
      // Display the output
      $write($time, "ns Input : %b, Select : %b, Output : %b", i_i, s_i, y_o);
      // Check output
      if(y_o == (i_i[s_i]))
        $display(" Pass");
      else
	$display(" Fail");
      #5;
    end
    #10 $finish;
  end

endmodule
