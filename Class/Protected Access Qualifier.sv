class parent;
  int a;
  protected int b;
  function new();
    a=3;
    b=2;
  endfunction
  function void display();
    $display("a value is %0d and b is %0d",a,b);
  endfunction
endclass

class child extends parent;
  int c;
  function new(int c);
    this.c=c;
  endfunction
  function void display();
    $display("a=%0d b=%0d c=%0d",a,b,c);
  endfunction
endclass
  
module tb;
  parent p1;
  child c1;
  initial begin
    c1=new(4);
    p1=new();
    //p1.b=45; it will show error because it is a protected variable we will access only in child class
    c1.display();
  end
endmodule
