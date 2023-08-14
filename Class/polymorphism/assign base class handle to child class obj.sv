class parent;
  int a;
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass

class child1 extends parent;
  int b;
  function void display();
    $display("b value is %0d",b);
  endfunction
endclass

module tb;
  parent p1;
  child1 c1;
  initial begin
    c1=new();
    p1=c1;
    $cast(c1,p1);
    
    p1.a=5;
    c1.b=97;
    
    c1.display();
    
  end
endmodule
