//--------------------------------------------------------------------------------
// File         : display_task.v
// Dependencies : 
// Description  : Gotchas with using static/ noraml task
//--------------------------------------------------------------------------------

module display_task();
    
  // Task for displaying
  task disp(
    input integer a,
    input integer b
  );
    begin
      #(a) $display($time, "ns : a = %d, b = %d", a, b);
    end
  endtask
  
  // Call the task multiple times  
  initial
  #10 disp(1, 2);
  
  initial
  #10 disp(1, 4);
  
  initial
  #10 disp(2, 3);
    
endmodule
    