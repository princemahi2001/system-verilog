class parent;
  const int a=9;
  int b;
  function new();
    b=2;
  endfunction
  function void display();
    $display("a value is %0d and b is %0d",a,b);
  endfunction
endclass
  
module tb;
  parent p1;
  initial begin
    p1=new();
    //p1.a=87;  it will error it is a constant global variable
    p1.display();
  end
endmodule
