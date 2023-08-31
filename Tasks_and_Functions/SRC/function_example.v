//--------------------------------------------------------------------------------
// File         : function_example.v
// Dependencies : 
// Description  : Demonstartion of function
//--------------------------------------------------------------------------------

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