//--------------------------------------------------------------------------------
// File         : mux_4_to_1.v
// Dependencies : 
// Description  : 4 to 1 multiplexer
//--------------------------------------------------------------------------------

module mux_4_to_1(
  input  [3:0] i_i, // Input Lines
  input  [1:0] s_i, // Select Lines
  output       y_o  // Output
);
  
  // Combinational Logic
  assign y_o = (s_i[1] ? (s_i[0] ? i_i[3] : i_i[2]) : 
                         (s_i[0] ? i_i[1] : i_i[0]));
  
endmodule
