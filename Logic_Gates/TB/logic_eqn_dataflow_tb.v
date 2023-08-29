//--------------------------------------------------------------------------------
// File         : logic_eqn_dataflow_tb.v
// Dependencies : logic_eqn_dataflow.v
// Description  : Testbench for below logic equations
//                1. F = S(1, 2, 5, 7)
//                2. F1 = XZ + YZ'
//                   F2 = XY' + YZ'
//--------------------------------------------------------------------------------

/*
// 1. F = S(1, 2, 5, 7)
module logic_eqn_dataflow_tb();

  // Signal Decleration
  reg  a_i, b_i, c_i;
  wire f_o;
  
  integer i;
  
  // Instantiation
  logic_eqn_dataflow dut(
    .a_i (a_i),
    .b_i (b_i),
    .c_i (c_i),
    .f_o (f_o) 
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<8; i = i+1)begin
	  {a_i, b_i, c_i} = i;
	  #5;
	  // Display the output
	  $write($time, "ns A : %b, B : %b, C : %b, F : %b", 
	          a_i, b_i, c_i, f_o);
	  // Check output
	  if(f_o == ((i == 1) | (i == 2) | (i == 5) | (i == 7)))
	    $display(" Pass");
	  else
	    $display(" Fail");
	  #5;
	end
	#10 $finish;
  end

endmodule
*/

// 2. F1 = XZ + YZ'
//    F2 = XY' + YZ'
module logic_eqn_dataflow_tb();

  // Signal Decleration
  reg  x_i, y_i, z_i;
  wire f1_o, f2_o;
  
  integer i;
  
  // Instantiation
  logic_eqn_dataflow dut(
    .x_i  (x_i ),
    .y_i  (y_i ),
    .z_i  (z_i ),
    .f1_o (f1_o),
	.f2_o (f2_o)
  );

  // Logic to drive inputs and check outputs
  initial begin
    for(i=0; i<8; i = i+1)begin
	  {x_i, y_i, z_i} = i;
	  #5;
	  // Display the output
	  $write($time, "ns X : %b, Y : %b, Z : %b, F1 : %b, F2 : %b", 
	          x_i, y_i, z_i, f1_o, f2_o);
	  // Check output
	  if(f1_o == ((i == 2) | (i == 5) | (i == 6) | (i == 7)))
	    if(f2_o == ((i == 2) | (i == 4) | (i == 5) | (i == 6)))
	      $display(" Pass");
		else
		  $display(" Fail");
	  else
	    $display(" Fail");
	  #5;
	end
	#10 $finish;
  end

endmodule