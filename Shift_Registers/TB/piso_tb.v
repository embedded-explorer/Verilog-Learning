//--------------------------------------------------------------------------------
// File         : piso_tb.v
// Dependencies : piso.v
// Description  : Testbench for 4-bit parallel in serial out shift register
//--------------------------------------------------------------------------------

module piso_tb();

  // Signal Decleration
  reg        clk_i  ;
  reg        rst_i  ;
  reg        load_i ;
  reg  [3:0] data_i ;
  wire       data_o ;
  
  // Instantiation
  piso dut(
    .clk_i  (clk_i ),
    .rst_i  (rst_i ),
    .load_i (load_i),
    .data_i (data_i),
    .data_o (data_o)
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
  task apply_input(
    input [3:0] in,
	input       ld
  );
    begin
	  @(negedge clk_i);
	  load_i = ld;
	  data_i = in;
	  @(negedge clk_i);
	  load_i = 1'b0;
	end
  endtask
  
  // Logic to drive inputs and check outputs
  initial begin
    rst_i = 0; load_i = 0; data_i = 0; // Initialize to known values
    apply_rst(); // Apply Reset
	apply_input(4'hA, 1);
	repeat(4) @(posedge clk_i);
	apply_input(4'h5, 0);
	repeat(4) @(posedge clk_i);
	apply_input(4'h6, 1);
    #40 $finish;
  end

endmodule