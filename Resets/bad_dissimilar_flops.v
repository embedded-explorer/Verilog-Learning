//--------------------------------------------------------------------------------
// Bad practice of modelling dissimilar flops
// Testbench: sync_reset_tb.v
//--------------------------------------------------------------------------------

module bad_dissimilar_flops(
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
	  data_o <= data_d; // follower flop
	end
  end
  
endmodule
