typedef class child;

class parent;
  const int a;
  int b;
  child c1=new();
  function new();
    a=7;
    b=2;
  endfunction
  function void display();
    $display("a value is %0d and b is %0d and c is %0d",a,b,c1.c);
  endfunction
endclass
 
class child;
  int c;
  function new();
    c=45;
  endfunction
endclass

module tb;
  parent p1;
  initial begin
    p1=new();
 
    p1.display();
  end
endmodule
