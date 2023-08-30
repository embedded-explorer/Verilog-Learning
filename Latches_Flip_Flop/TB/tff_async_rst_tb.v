//--------------------------------------------------------------------------------
// File         : tff_async_rst_tb.v
// Dependencies : tff_async_rst.v
// Description  : Testbench for TFF with Asynchronous Reset
//--------------------------------------------------------------------------------

module tff_async_rst_tb();

  // Signal Decleration
  reg  clk_i;
  reg  rst_i;
  reg  t_i  ;
  wire q_o  ;
  wire q_n_o;
  
  // Instantiation
  tff_async_rst dut(
    .clk_i (clk_i),
    .rst_i (rst_i),
	.t_i   (t_i  ),
	.q_o   (q_o  ),
	.q_n_o (q_n_o)
  );
  
  // Clock generation
  initial begin
    clk_i = 1'b0;
	forever #5 clk_i = ~clk_i;
  end
  
  // Task for applying input
  task apply_input(input in);
    begin
	  @(negedge clk_i);
	  t_i = in;
	end
  endtask

  // Logic to drive inputs
  initial begin
    rst_i = 0; t_i = 0; // Initialize to known values
	
	// Apply Reset
	@(posedge clk_i);
    rst_i = 1'b1;
	@(posedge clk_i);
	rst_i = 1'b0;
	
	apply_input(1);
	@(negedge clk_i);
	@(negedge clk_i);
	@(negedge clk_i);
	
	#2 rst_i = 1'b1;
	#10 rst_i = 1'b0;
	
	apply_input(1);
	@(negedge clk_i);
	
	apply_input(0);
	@(negedge clk_i);
	@(negedge clk_i);
	@(negedge clk_i);
    #20 $finish;
  end

endmodule