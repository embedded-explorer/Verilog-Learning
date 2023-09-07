//--------------------------------------------------------------------------------
// File         : sync_up_counter_tb.sv
// Dependencies : sync_up_counter.v
// Description  : Testbench for 4-Bit Synchronous Up Counter
//--------------------------------------------------------------------------------

module sync_up_counter_tb();

  // Signal Decleration
  reg        clk_i     ;
  reg        rst_i     ;
  wire [3:0] count_o   ;

  integer i;
  
  // Instantiation
  sync_up_counter dut(
    .clk_i      (clk_i     ),
    .rst_i      (rst_i     ),
    .count_o    (count_o   )
  );

  // Clock generation
  initial begin
    clk_i = 1'b0;
    forever #5 clk_i = ~clk_i;
  end
  
  // Task to check outputs
  task check(
    input [3:0] expected
  );
    begin
      #1; // Wait for count to be stable
      assert(count_o == expected)
        $display($time, "[Pass] : Expected Count : %d, Actual Count : %d", 
                        expected, count_o);
    end
  endtask

  // Logic to drive inputs and check outputs
  initial begin
    rst_i = 0; // Initialize inputs
    
    // Apply Reset
    @(negedge clk_i);
    rst_i <= 1'b1;
    @(negedge clk_i);
    rst_i <= 1'b0;
    
    // Check count value
    for(i=0; i<16; i=i+1)begin
      check(i);
      @(posedge clk_i); 
    end
    
    // Check count against wrong value
    check(5); // Actaully it is 0

    #10 $finish;
  end

endmodule