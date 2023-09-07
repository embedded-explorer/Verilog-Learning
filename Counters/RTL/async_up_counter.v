//--------------------------------------------------------------------------------
// File         : async_up_counter.v
// Dependencies : 
// Description  : 4-Bit Asynchronous Up Counter
//--------------------------------------------------------------------------------

module async_up_counter(
  input        clk_i     , // Clock
  input        rst_i     , // Reset
  output [3:0] count_o     // Count Value
);
  
  wire [3:0] q_n;
  
  // DFF 0
  dff dff_1(
    .clk_i(clk_i     ), // Input Clock
    .rst_i(rst_i     ),
    .d_i  (q_n[0]    ),
    .q_o  (count_o[0]),
    .q_n_o(q_n[0]    )
  );

  // DFF 1
  dff dff_2(
    .clk_i(q_n[0]    ), // DFF 0 Output
    .rst_i(rst_i     ),
    .d_i  (q_n[1]    ),
    .q_o  (count_o[1]),
    .q_n_o(q_n[1]    )
  );

  // DFF 2
  dff dff_3(
    .clk_i(q_n[1]    ), // DFF 1 Output
    .rst_i(rst_i     ),
    .d_i  (q_n[2]    ),
    .q_o  (count_o[2]),
    .q_n_o(q_n[2]    )
  );

  // DFF 3
  dff dff_4(
    .clk_i(q_n[2]    ), // DFF 2 Output
    .rst_i(rst_i     ),
    .d_i  (q_n[3]    ),
    .q_o  (count_o[3]),
    .q_n_o(q_n[3]    )
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