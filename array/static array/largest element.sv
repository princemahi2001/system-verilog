module tb;
  int a[5]={1,5,3,4,2};
  initial begin
    int big=0,index=0;
  foreach(a[i]) 
    begin
      if(a[i]>big)
        begin big=a[i]; index=i; end
    end
    $display("biggest element in array is %0d at index %0d",big,index);
  end
endmodule
