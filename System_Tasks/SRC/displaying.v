//--------------------------------------------------------------------------------
// File         : displaying.v
// Dependencies : 
// Description  : Demonstration of System Taks used for Displaying
//--------------------------------------------------------------------------------

/*
// Demonstration of $display and $write
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'b0101;
    
    // %m is used to display hierarchial scope of module
    $display("Data in '%m'");
    // Format specifiers can be either small or caps
    $display("Hex: %h, Dec: %d, Bin: %b, Oct: %o", data, data, data, data);
    
    $write("I am $write %t", $time);
    $write($time, " I still continue on same line");
  end

endmodule
*/

/*
// Demonstration of $strobe
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'h25;
    
    // Runs at end of current simulation time unit
    $strobe($time, ": $strode : Data = %h", data);
    // Runs at beginning of current simulation time unit
    $display($time, ": $display : Data = %h", data);
    // When does $monitor Run
    $monitor($time, ": $monitor : Data = %h", data);
    // When does $write Run
    $monitor($time, ": $write : Data = %h", data);
    
    data = 16'h73;
  end

endmodule
*/

// Demonstration of $monitor
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'h0;
    repeat(20) begin
      data = data + 1;
      #5;
    end
  end
  
  initial begin
    $monitor($time, ": Data: %d", data);
    #20 $monitoroff;
    #70 $monitoron;
  end

endmodule
