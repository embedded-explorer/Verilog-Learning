//--------------------------------------------------------------------------------
// File         : file_handling.v
// Dependencies : 
// Description  : Demonstration of File Handling operations in verilog
//--------------------------------------------------------------------------------

module file_handling();

  integer fp_1, fp_2;
  integer comb;
  integer a;
  
  initial begin
    a = 0;
    fp_1 = $fopen("file_1.txt");
    fp_2 = $fopen("file_2.txt");
    comb = fp_1 | fp_2;
    // Display channel discreptors
    $display("fp_1 = %08h, fp_2 = %08h", fp_1, fp_2);
    
    $fdisplay(fp_1, "-------- File 1 --------");
    $fdisplay(fp_2, "-------- File 2 --------");
    
    repeat(4)
      #2 a = a + 2;
    
    $fclose(fp_1);
    $fclose(fp_2);
  end
  
  // Write to both files
  initial
    $fmonitor(comb, $stime, ": a = %d", a);

endmodule