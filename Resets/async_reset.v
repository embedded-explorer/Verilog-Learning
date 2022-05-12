//--------------------------------------------------------------------------------
// Example demonstrating asynchronous reset
// Testbench: async_reset_tb.v
//--------------------------------------------------------------------------------

module async_reset(
  input      clk_i,
  input      rst_n_i,
  input      data_i,
  output reg data_o
);

  always@(posedge clk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
	  data_o <= 1'b0;
	end else begin
	  data_o <= data_i;
	end
  end
  
endmodule
