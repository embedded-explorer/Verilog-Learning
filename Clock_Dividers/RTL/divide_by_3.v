//--------------------------------------------------------------------------------
// File         : divide_by_3.v
// Dependencies : 
// Description  : Clock Divide By 3 with 50% duty cycle
//--------------------------------------------------------------------------------

module divide_by_3(
  input  clk_i , // Input Clock
  input  rst_i , // Reset
  output clk_o   // Output Clock
);
  
  wire [2:0] d;
  wire [2:0] q;
  
  assign d[0] = ~(q[0] | q[1]);
  assign d[1] = q[0];
  assign d[2] = q[1];
  
  assign clk_o = q[1] | q[2];
  
  // Positive Edge Triggered DFF 0
  dff #(
    .EDGE ("posedge")
  )dff_0(
    .clk_i(clk_i ),
    .rst_i(rst_i ),
    .d_i  (d[0]  ),
    .q_o  (q[0]  )
  );
  
  // Positive Edge Triggered DFF 1
  dff #(
    .EDGE ("posedge")
  )dff_1(
    .clk_i(clk_i ),
    .rst_i(rst_i ),
    .d_i  (d[1]  ),
    .q_o  (q[1]  )
  );
  
  // Negative Edge Triggered DFF 2
  dff #(
    .EDGE ("negedge")
  )dff_2(
    .clk_i(clk_i ),
    .rst_i(rst_i ),
    .d_i  (d[2]  ),
    .q_o  (q[2]  )
  );

endmodule

// DFF
module dff#(
  parameter EDGE = "posedge" // posedge, negedge
)(
  input      clk_i,
  input      rst_i,
  input      d_i  ,
  output reg q_o  
);

  generate
    if(EDGE == "posedge")begin
      always@(posedge clk_i)begin
	    if(rst_i)begin
          q_o <= 1'b0;
        end else begin
          q_o <= d_i;
        end
	  end
	end else begin
	  always@(negedge clk_i)begin
	    if(rst_i)begin
          q_o <= 1'b0;
        end else begin
          q_o <= d_i;
        end
	  end
	end
  endgenerate

endmodule