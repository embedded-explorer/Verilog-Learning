//--------------------------------------------------------------------------------
// File         : pipo_tb.v
// Dependencies : pipo.v
// Description  : Testbench for 4-bit parallel in parallel out shift register
//--------------------------------------------------------------------------------

module pipo_tb();

  // Signal Decleration
  reg  [3:0] a_i ;
  reg  [3:0] b_i ;
  wire eq_o, gr_o, le_o;
  
  // Instantiation
  pipo dut(
    .a_i  (a_i ),
    .b_i  (b_i ),
    .eq_o (eq_o),
    .gr_o (gr_o),
    .le_o (le_o)
  );

  // Logic to drive inputs and check outputs
  initial begin
    repeat(10)begin
      {a_i, b_i} = {$random}%256;
      #5;
      // Display the output
      $write($time, "ns A : %b, B : %b, GR : %b, EQ : %b, LE : %b", 
              a_i, b_i, gr_o, eq_o, le_o);
      // Check output
      if({gr_o, eq_o, le_o} == ({(a_i > b_i),(a_i == b_i),(a_i < b_i)}))
        $display(" Pass");
      else
        $display(" Fail");
    end
    #10 $finish;
  end

endmodule