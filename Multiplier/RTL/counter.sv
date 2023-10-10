//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : 4-Bit down counter
// File        : counter.sv
//----------------------------------------------------------------------------

module counter(
  input                 clk_i    , // Input Clock
  input                 rst_i    , // Input Reset
  input                 enable_i , // Input Enable
  input                 load_i   , // Input Load
  input          [3:0]  data_i   , // Input data [3:0]
  output  logic  [3:0]  count_o    // Output Count [3:0]
);

  always_ff @(posedge clk_i)begin
    if(rst_i)begin
    // Clear count upon Reset
      count_o <= 4'h0;
    end else begin
      if(load_i)begin
      // Load count value
        count_o <= data_i;
      end else if(enable_i)begin
      // Decrement count value
        count_o <= count_o - 1'b1;
      end
    end
  end

endmodule