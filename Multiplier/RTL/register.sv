//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : 8-Bit Parallel in Parallel out register
// File        : register.sv
//----------------------------------------------------------------------------

module register(
  input                 clk_i  , // Input Clock
  input                 rst_i  , // Input Reset
  input                 clear_i, // Input Clear
  input                 load_i , // Input Load
  input          [7:0]  data_i , // Input Data [7:0]
  output  logic  [7:0]  data_o   // Output Data [7:0]
);

  always_ff @(posedge clk_i)begin
    if(rst_i)begin
    // Clear on reset
      data_o <= 8'h0;
    end else begin
      if(clear_i)begin
      // Clear data
        data_o <= 8'h0;
      end else if(load_i)begin
      // Load parallel data
        data_o <= data_i;
      end
    end
  end

endmodule