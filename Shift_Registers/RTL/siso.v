//--------------------------------------------------------------------------------
// File         : siso.v
// Dependencies : 
// Description  : 4-bit serial in serial out shift register
//--------------------------------------------------------------------------------

module siso(
  input  clk_i , // Clock
  input  rst_i , // Reset
  input  data_i, // Parallel data input
  output data_o  // Serial data output
);
  
  reg  [3:0] shift_reg;
  
  assign data_o = shift_reg[0];
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
    // Clear on reset
      shift_reg <= 'h0;
    end else begin
	// Right shift input serial data
      shift_reg <= {data_i, shift_reg[3:1]};
    end
  end
  
endmodule