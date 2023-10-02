//--------------------------------------------------------------------------------
// File         : moore_fsm_101.v
// Dependencies : 
// Description  : Moore FSM to detect Overlapping 101 Sequence
//--------------------------------------------------------------------------------

module moore_fsm_101(
  input  clk_i , // Input Clock
  input  rst_i , // Reset
  input  d_i   , // Data Input
  output y_o     // Output - Sequence Detected
);
  
  // FSM State Encoding
  localparam [1:0] S0 = 2'b00; // Idle State 
  localparam [1:0] S1 = 2'b01; // 1 detected
  localparam [1:0] S2 = 2'b10; // 10 detected
  localparam [1:0] S3 = 2'b11; // 101 detected
  
  // FSM State Registers
  reg [1:0] curr_state;
  reg [1:0] next_state;
  
  // Sequential State Change Logic
  always@(posedge clk_i)begin
    if(rst_i)begin
    // Move to IDLE state upon reset
      curr_state <= S0;
    end else begin
      curr_state <= next_state;
    end
  end
  
  // Combinational Next State Decoder
  always@(*)begin
    case(curr_state)
      // IDLE state
      S0      : begin
        if(d_i)begin
          next_state = S1; // Detected 1
        end else begin
          next_state = S0;
        end
      end
      
      // 1 is detected
      S1      : begin
        if(!d_i)begin
          next_state = S2; // Detected 10
        end else begin
          next_state = S1;
        end
      end
      
      // 10 is detected
      S2      : begin
        if(d_i)begin
          next_state = S3; // Move to 1 detected state
        end else begin
          next_state = S0; // Need to detect from first
        end
      end
	  
	  // 101 is detected
	  S3      : begin
	    if(d_i)begin
          next_state = S1; // Move to 1 detected state
        end else begin
          next_state = S2; // Move to 10 detected state
        end
	  end
      
      default : begin
        next_state = S0;
      end
      
    endcase
  end
  
  // Combinational Output Logic
  assign y_o = (curr_state == S3);

endmodule