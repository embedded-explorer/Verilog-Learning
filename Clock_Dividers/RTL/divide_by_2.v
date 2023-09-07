//--------------------------------------------------------------------------------
// File         : divide_by_2.v
// Dependencies : 
// Description  : Clock Divide by 2
//--------------------------------------------------------------------------------

module divide_by_2(
  input  clk_i , // Input Clock
  input  rst_i , // Reset
  output clk_o   // Output Clock
);
  
  wire q_n;
  
  // DFF 0
  dff dff_1(
    .clk_i(clk_i  ),
    .rst_i(rst_i  ),
    .d_i  (q_n    ),
    .q_o  (clk_o  ),
    .q_n_o(q_n    )
  );

endmodule

// DFF
module dff(
  input      clk_i,
  input      rst_i,
  input      d_i  ,
  output reg q_o  ,
  output     q_n_o
);
  
  assign q_n_o = ~q_o;

  always@(posedge clk_i)begin
    if(rst_i)begin
      q_o <= 1'b0;
    end else begin
      q_o <= d_i;
    end
  end

endmodule