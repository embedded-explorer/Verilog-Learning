//--------------------------------------------------------------------------------
// File         : simulation_time.v
// Dependencies : 
// Description  : Demonstration of System Taks to get simulation time
//--------------------------------------------------------------------------------
`timescale 1ns/1ps

module simulation_time();
  
  initial begin
    #1.55;
    // %g is used to display real
    $display("$realtime : %0g", $realtime);
    // %t converts to simulation time unit
    $display("$realtime : %0t", $realtime);
    
    $display("$time : %0g", $time);
    $display("$time : %0t", $time);
    
    $display("$time : %0t", $stime);
    
  end

endmodule