//--------------------------------------------------------------------------------
// File         : johnson_counter_4_bit.v
// Dependencies : 
// Description  : 8-bit johnson counter
//--------------------------------------------------------------------------------

module johnson_counter_4_bit(
  input            clk_i , // Clock
  input            rst_i , // Reset
  output reg [7:0] data_o  // Output
);
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
	  data_o <= 'h80;
	end else begin
	  data_o <= {~data_o[0], data_o[7:1]};
	end
  end
  
endmodule