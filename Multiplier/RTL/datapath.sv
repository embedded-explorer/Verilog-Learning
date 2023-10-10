//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : Datapath
// File        : datapath.sv
//----------------------------------------------------------------------------

module datapath(
  input          clk_i    , // Input Clock
  input          rst_i    , // Input Reset
  input   [3:0]  data_i   , // Input Data [3:0]
  output  [7:0]  data_o   , // Output Data [7:0]

  input          load_p_i , // Load Register P
  input          load_q_i , // Load Counter Q
  input          load_f_i , // Load Register F
  input          clr_f_i  , // Clear Register F
  input          dec_q_i  , // Decrement Counter Q
  output         zero_o     // Counter Q is Zero
);
  // Intermediate Signal Decleration
  logic  [3:0] count;
  logic  [7:0] a;
  logic  [7:0] b;
  logic  [7:0] s;
  
  // Assign output result, stored in register F
  assign data_o = b;
  
  // Counter Q
  counter counter_q(
    .clk_i    (clk_i    ), // Input Clock
    .rst_i    (rst_i    ), // Input Reset
    .enable_i (dec_q_i  ), // Input Enable
    .load_i   (load_q_i ), // Input Load
    .data_i   (data_i   ), // Input data [3:0]
    .count_o  (count    )  // Output Count [3:0]
  );
  
  // Register P
  register register_p(
    .clk_i   (clk_i         ), // Input Clock
    .rst_i   (rst_i         ), // Input Reset
    .clear_i (1'b0          ), // Input Clear
    .load_i  (load_p_i      ), // Input Load
    .data_i  ({4'h0, data_i}), // Input Data [7:0]
    .data_o  (a             )  // Output Data [7:0]
  );
  
  // Register F
  register register_f(
    .clk_i   (clk_i   ), // Input Clock
    .rst_i   (rst_i   ), // Input Reset
    .clear_i (clr_f_i ), // Input Clear
    .load_i  (load_f_i), // Input Load
    .data_i  (s       ), // Input Data [7:0]
    .data_o  (b       )  // Output Data [7:0]
  );
  
  // Comparator
  comparator comparator(
    .a_i    (count ), // Input A [3:0]
    .zero_o (zero_o)  // Output A == 0
  );

  // Adder
  adder adder(
    .a_i (a), // Input A [7:0]
    .b_i (b), // Input B [7:0]
    .s_o (s)  // Output Sum [7:0]
  );

endmodule