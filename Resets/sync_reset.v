//--------------------------------------------------------------------------------
// Example demonstrating synchronous reset and missing of reset
// Testbench: sync_reset_tb.v
//--------------------------------------------------------------------------------

module sync_reset(
  input      clk_i,
`ifdef ACTIVE_LOW_RST
  input      rst_n_i,
`else
  input      rst_i,
`endif
  input      data_i,
  output reg data_o
);

  always@(posedge clk_i) begin
  `ifdef ACTIVE_LOW_RST
    if (!rst_n_i) begin
  `else
    if (rst_i) begin
  `endif
	  data_o <= 1'b0;
	end else begin
	  data_o <= data_i;
	end
  end
  
endmodule
