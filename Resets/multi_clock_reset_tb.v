//--------------------------------------------------------------------------------
// Testbench for multi clock domain reset
//--------------------------------------------------------------------------------

module multi_clock_reset_tb();

  reg  rst_n_i;
  reg  aclk_i;
  reg  bclk_i;
  reg  cclk_i;
  
  wire arst_n_o;
  wire brst_n_o;
  wire crst_n_o;

  sequential_reset_removal dut(
    .aclk_i   (aclk_i   ),
    .bclk_i   (bclk_i   ),
    .cclk_i   (cclk_i   ),
    .rst_n_i  (rst_n_i  ),
	.arst_n_o (arst_n_o ),
	.brst_n_o (brst_n_o ),
	.crst_n_o (crst_n_o )
  );

  initial begin
    aclk_i = 1'b0;
	forever #5 aclk_i = ~aclk_i;
  end
  
  initial begin
    bclk_i = 1'b0;
	forever #8 bclk_i = ~bclk_i;
  end
  
  initial begin
    cclk_i = 1'b0;
	forever #12 cclk_i = ~cclk_i;
  end
  
  initial begin
         rst_n_i = 1'b0;
	
	#60  rst_n_i = 1'b1;
	
	#75  rst_n_i = 1'b0;
	
	#2   rst_n_i = 1'b1;
	
  end
  
endmodule
