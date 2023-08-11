class abc;
  int a;
  function new();
    a=3;
  endfunction
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass 
module tb;
  initial begin
  abc a=new();
    a.display();
  end
endmodule



//parameterized constructors
class abc;
  int a;
  function new(int a);
    this.a=a;
  endfunction
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass 
module tb;
  initial begin
    abc a=new(3);
    a.display();
  end
endmodule
