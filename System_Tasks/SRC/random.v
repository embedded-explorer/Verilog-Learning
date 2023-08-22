//--------------------------------------------------------------------------------
// File         : random.v
// Dependencies : 
// Description  : Demonstration of $random system task
//--------------------------------------------------------------------------------

module random();
  
  reg [31:0] data;
  
  initial begin
    // Generates signed 32-bit random number
    data = $random;
    $display("Number: %d", data);
    // Generates signed number between -9 to 9
    $display("Number: %d", $random%10);
    // Generates positive number from 0 to 9
    $display("Number: %d", {$random}%10);
    // Seed value makes sure same random number is returned in any machine
    $display("Number: %d", {$random(6)}%10);
  end

endmodule