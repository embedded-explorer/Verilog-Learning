//--------------------------------------------------------------------------------
// File         : decoder_4_to_16.v
// Dependencies : 
// Description  : 4 to 16 Line Decoder
//--------------------------------------------------------------------------------

module decoder_4_to_16(
  input      [ 3:0] i_i , // Input
  input             en_i, // Enable
  output reg [15:0] y_o   // Output
);
  
  // Combinational Logic
  always@(*)begin
    if(en_i)begin
      case(i_i)
        4'h0    : y_o = 16'h0001;
        4'h1    : y_o = 16'h0002;
        4'h2    : y_o = 16'h0004;
        4'h3    : y_o = 16'h0008;
        4'h4    : y_o = 16'h0010;
        4'h5    : y_o = 16'h0020;
        4'h6    : y_o = 16'h0040;
        4'h7    : y_o = 16'h0080;
        4'h8    : y_o = 16'h0100;
        4'h9    : y_o = 16'h0200;
        4'hA    : y_o = 16'h0400;
        4'hB    : y_o = 16'h0800;
        4'hC    : y_o = 16'h1000;
        4'hD    : y_o = 16'h2000;
        4'hE    : y_o = 16'h4000;
        4'hF    : y_o = 16'h8000;
        default : y_o = 16'h0000;       
      endcase
    end else begin
      y_o = 16'h0000;
    end
  end
  
endmodule
