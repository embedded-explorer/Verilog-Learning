//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : Controlpath
// File        : controlpath.sv
//----------------------------------------------------------------------------

module controlpath(
  input          clk_i    , // Input Clock
  input          rst_i    , // Input Reset
  input          start_i  , // Start Multiplication
  output  logic  done_o   , // Multiplication Done
  
  input          zero_i   , // Counter Q is Zero
  output  logic  load_p_o , // Load Register P
  output  logic  load_q_o , // Load Counter Q
  output  logic  load_f_o , // Load Register F
  output  logic  clr_f_o  , // Clear Register F
  output  logic  dec_q_o    // Decrement Counter Q
);
  
  // Datatype for FSM states
  typedef enum logic[2:0] {
    S0 = 3'b000,
    S1 = 3'b001,
    S2 = 3'b010,
    S3 = 3'b011,
    S4 = 3'b100
  } fsm_state_t;
  
  // FSM State Registers
  fsm_state_t curr_state;
  fsm_state_t next_state;
  
  // Sequential Next State Logic
  always_ff @(posedge clk_i)begin
    if(rst_i)begin
      curr_state <= S0;
    end else begin
      curr_state <= next_state;
    end
  end
  
  // Combinational Next State Decoder
  always_comb begin
    case(curr_state)
    
      S0 : begin
        if(start_i)begin
        // Move to next state on receiving start signal
          next_state = S1;
        end else begin
          next_state = S0;
        end
      end
      
      S1 : begin
      // Unconditionally move to next State
        next_state = S2;
      end
      
      S2 : begin
      // Unconditionally move to next State
        next_state = S3;
      end
      
      S3 : begin
        if(zero_i)begin
        // Move to next state on receiving zero signal
          next_state = S4;
        end else begin
          next_state = S3;
        end
      end
      
      S4 : begin
      // Unconditionally move to next State
        next_state = S0;
      end
      
      default : begin
        next_state = S0;
      end
      
    endcase
  end
  
  // Combinational Output logic
  always_comb begin
    case(curr_state)
    
      S0 : begin
        load_p_o = 1'b0;
        load_q_o = 1'b0;
        load_f_o = 1'b0;
        clr_f_o  = 1'b0;
        dec_q_o  = 1'b0;
        done_o   = 1'b0;
      end
      
      S1 : begin
        load_p_o = 1'b1; // Load Register P
        load_q_o = 1'b0;
        load_f_o = 1'b0;
        clr_f_o  = 1'b0;
        dec_q_o  = 1'b0;
        done_o   = 1'b0;
      end
      
      S2 : begin
        load_p_o = 1'b0;
        load_q_o = 1'b1; // Load Counter Q
        load_f_o = 1'b0;
        clr_f_o  = 1'b1; // Clear Register F
        dec_q_o  = 1'b0;
        done_o   = 1'b0;
      end
      
      S3 : begin
        load_p_o = 1'b0;
        load_q_o = 1'b0;
        load_f_o = 1'b1; // Load Register F
        clr_f_o  = 1'b0;
        dec_q_o  = 1'b1; // Decrement Counter Q
        done_o   = 1'b0;
      end
      
      S4 : begin
        load_p_o = 1'b0;
        load_q_o = 1'b0;
        load_f_o = 1'b0;
        clr_f_o  = 1'b0;
        dec_q_o  = 1'b0;
        done_o   = 1'b1; // Multiplication is done
      end
      
      default : begin
        load_p_o = 1'b0;
        load_q_o = 1'b0;
        load_f_o = 1'b0;
        clr_f_o  = 1'b0;
        dec_q_o  = 1'b0;
        done_o   = 1'b0; 
      end
      
    endcase
  end
  
endmodule