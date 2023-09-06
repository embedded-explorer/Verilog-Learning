//--------------------------------------------------------------------------------
// File         : bcd_counter_tb.sv
// Dependencies : bcd_counter.v
// Description  : Testbench for BCD Counter
//--------------------------------------------------------------------------------

module bcd_counter_tb();

  // Signal Decleration
  reg        clk_i     ;
  reg        rst_i     ;
  reg        enable_i  ;
  wire [3:0] count_o   ;
  wire       overflow_o;
  
  // Instantiation
  bcd_counter dut(
    .clk_i      (clk_i     ),
    .rst_i      (rst_i     ),
    .enable_i   (enable_i  ),
    .count_o    (count_o   ),
    .overflow_o (overflow_o)
  );

  // Clock generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  // Task to check outputs
  task check(
    input [3:0] count   ,
    input       overflow
  );
    begin
      #1; // Wait for count to be stable
      if(overflow_o != overflow)
        $error("Counter failed to overflow");
      if(count_o != count)
        $error("Unexpected count value");
    end
  endtask

  // Logic to drive inputs and check outputs
  initial begin
    rst_i = 0; enable_i = 0; // Initialize inputs
    
    // Apply Reset
    @(negedge clk_i);
    rst_i <= 1'b1;
    @(negedge clk_i);
    rst_i <= 1'b0;
    
    // Enable counter
    @(negedge clk_i);
    enable_i <= 1'b1;
    
    // Allow counter to count up
    repeat(5) @(posedge clk_i);
    check(5, 0); // Check the output
    
    // Check counter overflow condition
    repeat(4) @(posedge clk_i);
    check(9, 1); // Check the output
    @(posedge clk_i);
    check(0, 0);
    
    // Disable the counter
    enable_i <= 1'b0;
    repeat(4) @(posedge clk_i);
    check(0, 0); // Check whether count is incermenting
    enable_i <= 1'b1;
    
    // Check for unexpected count value
    @(posedge clk_i);
    check(4, 0);
    
    // Check for unexpected overflow value
    @(posedge clk_i);
    check(2, 1);
    
    repeat(5) @(posedge clk_i);
    #10 $finish;
  end

endmodule