# System Tasks
## System Tasks used for displaying

$display is used to display data once, it and adds a newline character  
$write is used to display data once, it doesnot add newline character  
,,,
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 15'b0101;
	
	// %m is used to display hierarchial scope of module
	$display("Data in %m");
	// Format specifiers can be either small or caps
	$display("Hex: %h, Dec: %d, Bin: %b, Oct: %o", data, data, data, data);
	
	$write("I am $write %t", $time);
	$write($time, " I still continue on same line");
  end

endmodule
,,,
,,,
Data in 'displaying'
Hex: 0005, Dec:     5, Bin: 0000000000000101, Oct: 000005
I am $write                    0                   0 I still continue on same line
,,,

$strobe displays simulation data once at the end of current simulation time

$monitor displays data whenever it changes
$monitoroff can be used to disable monitoring for fast simulation
$monitoron can be used to enable monitoring
  
This repo documents the learning of verilog HDL from various resources
