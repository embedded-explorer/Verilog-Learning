//--------------------------------------------------------------------------------
// File         : melay_fsm_101_tb.sv
// Dependencies : melay_fsm_101.v
// Description  : Testbench for Melay FSM to detect Overlapping 101 Sequence
//--------------------------------------------------------------------------------

module melay_fsm_101_tb();

  // Signal Decleration
  reg  clk_i;
  reg  rst_i;
  reg  d_i  ;
  wire y_o  ;
  
  // Instantiation
  melay_fsm_101 dut(
    .clk_i (clk_i ),
    .rst_i (rst_i ),
	.d_i   (d_i   ),
    .y_o   (y_o   )
  );

  // Clock generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end

  // Logic to drive inputs
  initial begin
    rst_i = 0; d_i = 0; // Initialize inputs
    
    // Apply Reset
    @(negedge clk_i);
    rst_i <= 1'b1;
    @(negedge clk_i);
    rst_i <= 1'b0;
    
	// Provide random inputs
	repeat(25)begin
	  d_i = {$random}%2;
	  @(posedge clk_i);
	end
	
    #50 $finish;
  end

endmodule