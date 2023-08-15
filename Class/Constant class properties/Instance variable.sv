class parent;
  const int a;
  int b;
  function new();
    a=7;  //it should be assigned only once at run time
    b=2;
  endfunction
  function void display();
    $display("a value is %0d and b is %0d",a,b);
  endfunction
endclass
  
module tb;
  parent p1;
  initial begin
    p1=new();
    //p1.a=87;  //it will error it is a constant instance variable
    p1.display();
  end
endmodule
