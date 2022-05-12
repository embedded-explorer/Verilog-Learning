//--------------------------------------------------------------------------------
// Example demonstrating asynchronous reset with reset synchronizer
// Testbench: async_reset_tb.v
//--------------------------------------------------------------------------------

module good_async_reset(
  input      clk_i,
  input      rst_n_i,
  input      data_i,
  output reg data_o
);

//--------------------------------------------------------------------------------
// Reset synchronizer logic
//--------------------------------------------------------------------------------
  reg  [1:0] rst_d;
  wire       rst_n;
  
  always@(posedge clk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
	  rst_d <= 1'b0;
	end else begin
	  rst_d <= {rst_d[0], 1'b1};
	end
  end
  
  assign rst_n = rst_d[1];
//--------------------------------------------------------------------------------
 
  always@(posedge clk_i, negedge rst_n) begin
    if (!rst_n) begin
	  data_o <= 1'b0;
	end else begin
	  data_o <= data_i;
	end
  end
  
endmodule
