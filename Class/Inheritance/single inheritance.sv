class parent;
  int a;
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass
class child extends parent;
  int b;
  function void display();
    $display("b value is %0d",b);
  endfunction
endclass
module tb;
  child c1;
  parent p1;
  initial begin
    c1=new();
    c1.a=3;
    c1.b=5;
    c1.display();
    p1.display();
  end
endmodule
