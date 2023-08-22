//--------------------------------------------------------------------------------
// File         : simulation_control.v
// Dependencies : 
// Description  : Demonstration of System Taks for simulation control
//--------------------------------------------------------------------------------

module simulation_control();
  
  initial begin
    #10;
    $finish(2); // Diagnostics parameter 2
  end

endmodule