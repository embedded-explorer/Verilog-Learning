//--------------------------------------------------------------------------------
// File         : rca.sv
// Dependencies : full_adder.sv
// Description  : Ripple Carry Adder
//--------------------------------------------------------------------------------

module rca#(
  parameter N = 4      // Number of Bits
)(
  input   [N-1:0]  a_i, // Input A
  input   [N-1:0]  b_i, // Input B
  input            c_i, // Input Carry
  output  [N-1:0]  s_o, // Output Sum
  output           c_o  // Output Carry
);

  wire  [N:0]  c; // Intermediate carry
  
  assign c[0] = c_i; // Assign carry input
  assign c_o  = c[N]; // Assign carry output
  
  // Instantiate full adders to generate ripple carry adder
  genvar i;
  generate
    for(i=0; i<N; i=i+1)begin
      full_adder fa(a_i[i], b_i[i], c[i], s_o[i], c[i+1]);
    end
  endgenerate

endmodule
