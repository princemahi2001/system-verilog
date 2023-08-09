module tb;
  int a1[*],i,index;
  initial begin
    repeat(5) 
      begin
        a1[i]=i*i;
        i=i+1;
      end
    
    //exists method
    if(a1.exists(3)) 
      $display("element is exists at 3 and value is %0d",a1[3]);
    else
      $display("element is not exists at 3");

    
    //first(var)
    a1.first(index);
    $display("first index is %0d and value is %0d",index,a1[index]);
    
    //last(var)
    a1.last(index);
    $display("last index is %0d and value is %0d",index,a1[index]);
    
    //prev(index);
    a1.prev(index);
    $display("previous index is %0d and value is %0d",index,a1[index]);
    
    //next(index)
    a1.next(index);
    $display("next index is %0d and value is %0d",index,a1[index]);
   end
endmodule
               
