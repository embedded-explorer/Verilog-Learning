//--------------------------------------------------------------------------------
// File         : dff_sync_rst_async_clr.v
// Dependencies : 
// Description  : D Flip Flop with Synchronous Reset and Asynchronous Clear
//--------------------------------------------------------------------------------

module dff_sync_rst_async_clr(
  input      clk_i , // Input Clock
  input      rst_i , // Synchronous Reset
  input      clr_i , // Input Clear
  input      d_i   , // Input D
  output reg q_o   , // Output Q
  output     q_n_o   // Output ~Q
);
  
  // Combinational Logic
  assign q_n_o = ~q_o;
  
  // Sequential Logic
  always@(posedge clk_i, posedge clr_i)begin
    if(clr_i)begin
	// Asynchronous Clear
	  q_o <= 1'b0;
	end else begin
	  if(rst_i)begin
	  // Synchronous Reset
	    q_o <= 1'b0;
	  end else begin
	    q_o <= d_i;
	  end
	end
  end
  
endmodule