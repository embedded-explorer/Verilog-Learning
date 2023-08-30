//--------------------------------------------------------------------------------
// File         : logic_eqn_using_mux_tb.v
// Dependencies : logic_eqn_using_mux.v
// Description  : Testbench for F(A, B, C) = (0, 1, 3, 4, 6)
//--------------------------------------------------------------------------------

module logic_eqn_using_mux_tb();

  // Signal Decleration
  reg a_i, b_i, c_i;
  wire y_o;
  
  integer i;
  
  // Instantiation
  logic_eqn_using_mux dut(
    .a_i (a_i),
    .b_i (b_i),
    .c_i (c_i),
    .y_o (y_o)
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<8; i=i+1)begin
      {a_i, b_i, c_i} = i;
      #5;
      // Display the output
      $write($time, "ns A : %b, B : %b, C : %b, Y : %b", a_i, b_i, c_i, y_o);
      // Check output
      if(y_o == (i==0 | i==1 | i==3 | i==4 | i==6))
        $display(" Pass");
      else
	$display(" Fail");
      #5;
    end
    #10 $finish;
  end

endmodule
