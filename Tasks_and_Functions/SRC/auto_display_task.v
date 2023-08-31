//--------------------------------------------------------------------------------
// File         : auo_display_task.v
// Dependencies : 
// Description  : Demonstaration of automatic task
//--------------------------------------------------------------------------------

module auo_display_task();
    
  // Task for displaying
  task automatic disp(
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
    