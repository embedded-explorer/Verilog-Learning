//--------------------------------------------------------------------------------
// File         : logic_eqn_behavioural.v
// Dependencies : 
// Description  : Model below logic equations using behavioural abstraction
//                1. F = S(1, 2, 5, 7)
//                2. F1 = XZ + YZ'
//                   F2 = XY' + YZ'
//--------------------------------------------------------------------------------

/*
// 1. F = S(1, 2, 5, 7)
module logic_eqn_behavioural(
  input       a_i, // Input A
  input       b_i, // Input B
  input       c_i, // Input C
  output reg  f_o  // Output F
);
  
  // Combinational Logic
  always@(*)begin
    case({a_i, b_i, c_i})
	  3'b001,
	  3'b010,
	  3'b101,
	  3'b111 : f_o = 1'b1;
	  default: f_o = 1'b0;
	endcase
  end

endmodule
*/


// 2. F1 = XZ + YZ'
//    F2 = XY' + YZ'
module logic_eqn_behavioural(
  input       x_i , // Input X
  input       y_i , // Input Y
  input       z_i , // Input Z
  output reg  f1_o, // Output F1
  output reg  f2_o  // Output F2
);
  
  // Combinational logic
  always@(*)begin
    case({x_i, y_i, z_i})
	  3'b010,
	  3'b101,
	  3'b110 : begin
	    f1_o = 1'b1;
		f2_o = 1'b1;
	  end
	  3'b100 : begin
	    f1_o = 1'b0;
		f2_o = 1'b1;
	  end
	  3'b111 : begin
	    f1_o = 1'b1;
		f2_o = 1'b0;
	  end
	  default: begin
	    f1_o = 1'b0;
		f2_o = 1'b0;
	  end
	endcase
  end

endmodule
