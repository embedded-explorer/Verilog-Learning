# System Tasks

## Table of Contents

- [System Tasks used for displaying](#System-Tasks-used-for-displaying)
- [System Tasks to get simulation time](#System-Tasks-to-get-simulation-time)
- [System Tasks for simulation control](#System-Tasks-for-simulation-control)
- [System Task for random number generation](#System-Task-for-random-number-generation)
- [System Tasks for file handling](#System-Tasks-for-file-handling)
- [System Tasks for command line input](#System-Tasks-for-command-line-input)


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
	$strobe($time, ": $strode : Data = %h", data);
	// Runs at beginning of current simulation time unit
	$display($time, ": $display : Data = %h", data);
	// When does $monitor Run
	$monitor($time, ": $monitor : Data = %h", data);
	// When does $write Run
	$monitor($time, ": $write : Data = %h", data);
	
	data = 16'h73;
  end

endmodule
```
```
                   0: $display : Data = 0025
                   0: $strode : Data = 0073
                   0: $monitor : Data = 0073
                   0: $write : Data = 0073
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

## System Tasks to get simulation time

$time returns the current simulation time as a 64-bit unsigned integer  
$stime returns the lower 32-bits of the current simulationt time as an unsigned integer  
$realtime returns the current simulation time as a real number  
```
`timescale 1ns/1ps

module simulation_time();
  
  initial begin
	#1.55;
	// %g is used to display real
	$display("$realtime : %0g", $realtime);
	// %t converts to simulation time unit
	$display("$realtime : %0t", $realtime);
	
	$display("$time : %0g", $time);
	$display("$time : %0t", $time);
	
	$display("$time : %0t", $stime);
	
  end

endmodule
```
```
$realtime : 1.55
$realtime : 1550
$time : 2
$time : 2000
$time : 2000
```

## System Tasks for simulation control

$finish terminates the simulation  
Optional Diagnostics parameter can be passed  
0 - Prints nothing  
1 - Prints simulation time and location  
2 - Prints simulation time, location statistics of CPU and memory usage

```
module simulation_control();
  
  initial begin
	#10;
	$finish(2); // Diagnostics parameter 2
  end

endmodule
```
```
$finish called at time : 10 ns : File "F:/System_Tasks/simulation_control.v" Line 11
Memory in use : 6880 KB (peak memory: 6880 KB)     CPU usage : 0 ms
```
$stop suspends the simulation  

## System Task for random number generation

$random returns 32-bit unsigned random number  
```
module random();
  
  reg [31:0] data;
  
  initial begin
    // Generates signed 32-bit random number
    data = $random;
	$display("Number: %d", data);
	// Generates signed number between -9 to 9
	$display("Number: %d", $random%10);
	// Generates positive number from 0 to 9
	$display("Number: %d", {$random}%10);
	// Seed value makes sure same random number is returned in any machine
	$display("Number: %d", {$random(6)}%10);
  end

endmodule
```
```
Number:  303379748
Number:          -9
Number:          7
Number:          8
```

## System Tasks for file handling

$fopen is used for opening the file, it returns 32-bit channel descriptor  
channel descriptor has only one bit set, value 32'h0000_0001 for standard output  
```
module file_handling();

  integer fp_1, fp_2;
  integer comb;
  integer a;
  
  initial begin
    a = 0;
    fp_1 = $fopen("file_1.txt");
	fp_2 = $fopen("file_2.txt");
	comb = fp_1 | fp_2;
	// Display channel discreptors
	$display("fp_1 = %08h, fp_2 = %08h", fp_1, fp_2);
	
	$fdisplay(fp_1, "-------- File 1 --------");
	$fdisplay(fp_2, "-------- File 2 --------");
	
	repeat(4)
	  #2 a = a + 2;
	
	$fclose(fp_1);
	$fclose(fp_2);
  end
  
  // Write to both files
  initial
    $fmonitor(comb, $stime, ": a = %d", a);

endmodule
```
```
fp_1 = 00000002, fp_2 = 00000004
```

$readmemb and $readmemh system tasks can be used to initializa memories  
start address needs to be specified using @ operator  
```
module file_handling();
  
  reg [7:0] mem8x8 [7:0]; // Declare 8x8 memory
  integer fptr, i;
  
  initial begin
    $readmemb("init8x8.txt", mem8x8); // Initialize memory
	
	// Display memory contents
	for(i=0; i<8; i=i+1)
	  $display("Mem[%0d] = %b", i, mem8x8[i]);

  end
  
endmodule
```
```
Mem[0] = xxxxxxxx
Mem[1] = xxxxxxxx
Mem[2] = 11111111
Mem[3] = 01010101
Mem[4] = 00000000
Mem[5] = xxxxxxxx
Mem[6] = xxxxzzzz
Mem[7] = 1x1x1x1x
```

## System Tasks for command line input

$test$plusargs is used to pass string as command line argument  
```
module command_line();
  
  initial begin
    if($test$plusargs("CASE_1"))
	  $display("Run by selectig case 1");
	if($test$plusargs("CASE_2"))
	  $display("Run by selectig case 2");
  end

endmodule
```
compile the code using iverilog  
```
iverilog command_line.v
```
Run by providing CASE_1 as argument  
```
./a.out +CASE_1
```
```
Run by selectig case 1
```
Run by providing CASE_2 as argument  
```
./a.out +CASE_2
```
```
Run by selectig case 2
```