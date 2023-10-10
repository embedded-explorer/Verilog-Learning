//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : Top Level Module
// File        : multiplier.sv
//----------------------------------------------------------------------------
`include "adder.sv"
`include "comparator.sv"
`include "controlpath.sv"
`include "counter.sv"
`include "datapath.sv"
`include "register.sv"

module multiplier(multiplier_if.dut_mp intf);

  // Internal Signal Decleration
  logic  load_p;
  logic  load_q;
  logic  load_f;
  logic  clr_f ;
  logic  dec_q ;
  logic  zero  ;

  // Datapath
  datapath datapath(
    .clk_i    (intf.clk_i   ), // Input Clock
    .rst_i    (intf.rst_i   ), // Input Reset
    .data_i   (intf.data_i  ), // Input Data [3:0]
    .data_o   (intf.data_o  ), // Output Data [7:0]
    .load_p_i (load_p       ), // Load Register P
    .load_q_i (load_q       ), // Load Counter Q
    .load_f_i (load_f       ), // Load Register F
    .clr_f_i  (clr_f        ), // Clear Register F
    .dec_q_i  (dec_q        ), // Decrement Counter Q
    .zero_o   (zero         )  // Counter Q is Zero
  );
  
  // Controlpath
  controlpath controlpath(
    .clk_i    (intf.clk_i   ), // Input Clock
    .rst_i    (intf.rst_i   ), // Input Reset
    .start_i  (intf.start_i ), // Start Multiplication
    .done_o   (intf.done_o  ), // Multiplication Done
    .zero_i   (zero         ), // Counter Q is Zero
    .load_p_o (load_p       ), // Load Register P
    .load_q_o (load_q       ), // Load Counter Q
    .load_f_o (load_f       ), // Load Register F
    .clr_f_o  (clr_f        ), // Clear Register F
    .dec_q_o  (dec_q        )  // Decrement Counter Q
  );

endmodule