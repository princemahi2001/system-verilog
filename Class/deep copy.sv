// Code your testbench here
// or browse Examples
class class1;
  int c;
  int d;
  function new(int c,int d);
    this.c=c;
    this.d=d;
  endfunction
endclass
class class2;
  int a;
  int b;
  class1 obj1;
  function new();
    a=3;
    b=5;
    obj1=new(34,54);
  endfunction
  
  function void display();
    $display("a value is %0d and b is %0d",a,b);
    $display("c value is %0d and d is %0d",obj1.c,obj1.d);
  endfunction
  
  function deep_copy(class2 obj2);
    this.a=obj2.a;
    this.b=obj2.b;
    this.obj1.c=obj2.obj1.c;
    this.obj1.d=obj2.obj1.d;
  endfunction
endclass
module tb;
  class2 a1,a2;
  initial begin
    a1=new();
    a1.display();
    a2=new();
    a2.deep_copy(a1);
    a2.a=90;
    a2.b=98;
    a2.obj1.c=78;
    a2.obj1.d=77;
    a1.display();
    a2.display();
  end
endmodule


//output
a value is 3 and b is 5
c value is 34 and d is 54
a value is 3 and b is 5
c value is 34 and d is 54
a value is 90 and b is 98
c value is 78 and d is 77
