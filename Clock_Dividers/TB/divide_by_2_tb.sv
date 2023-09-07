//--------------------------------------------------------------------------------
// File         : divide_by_2_tb.sv
// Dependencies : divide_by_2.v
// Description  : Testbench for Clock Divide by 2
//--------------------------------------------------------------------------------

module divide_by_2_tb();

  // Signal Decleration
  reg  clk_i;
  reg  rst_i;
  wire clk_o;
  
  // Instantiation
  divide_by_2 dut(
    .clk_i (clk_i ),
    .rst_i (rst_i ),
    .clk_o (clk_o )
  );

  // Clock generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end

  // Logic to drive inputs
  initial begin
    rst_i = 0; // Initialize inputs
    
    // Apply Reset
    @(negedge clk_i);
    rst_i <= 1'b1;
    @(negedge clk_i);
    rst_i <= 1'b0;

    #50 $finish;
  end

endmodule