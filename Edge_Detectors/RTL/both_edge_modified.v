//--------------------------------------------------------------------------------
// File         : both_edge_modified.v
// Dependencies : 
// Description  : Logic to detect posedge one cycle late and negedge as soon
//--------------------------------------------------------------------------------

module both_edge_modified(
  input  clk_i , // Input Clock
  input  rst_i , // Reset
  input  d_i   , // Data Input
  output y_1_o ,
  output y_2_o   
);
  
  reg  d_d; // Delayed input signal
  reg  d_p_d; // Delayed posedge 
  
  wire  d_p; // Posedge on input
  wire  d_n; // Negedge on input
  
  // Combinational Logic
  assign d_p = (d_i && ~d_d); // Posedge
  assign d_n = (~d_i && d_d); // Negedge

  // Output assignment
  assign y_1_o = d_p;
  assign y_2_o = d_p_d || d_n;
  
  // Sequential State Change Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
      d_d   <= 1'b0;
	  d_p_d <= 1'b0;
    end else begin
      d_d   <= d_i;
	  d_p_d <= d_p;
    end
  end

endmodule