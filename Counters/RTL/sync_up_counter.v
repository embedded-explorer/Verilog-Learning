//--------------------------------------------------------------------------------
// File         : sync_up_counter.v
// Dependencies : 
// Description  : 4-Bit Synchronous Up Counter
//--------------------------------------------------------------------------------

module sync_up_counter(
  input        clk_i     , // Clock
  input        rst_i     , // Reset
  output [3:0] count_o     // Count Value
);
  
  wire [3:0] d;
  wire [3:0] q;
  wire [3:0] q_n;
  
  assign d[0] = q_n[0];
  assign d[1] = (q_n[1] & q[0]) | (q[1] & q_n[0]);
  assign d[2] = (q[2] & q_n[1]) | (q[2] & q_n[0]) | (q_n[2] & q[1] & q[0]);
  assign d[3] = (q[3] & q_n[1]) | (q[3] & q_n[2]) | (q[3] & q[1] & q_n[0]) | 
                (q_n[3] & q[2] & q[1] & q[0]);
  
  assign count_o = q;
  
  // DFF 0
  dff dff_1(
    .clk_i(clk_i  ), // Input Clock
    .rst_i(rst_i  ),
    .d_i  (d[0]   ),
    .q_o  (q[0]   ),
    .q_n_o(q_n[0] )
  );

  // DFF 1
  dff dff_2(
    .clk_i(clk_i  ),
    .rst_i(rst_i  ),
    .d_i  (d[1]   ),
    .q_o  (q[1]   ),
    .q_n_o(q_n[1] )
  );

  // DFF 2
  dff dff_3(
    .clk_i(clk_i  ),
    .rst_i(rst_i  ),
    .d_i  (d[2]   ),
    .q_o  (q[2]   ),
    .q_n_o(q_n[2] )
  );

  // DFF 3
  dff dff_4(
    .clk_i(clk_i  ),
    .rst_i(rst_i  ),
    .d_i  (d[3]   ),
    .q_o  (q[3]   ),
    .q_n_o(q_n[3] )
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