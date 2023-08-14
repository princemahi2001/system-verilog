class parent;
  int a;
  function void display1();
    $display("a value is %0d",a);
  endfunction
endclass

class child1 extends parent;
  int b;
  function void display2();
    $display("b value is %0d",b);
  endfunction
endclass

class child2 extends parent;
  int c;
  function void display3();
    $display("c value is %0d",c);
  endfunction
endclass

class childA extends child1;
  int d;
  function void display4();
    $display("d value is %0d",d);
  endfunction
endclass 
  
class childB extends childA;
  int e;
  function void display5();
    $display("e value is %0d",e);
  endfunction
endclass 
  
module tb;
  childB c1;
  initial begin
    c1=new();
    c1.a=3;
    c1.b=5;
    //c1.c=8;
    c1.d=97;
    c1.e=45;
    c1.display1();
    c1.display2();
    //c1.display3();
    c1.display4();
    c1.display5();
  end
endmodule
