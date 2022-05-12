//--------------------------------------------------------------------------------
// Testbench for asynchronous reset
//--------------------------------------------------------------------------------

module async_reset_tb();

  reg  rst_n_i;
  reg  clk_i;
  reg  data_i;
  wire data_o;

  good_async_reset dut(
    .clk_i   (clk_i   ),
    .rst_n_i (rst_n_i ),
    .data_i  (data_i  ),
    .data_o  (data_o  )
  );

  initial begin
    clk_i = 1'b0;
	forever #5 clk_i = ~clk_i;
  end
  
  initial begin
    rst_n_i = 1'b0;
	data_i  = 1'b0;
	
	#12 data_i  = 1'b1;
	    rst_n_i = 1'b1;
	
	#35  rst_n_i = 1'b0;
	
	#50 rst_n_i = 1'b1;
	
	#45  rst_n_i = 1'b0;
	#2  rst_n_i = 1'b1;
	
  end
  
endmodule
