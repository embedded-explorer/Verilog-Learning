//--------------------------------------------------------------------------------
// File         : bcd_counter.v
// Dependencies : 
// Description  : BCD Counter
//--------------------------------------------------------------------------------

module bcd_counter(
  input            clk_i     , // Clock
  input            rst_i     , // Reset
  input            enable_i  , // Enable
  output reg [3:0] count_o   , // Count Value
  output           overflow_o  // Count value reached maximum
);

  // Combinational Logic
  assign overflow_o = (count_o == 9) && enable_i;

  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
    // Clear count on reset
      count_o <= 'h0;
    end else begin
      if(enable_i)begin
        if(count_o >= 9)
        // Reset count to zero
          count_o <= 'h0;
        else
        // Increment count when counter is enabled
          count_o <= count_o + 1;
      end
    end
  end

endmodule