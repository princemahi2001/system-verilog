class parent;
  int a;
  local int b;
  function new();
    a=3;
    b=2;
    display();
  endfunction
  local function void display();
    $display("a value is %0d and b is %0d",a,b);
  endfunction
endclass

module tb;
  parent p1;
  initial begin
    p1=new();
    //p1.b=56;   it will show error because it is a local variable
    //p1.display();  //same error
  end
endmodule
