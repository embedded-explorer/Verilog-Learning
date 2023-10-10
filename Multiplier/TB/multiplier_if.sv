//----------------------------------------------------------------------------
// Title       : 4-Bit Multiplication using repeated addition
// Design      : Interface
// File        : multiplier_if.sv
//----------------------------------------------------------------------------

interface multiplier_if(
  input clk_i,
  input rst_i
);

  logic         start_i;
  logic  [3:0]  data_i ;
  logic  [7:0]  data_o ;
  logic         done_o ;
  
  // Modport for DUT
  modport dut_mp(
    input   clk_i  ,
    input   rst_i  ,
    input   start_i,
    input   data_i ,
    output  data_o ,
    output  done_o
  );
  
  // Modport for Testbench
  modport tb_mp(
    input   clk_i  ,
    input   rst_i  ,
    input   data_o ,
    input   done_o ,
    output  start_i,
    output  data_i 
    
  );
  
endinterface