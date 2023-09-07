//--------------------------------------------------------------------------------
// File         : divide_by_6.v
// Dependencies : 
// Description  : 8-bit johnson counter
//--------------------------------------------------------------------------------

// 1. Using Counter
//    Requires extra comparator logic to generate output

// 2. Using Jhonson Counter
module divide_by_6(
  input  clk_i , // Clock
  input  rst_i , // Reset
  output clk_o   // Output
);

  reg [2:0] q;
  
  assign clk_o = q[2];
  
  // Sequential Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
	  q <= 'b100;
	end else begin
	  q <= {~q[0], q[2:1]};
	end
  end

endmodule