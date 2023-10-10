//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : Testbench
// File        : multiplier_tb.sv
//----------------------------------------------------------------------------
`include "multiplier_if.sv"

module multiplier_tb();

  logic         clk_i  ;
  logic         rst_i  ;
  
  // Instantiate Interface
  multiplier_if intf(clk_i, rst_i);
  
  // Instantiate Test Case
  //test_case test(intf);
  
  // Instantiate DUT
  multiplier multiplier(intf.dut_mp);
  
  // Clock Generation
  initial begin
    clk_i = 0;
    forever #5 clk_i = ~clk_i;
  end
  
  // Task to drive inputs and verify output
  task multipliy(
    input logic [3:0] a_i,
    input logic [3:0] b_i
  );
    // Apply start signal
    @(posedge clk_i);
    intf.tb_mp.start_i <= 1'b1;
    // Apply Input 1
    @(posedge clk_i);
    intf.tb_mp.start_i <= 1'b0;
    intf.tb_mp.data_i  <= a_i;
    // Apply Input 2
    @(posedge clk_i);
    intf.tb_mp.data_i  <= b_i;
    // Wait until multiplication is completed
    wait(intf.tb_mp.done_o);
    @(posedge clk_i);
    // Check the result
    assert(intf.tb_mp.data_o == a_i * b_i)
      $display("[PASS]: A = %d, B = %d, Result = %d", a_i, b_i, intf.tb_mp.data_o);
    else
      $display("[FAIL]: A = %d, B = %d, Result = %d", a_i, b_i, intf.tb_mp.data_o);
  endtask
  
  initial begin
    // Initialize all inputs
    rst_i   = 0;
    intf.tb_mp.start_i = 0;
    intf.tb_mp.data_i  = 0;
    
    // Apply Reset
    @(posedge clk_i);
    rst_i <= 1'b1;
    repeat(5)
      @(posedge clk_i);
    rst_i <= 1'b0;
    
    // Apply Directed Random Inputs
    repeat(5)
      multipliy($random, $random);
    
    #20 $finish;
  end
  
  initial begin
    $dumpfile("dump.vcd");
    $dumpvars(0, multiplier_tb.intf);
  end
  
endmodule