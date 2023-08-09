module tb;
  int a[5]={1,5,3,4,2};
  initial begin
    int sum=0,index=0;
  foreach(a[i]) 
    begin
      sum+=a[i];
    end
    $display("sum is [%0d]",sum);
  end
endmodule
