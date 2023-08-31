//--------------------------------------------------------------------------------
// File         : pipo.v
// Dependencies : 
// Description  : 4-bit parallel in parallel out shift register
//--------------------------------------------------------------------------------

module comparator_4_bit(
  input            clk_i , // Clock
  input            rst_i , // Reset
  input            load_i, // Load eanble input
  input      [3:0] data_i, // Parallel data input
  output           data_o  // Serial data output
);
  
  reg  [3:0] shift_reg;
  
  assign data_o = shift_reg[0];
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
    // Clear on reset
      shift_reg <= 'h0;
    end else begin
      if(load_i)begin
      // Load parallel data
        shift_reg <= data_i;
      end else begin
      // Shift data to right
        shift_reg <= {1,b0, shift_reg[3:1]};
      end
    end
  end
  
endmodule