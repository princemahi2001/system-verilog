class parent;
  int a;
  virtual function void display();
    $display("a value is %0d",a);
  endfunction
endclass

class child1 extends parent;
  int a;
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass

module tb;
  child1 c1;
  parent p1;
  initial begin
    c1=new();
    p1=c1;
    p1.a=3;
    c1.a=5;
    p1.display();
  end
endmodule
