//--------------------------------------------------------------------------------
// File         : factorial_function.v
// Dependencies : 
// Description  : Gotchas with using static/ noraml function
//--------------------------------------------------------------------------------

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