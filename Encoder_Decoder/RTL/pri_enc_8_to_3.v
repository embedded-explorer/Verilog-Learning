//--------------------------------------------------------------------------------
// File         : pri_enc_8_to_3.v
// Dependencies : 
// Description  : 8 Input priority encoder
//--------------------------------------------------------------------------------

module pri_enc_8_to_3(
  input      [7:0] i_i , // Input
  input            en_i,
  output reg [2:0] y_o   // Output
);
  
  always@(*)begin
    if(en_i)begin
	  if(i_i[7])begin
	    y_o = 3'b111;
	  end else if(i_i[6])begin
	    y_o = 3'b110;
	  end else if(i_i[5])begin
	    y_o = 3'b101;
	  end else if(i_i[4])begin
	    y_o = 3'b100;
	  end else if(i_i[3])begin
	    y_o = 3'b011;
	  end else if(i_i[2])begin
	    y_o = 3'b010;
	  end else if(i_i[1])begin
	    y_o = 3'b001;
	  end else if(i_i[0])begin
	    y_o = 3'b000;
	  end else begin
	    y_o = 3'bzzz;
	  end
	end else begin
	  y_o = 3'bzzz;
	end
  end
  
endmodule