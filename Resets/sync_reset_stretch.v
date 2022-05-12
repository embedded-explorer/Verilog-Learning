//--------------------------------------------------------------------------------
// Example demonstrating synchronous reset with pulse stretcher
// Testbench: sync_reset_tb.v
//--------------------------------------------------------------------------------

module sync_reset_stretch#(
  parameter  CYCLES = 2 // clock cycles by which pulse needs to be streched
)(
  input      clk_i,
  input      rst_n_i,
  input      data_i,
  output reg data_o
);

//--------------------------------------------------------------------------------
// Pulse stretching logic
//--------------------------------------------------------------------------------
  wire              rst_n;
  reg [CYCLES-1: 0] rst_n_d;
  
  always@ (posedge clk_i, negedge rst_n_i) begin
    if(!rst_n_i) begin
	  rst_n_d <= 'h0;                              // reset is applied in very next cycle
	end else begin
	  rst_n_d <= {rst_n_d[CYCLES-2:0], (rst_n_i)}; // reset is removed after 2 cycles
	end
  end
  
  assign rst_n = rst_n_d[CYCLES-1]; // stretched pulse
//--------------------------------------------------------------------------------
  
  always@(posedge clk_i) begin
    if (!rst_n) begin
	  data_o <= 1'b0;
	end else begin
	  data_o <= data_i;
	end
  end
  
endmodule
