//--------------------------------------------------------------------------------
// File         : sipo_tb.v
// Dependencies : sipo.v
// Description  : Testbench for 4-bit serial in parallel out shift register
//--------------------------------------------------------------------------------

module sipo_tb();

  // Signal Decleration
  reg        clk_i  ;
  reg        rst_i  ;
  reg        data_i ;
  wire [3:0] data_o ;
  
  // Instantiation
  sipo dut(
    .clk_i  (clk_i ),
    .rst_i  (rst_i ),
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
  task apply_input(input in);
    begin
	  @(negedge clk_i);
	  data_i = in;
	end
  endtask
  
  // Logic to drive inputs and check outputs
  initial begin
    rst_i = 0; data_i = 0; // Initialize to known values
    apply_rst(); // Apply Reset
	apply_input(1); // LSB
	apply_input(0);
	apply_input(1);
	apply_input(0); // MSB
	repeat(4) @(posedge clk_i);
	apply_input(0); // LSB
	apply_input(1);
	apply_input(1);
	apply_input(0); // MSB
    #40 $finish;
  end

endmodule