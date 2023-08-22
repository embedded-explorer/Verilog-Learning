# System Tasks
## System Tasks used for displaying

$display is used to display data once, it and adds a newline character  
$write is used to display data once, it doesnot add newline character  
```
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'b0101;
	
	// %m is used to display hierarchial scope of module
	$display("Data in %m");
	// Format specifiers can be either small or caps
	$display("Hex: %h, Dec: %d, Bin: %b, Oct: %o", data, data, data, data);
	
	$write("I am $write %t", $time);
	$write($time, " I still continue on same line");
  end

endmodule
```
```
Data in 'displaying'
Hex: 0005, Dec:     5, Bin: 0000000000000101, Oct: 000005
I am $write                    0                   0 I still continue on same line
```

$strobe displays simulation data once at the end of current simulation time
```
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'h25;
	
	// Runs at end of current simulation time unit
	$strobe("$strode : Data = %h", data);
	// Runs at beginning of current simulation time unit
	$display("$display : Data = %h", data);
	
	data = 16'h73;
  end

endmodule
```
```
$display : Data = 0025
$strode : Data = 0073
```
$monitor displays data whenever it changes  
$monitoroff can be used to disable monitoring for fast simulation  
$monitoron can be used to enable monitoring  
          
```
module displaying();

  reg [15:0] data;
  
  initial begin
    data = 16'h0;
    repeat(20) begin
	  data = data + 1;
	  #5;
	end
  end
  
  initial begin
    $monitor($time, ": Data: %d", data);
    #20 $monitoroff;
    #70 $monitoron;
  end

endmodule
```
```
                   0: Data:     1
                   5: Data:     2
                  10: Data:     3
                  15: Data:     4
                  90: Data:    19
                  95: Data:    20
```

** Note:  
Only one $monitor display list can be active at any one time  
If multiple $monitor is used one in last will be active
