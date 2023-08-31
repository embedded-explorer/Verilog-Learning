//--------------------------------------------------------------------------------
// File         : johnson_counter_4_bit_tb.v
// Dependencies : johnson_counter_4_bit.v
// Description  : Testbench for 8-bit johnson counter
//--------------------------------------------------------------------------------

module johnson_counter_4_bit_tb();

  // Signal Decleration
  reg        clk_i ;
  reg        rst_i ;
  wire [7:0] data_o;
  
  // Instantiation
  johnson_counter_4_bit dut(
    .clk_i (clk_i ),
    .rst_i (rst_i ),
	.data_o(data_o)
  );
  
  // Clock generation
  initial begin
    clk_i = 1'b0;
	forever #5 clk_i = ~clk_i;
  end

  // Logic to drive inputs and check outputs
  initial begin
    rst_i = 0;
	
	// Apply Reset
	@(negedge clk_i);
	rst_i <= 1'b1;
	@(negedge clk_i);
	rst_i <= 1'b0;
	
	repeat(30) @(posedge clk_i);
    #10 $finish;
  end

endmodule