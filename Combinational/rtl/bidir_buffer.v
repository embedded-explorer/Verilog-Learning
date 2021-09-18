/****************************************************************************
Description: Bidirectional Buffer
*****************************************************************************/

module bidir_buffer(
	input 	ctrl,
	inout	io, port
);

	bufif1(port, io, ctrl);
	bufif0(io, port, ctrl);
	
endmodule