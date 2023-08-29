//--------------------------------------------------------------------------------
// File         : half_adder_using_nand_tb.v
// Dependencies : half_adder_using_nand.v
// Description  : Testbench for half adder
//--------------------------------------------------------------------------------

module half_adder_using_nand_tb();

  // Signal Decleration
  reg  a_i, b_i;
  wire s_o, c_o;
  
  integer i;
  
  // Instantiation
  half_adder_using_nand dut(
    .a_i (a_i), // Input A
    .b_i (b_i), // Input B
    .s_o (s_o), // Sum
    .c_o (c_o)  // Carry output
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<4; i = i+1)begin
	  {a_i, b_i} = i;
	  #5;
	  // Display the output
	  $write($time, "ns A : %b, B : %b, Sum : %b, Cout : %b", 
	          a_i, b_i, s_o, c_o);
	  // Check output
	  if({c_o, s_o} == (a_i + b_i))
	    $display(" Pass");
	  else
	    $display(" Fail");
	  #5;
	end
	#10 $finish;
  end

endmodule