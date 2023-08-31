//--------------------------------------------------------------------------------
// File         : sipo.v
// Dependencies : 
// Description  : 4-bit serial in parallel out shift register
//--------------------------------------------------------------------------------

module sipo(
  input            clk_i , // Clock
  input            rst_i , // Reset
  input            data_i, // Parallel data input
  output reg [3:0] data_o  // Serial data output
);
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
    // Clear on reset
      data_o <= 'h0;
    end else begin
	// Right shift input serial data
      data_o <= {data_i, data_o[3:1]};
    end
  end
  
endmodule