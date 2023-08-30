//--------------------------------------------------------------------------------
// File         : tff_async_rst.v
// Dependencies : 
// Description  : T Flip Flop with Asynchronous Reset
//--------------------------------------------------------------------------------

module tff_async_rst(
  input      clk_i , // Input Clock
  input      rst_i , // Asynchronous Reset
  input      t_i   , // Input T
  output reg q_o   , // Output Q
  output     q_n_o   // Output ~Q
);
  
  // Combinational Logic
  assign q_n_o = ~q_o;
  
  // Sequential Logic
  always@(posedge clk_i, posedge rst_i)begin
    if(rst_i)begin
	// Asynchronous Reset
	  q_o <= 1'b0;
	end else begin
	  if(t_i)begin
	  // Toggle output
	    q_o <= ~q_o;
	  end
	end
  end
  
endmodule