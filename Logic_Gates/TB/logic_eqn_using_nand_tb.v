//--------------------------------------------------------------------------------
// File         : logic_eqn_using_nand_tb.v
// Dependencies : logic_eqn_using_nand.v
// Description  : Testbench for (P + Q').(R' + D)
//--------------------------------------------------------------------------------

module logic_eqn_using_nand_tb();

  // Signal Decleration
  reg  p_i, q_i, r_i, d_i;
  wire y_o;
  
  integer i;
  
  // Instantiation
  logic_eqn_using_nand dut(
    .p_i (p_i), // Bit 3
    .q_i (q_i), // Bit 2
    .r_i (r_i), // Bit 1
    .d_i (d_i), // Bit 0
    .y_o (y_o)  // Output
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<16; i = i+1)begin
	  {p_i, q_i, r_i, d_i} = i;
	  #5;
	  // Display the output
	  $write($time, "ns P : %b, Q : %b, R : %b, D : %b, Y : %b", 
	          p_i, q_i, r_i, d_i, y_o);
	  // Check output
	  if(y_o == ((p_i | ~q_i)&(~r_i | d_i)))
	    $display(" Pass");
	  else
	    $display(" Fail");
	  #5;
	end
	#10 $finish;
  end

endmodule