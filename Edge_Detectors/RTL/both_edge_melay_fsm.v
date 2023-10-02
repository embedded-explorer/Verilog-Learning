//--------------------------------------------------------------------------------
// File         : both_edge_melay_fsm.v
// Dependencies : 
// Description  : Logic to detect both edges using melay FSM
//--------------------------------------------------------------------------------

module both_edge_melay_fsm(
  input      clk_i , // Input Clock
  input      rst_i , // Reset
  input      d_i   , // Data Input
  output reg y_o     // Edge detected  
);
  
  reg  c_state;
  reg  n_state;
  
  localparam S0 = 1'b0;
  localparam S1 = 1'b1;
  
  // Sequential state change logic
  always@(posedge clk_i)begin
    if(rst_i)begin
	  c_state <= S0;
	end else begin
	  c_state <= n_state;
	end
  end
  
  // Combinational next state logic and output logic
  always@(*)begin
    case(c_state)
	  S0 : begin
	    if(d_i)begin
		// When 1 is detected move to state S1 making output 1
		  n_state = S1;
		  y_o     = 1'b1;
		end else begin
		  n_state = S0;
		  y_o     = 1'b0;
		end
	  end
	  S1 : begin
	    if(!d_i)begin
	    // When 0 is detected move to state S0 making output 1
		  n_state = S0;
		  y_o     = 1'b1;
		end else begin
		  n_state = S1;
		  y_o     = 1'b0;
		end
	  end
	endcase
  end

endmodule