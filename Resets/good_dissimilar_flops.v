//--------------------------------------------------------------------------------
// Good practice of modelling dissimilar flops
// Testbench: sync_reset_tb.v
//--------------------------------------------------------------------------------

module good_dissimilar_flops(
  input      clk_i,
  input      rst_n_i,
  input      data_i,
  output reg data_o
);

  reg data_d;

  always@(posedge clk_i) begin
    if (!rst_n_i) begin
	  data_d <= 1'b0;
	end else begin
	  data_d <= data_i; // resettable flop
	end
  end
  
  // Use seperate procedural block for follower flops
  always@(posedge clk_i) begin
    data_o <= data_d; // follower flop
  end
  
endmodule
