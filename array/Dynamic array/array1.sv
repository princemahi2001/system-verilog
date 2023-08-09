module tb;
  int a[],i;
  initial begin
    a=new[5];
    foreach(a[i]) a[i]=i*i;
    
    //size of the array
    $display("size of the array is %0d",a.size());
    
    a=new[10](a);
    foreach(a[i]) a[i]=i*i;
    
    //size of the array
    $display("size of the array is %0d",a.size());
    
    foreach(a[i]) $display("a[%0d]=%0d",i,a[i]); 
    
    a.delete();  //delete of the complete array
    //size of the array
    $display("size of the array is %0d",a.size());
  end
endmodule
    
