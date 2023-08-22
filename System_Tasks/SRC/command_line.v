//--------------------------------------------------------------------------------
// File         : command_line.v
// Dependencies : 
// Description  : Demonstration of passing command line arguments
//--------------------------------------------------------------------------------

module command_line();
  
  initial begin
    if($test$plusargs("CASE_1"))
      $display("Run by selectig case 1");
    if($test$plusargs("CASE_2"))
      $display("Run by selectig case 2");
  end

endmodule