//--------------------------------------------------------------------------------
// File         : full_adder_tb.sv
// Dependencies : full_adder.sv
// Description  : Testbench for BCD Counter
//--------------------------------------------------------------------------------

module full_adder_tb();

  // Signal Decleration
  reg   a_i; // Input A
  reg   b_i; // Input B
  reg   c_i; // Input C
  wire  s_o; // Output Sum
  wire  c_o; // Output Carry
  
  integer i;
  
  // Instantiation
  full_adder dut(
    .a_i (a_i), // Input A
    .b_i (b_i), // Input B
    .c_i (c_i), // Input C
    .s_o (s_o), // Output Sum
    .c_o (c_o)  // Output Carry
  );

  // Drive inputs and check result
  initial begin
    a_i = 0;
    b_i = 0;
    c_i = 0;
    for(i=0; i<8; i=i+1)begin
	  {c_i, b_i, a_i} = i;
	  #5;
	  if({c_o, s_o} == (c_i + b_i + a_i))begin
	    $display($time, " Cin = %b, B = %b, A = %b, Cout = %b, Sum = %b : Pass", c_i, b_i, a_i, c_o, s_o);
	  end else begin
	    $display($time, " Cin = %b, B = %b, A = %b, Cout = %b, Sum = %b : Fail", c_i, b_i, a_i, c_o, s_o);
	    $stop;
	  end
	end
	#5 $finish;
  end

endmodule