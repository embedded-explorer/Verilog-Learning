//--------------------------------------------------------------------------------
// File         : dff_sync_rst_async_clr_tb.v
// Dependencies : dff_sync_rst_async_clr.v
// Description  : Testbench for DFF with Synchronous Reset and Asynchronous Clear
//--------------------------------------------------------------------------------

module dff_sync_rst_async_clr_tb();

  // Signal Decleration
  reg  clk_i;
  reg  rst_i;
  reg  clr_i;
  reg  d_i  ;
  wire q_o  ;
  wire q_n_o;
  
  // Instantiation
  dff_sync_rst_async_clr dut(
    .clk_i (clk_i),
    .rst_i (rst_i),
	.clr_i (clr_i),
	.d_i   (d_i  ),
	.q_o   (q_o  ),
	.q_n_o (q_n_o)
  );
  
  // Clock generation
  initial begin
    clk_i = 1'b0;
	forever #5 clk_i = ~clk_i;
  end
  
  // Task for applying Reset
  task apply_rst();
    begin
	  @(negedge clk_i);
	  rst_i = 1'b1;
	  @(negedge clk_i);
	  rst_i = 1'b0;
	end
  endtask
  
  // Task for applying input
  task apply_input(input in);
    begin
	  @(negedge clk_i);
	  d_i = in;
	end
  endtask

  // Logic to drive inputs
  initial begin
    rst_i = 0; clr_i = 0; d_i = 0; // Initialize to known values
	apply_rst(); // Apply Reset
	apply_input(1);
	@(negedge clk_i);
	#2 clr_i = 1'b1;
	#10 clr_i = 1'b0;
	apply_input(1);
	apply_input(0);
	apply_input(1);
    #20 $finish;
  end

endmodule