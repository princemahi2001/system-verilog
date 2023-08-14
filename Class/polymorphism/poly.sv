class parent;
  int a;
  virtual function void display();
    $display("a value is %0d",a);
  endfunction
endclass

class child1 extends parent;
  int b;
  function void display();
    $display("b value is %0d",b);
  endfunction
endclass

class child2 extends parent;
  int c;
  function void display();
    $display("c value is %0d",c);
  endfunction
endclass

class child3 extends parent;
  int d;
  function void display();
    $display("d value is %0d",d);
  endfunction
endclass 

module tb;
  parent p,p1,p2,p3;
  child1 c1;
  child2 c2;
  child3 c3;
  initial begin
    c1=new();
    c2=new();
    c3=new();
    
    c1.b=5;
    c2.c=97;
    c3.d=45;
    
    p1=c1;
    p2=c2;
    p3=c3;
    
    p1.display();
    p2.display();
    p3.display();
  end
endmodule
