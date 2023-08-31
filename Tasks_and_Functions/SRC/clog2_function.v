//--------------------------------------------------------------------------------
// File         : clog2_function.v
// Dependencies : 
// Description  : Demonstartion of constant functions
//--------------------------------------------------------------------------------

module clog2_function();
    
  // Function to calculate Log Base 2
  function [31:0] clog2(
    input  [31:0] value
  );
    integer temp;
    begin
      temp = value - 1;
      // Increment number of bits required by 1 until value becomes 0
      for (clog2 = 0; temp > 0; clog2 = clog2 + 1) begin
        temp = temp >> 1; // Divide value by 2
      end
    end
  endfunction
  
  initial begin
    $display($time, "ns: Value = 1024, Bits = %d", clog2(1024));
	$display($time, "ns: Value = 32, Bits = %d", clog2(32));
  end
    
endmodule