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
  child1 c1;
  initial begin
    c1=new();
    c1.a=3;
    c1.b=5;
    c1.display();
  end
endmodule
