class abc;
  int a;
  int b;
  function new(int a,int b);
    this.a=a;
    this.b=b;
  endfunction
  function void display();
    $display("a value is %0d and b is %0d",a,b);
  endfunction
endclass
module tb;
  initial begin
    abc a1,a2;
    a1=new(12,26);
    a1.display();
    a2=a1;
    a2.a=90;
    a2.b=98;
    a1.display();
    a2.display();
  end
endmodule

//output
a value is 12 and b is 26
a value is 90 and b is 98
a value is 90 and b is 98
