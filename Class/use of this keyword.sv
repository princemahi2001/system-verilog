// Code your testbench here
// or browse Examples
class abc;
  int a;
  task set(int a);
    this.a=a;
  endtask
  function int get();
    return a;
  endfunction
endclass 
module tb;
  initial begin
  abc a=new();
  a.set(10);
  $display("a value is %0d",a.get());
  end
endmodule
