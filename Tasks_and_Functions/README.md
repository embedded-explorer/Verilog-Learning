# Tasks and Functions

## Table of Contents

- [Functions](#Functions)
  * [Constant Functions](#Constant-Functions)
  * [Automatic/ Reentrant/ Recursive Function](#Automatic/-Reentrant/-Recursive-Function)
- [Tasks](#Tasks)
  * [Automatic/ Reentrant/ Recursive Tasks](Automatic/-Reentrant/-Recursive-Tasks)

## Functions
Function must have at least one input argument  
Functions return a single value by its name, they cannot have output or inout arguments  
Functions must not include delay or timing control statements and execute in 0 simulation time  
Functions can enable other functions but not other tasks  
Usage of non-blocking assignment inside function is illegal and are used to model combinational logic  
```
module function_example();
    
  // Function to find maximum number
  function integer max(
    input integer a_i,
    input integer b_i
  );
    begin
      if (a_i >= b_i) begin
        max = a_i;
      end else begin
        max = b_i;
      end
    end
  endfunction

  // Call max function
  initial begin
    $display("max(%1d, %1d) = %1d", 5, 8, max(5, 8));
  end

endmodule
```
```
max(5, 8) = 8
```
### Constant Functions
Used to refer complex values instead of directly defining them as constant.
The constant value is generated at elaboration by the constant function.
In the below example constant function is used instead of constant value for address width, 
address width is calculated using the depth of the memory.
```
module clog2_function();
    
  // Function to calculate Log Base 2
  function [31:0] clog2(
    input  [31:0] value
  );
    integer temp;
    begin
      temp = value - 1;
      // Increment number of bits required by 1 until value becomes 0
      for (clog2 = 0; temp > 0; clog2 = clog2 + 1) begin
        temp = temp >> 1; // Divide value by 2
      end
    end
  endfunction
  
  initial begin
    $display($time, "ns: Value = 1024, Bits = %d", clog2(1024));
	$display($time, "ns: Value = 32, Bits = %d", clog2(32));
  end
    
endmodule
```
```
                   0ns: Value = 1024, Bits =         10
                   0ns: Value = 32, Bits =          5
```

### Automatic/ Reentrant/ Recursive Function
Normally functions are static in nature, i.e. if the function is called simultaneously 
at two places, then it operates on same set of global variables hence result of such operation 
might be incorrect.  
Consider below example which produces unexpected results  
```
module factorial_function();
    
  integer result;
  integer i;
    
  // Recursive factorial function
  function integer fact(
    input integer num
  );
    if (num >= 2)
      fact = fact(num - 1) * num;
    else
      fact = 1;
  endfunction

  // Call factorial function multiple times passing same variable
  initial begin
    for(i=0; i<7; i=i+1)begin
      $display("Factorial of %d = %d", i, fact(i));
    end
  end
    
endmodule
```
```
Factorial of           0 =           1
Factorial of           1 =           1
Factorial of           2 =           1
Factorial of           3 =           1
Factorial of           4 =           1
Factorial of           5 =           1
Factorial of           6 =           1
```

Keyword automatic can be used to make function reentrant, therefore variables declared inside
function will be allocated memory dynamically and each function call will have seperate set of local variable copy.  
```
module auo_factorial_function();
    
  integer result;
  integer i;
    
  // Recursive factorial function using automatic keyword
  function automatic integer fact(
    input integer num
  );
    if (num >= 2)
      fact = fact(num - 1) * num;
    else
      fact = 1;
  endfunction

  // Call factorial function multiple times passing same variable
  initial begin
    for(i=0; i<7; i=i+1)begin
      $display("Factorial of %d = %d", i, fact(i));
    end
  end
    
endmodule
```
```
Factorial of           0 =           1
Factorial of           1 =           1
Factorial of           2 =           2
Factorial of           3 =           6
Factorial of           4 =          24
Factorial of           5 =         120
Factorial of           6 =         720
```

## Tasks
Tasks may have zero or more arguments of type input, output or inout  
Tasks do not return a value but can pass multiple values through output and inout arguments  
Tasks can include delay or timing control statements  
Tasks can enable other tasks as well as functions  
Non-blocking assignment is allowed  

### Automatic/ Reentrant/ Recursive Tasks
Similar to normal/static functions tasks are also static in nature and have same limitations
```
module display_task();
    
  // Task for displaying
  task disp(
    input integer a,
    input integer b
  );
    begin
      #(a) $display($time, "ns : a = %d, b = %d", a, b);
    end
  endtask
  
  // Call the task multiple times  
  initial
  #10 disp(1, 2);
  
  initial
  #10 disp(1, 4);
  
  initial
  #10 disp(2, 3);
    
endmodule
```
```
                  11ns : a =           2, b =           3
                  11ns : a =           2, b =           3
                  12ns : a =           2, b =           3
```

Automatic tasks help in overcoming the limitations of static tasks
```
module auo_display_task();
    
  // Task for displaying
  task automatic disp(
    input integer a,
    input integer b
  );
    begin
      #(a) $display($time, "ns : a = %d, b = %d", a, b);
    end
  endtask
  
  // Call the task multiple times  
  initial
  #10 disp(1, 2);
  
  initial
  #10 disp(1, 4);
  
  initial
  #10 disp(2, 3);
    
endmodule
```
```
                  11ns : a =           1, b =           2
                  11ns : a =           1, b =           4
                  12ns : a =           2, b =           3
```