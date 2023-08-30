/****************************************************************************
Description: Usage of Constant Function
****************************************************************************/

module const_function(addr, data, we, cs);

	parameter D_WIDTH = 8;
	parameter DEPTH = 256;
	localparam A_WIDTH = logb2(DEPTH);
	
	input [A_WIDTH-1:0] addr;
	inout [D_WIDTH-1:0] data;
	input we, cs;
	
	reg [D_WIDTH-1:0] temp;

	function integer logb2;
		input depth;
		integer i,result;
	begin
		for (i = 0; 2 ** i < DEPTH; i=i+1)
			result = i + 1;
		logb2 = result;
	end
	endfunction
	
	reg[D_WIDTH-1:0] mem [0:DEPTH];
	
	always@(*)
	begin
		if(we && cs)
			mem[addr] = data;	
	end
	
	assign data = (!we && cs) ? mem[addr] : 'hzz;
	
endmodule