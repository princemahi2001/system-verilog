//Pass by reference
module tb;
  int x,a,b;
  function int summation(ref int a,b);
    a=a+b;
    return a+b;
  endfunction
  initial begin
    a=2;
    b=3;
    x=summation(a,b);
    $display("a value is %0d",a);
    $display("b value is %0d",b);
    $display("sum of 2 numbers is %0d",x);
  end
endmodule

output:
a value is 5
b value is 3
sum of 2 numbers is 8


//Pass by value
module tb;
  int x,a,b;
  function int summation(int a,b);
    a=a+b;
    return a+b;
  endfunction
  initial begin
    a=2;
    b=3;
    x=summation(a,b);
    $display("a value is %0d",a);
    $display("b value is %0d",b);
    $display("sum of 2 numbers is %0d",x);
  end
endmodule


output:
a value is 2
b value is 3
sum of 2 numbers is 8


//Pass by arguments by default
module tb;
  int x,a,b,c;
  function int summation(int a=3,b=6,c);
    a=a+b;
    return a+b+c;
  endfunction
  initial begin
    c=2;
    x=summation(,,c);
    $display("sum of 3 numbers is %0d",x);
  end
endmodule

output:
sum of 3 numbers is 17


//Pass by names
module tb;
  int x,a,b,sum;
  function void summation(int a=3,b=6,string sum);
    sum=a+b;
    $display("sum of 2 numbers is %0d",sum);
  endfunction
  initial begin
    summation(,,sum);
  end
endmodule

output:
sum of 2 numbers is 9

