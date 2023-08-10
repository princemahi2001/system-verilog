//task arguments in declarations and mentioning directions
module tb;
  int sum;
  task summation;
    input int a,b;
    output int sum;
    sum=a+b;
  endtask
  initial begin
    summation(2,3,sum);
    $display("sum of 2 numbers is %0d",sum);
  end
endmodule


//task arguments in parentheses
module tb;
  int x;
  task summation(input int a,b,output int sum);
    sum=a+b;
  endtask
  initial begin
    summation(2,3,x);
    $display("sum of 2 numbers is %0d",x);
  end
endmodule


//Pass by value
module tb;
  int x;
  task summation(input int a,b,output int sum);
    a=a+b;
    sum=a+b;
  endtask
  initial begin
    summation(2,3,x);
    $display("sum of 2 numbers is %0d",x);
  end
endmodule
