/****************************************************************************
Description: Bidirectional Buffer test bench
*****************************************************************************/

module bidir_buffer_tb(	);

	wire 			io, port;
	reg 			ctrl;
	reg 	[1:0]	temp;
	integer			i;
	
	bidir_buffer dut(
	.ctrl	(ctrl	),
	.io		(io		),
	.port	(port	)
	);
	
	initial
		{temp, ctrl} = 0;
		
	initial
	begin
		for(i=0;i<8;i=i+1)
		begin
			{ctrl, temp} = i;
			#10;
		end
	end
	
	assign io 	= ctrl  ? temp[0] : 1'bz;
	assign port = ~ctrl ? temp[1] : 1'bz;
		
	initial
		#100 $finish;
endmodule