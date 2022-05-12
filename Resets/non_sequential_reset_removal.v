//--------------------------------------------------------------------------------
// Example demonstrating multi clock non sequential reset removal
// ATestbench: multi_clock_reset_tb.v
//--------------------------------------------------------------------------------

module non_sequential_reset_removal(
  input      aclk_i,
  input      bclk_i,
  input      cclk_i,
  input      rst_n_i,
  output     arst_n_o,
  output     brst_n_o,
  output     crst_n_o
);

//--------------------------------------------------------------------------------
// Reset synchronizer logic for clock domain A
//--------------------------------------------------------------------------------
  reg  [1:0] arst_d;
  
  always@(posedge aclk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
	  arst_d <= 1'b0;
	end else begin
	  arst_d <= {arst_d[0], 1'b1};
	end
  end
  
  assign arst_n_o = arst_d[1];
 
//--------------------------------------------------------------------------------
// Reset synchronizer logic for clock domain B
//--------------------------------------------------------------------------------
  reg  [1:0] brst_d;
  
  always@(posedge bclk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
	  brst_d <= 1'b0;
	end else begin
	  brst_d <= {brst_d[0], 1'b1};
	end
  end
  
  assign brst_n_o = brst_d[1];
  
//--------------------------------------------------------------------------------
// Reset synchronizer logic for clock domain C
//--------------------------------------------------------------------------------
  reg  [1:0] crst_d;
  
  always@(posedge cclk_i, negedge rst_n_i) begin
    if (!rst_n_i) begin
	  crst_d <= 1'b0;
	end else begin
	  crst_d <= {crst_d[0], 1'b1};
	end
  end
  
  assign crst_n_o = crst_d[1];
  
//--------------------------------------------------------------------------------
  
endmodule
