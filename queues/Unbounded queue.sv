module tb;
  int qu[$];    //UnBounded queue declaration
  int x;
  initial begin
    
    //initialization
    qu[0]=2;
    qu[1]=3;
    qu[2]=4;
    
    //size of the queue
    $display("size of the queue is %0d",qu.size());
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //push_back()
    qu.push_back(6);   
    
    //
    $display("after push_back the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //push_front()
    qu.push_front(16);   
    
    //
    $display("after push_front the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //insert()
    qu.insert(3,78);   
    
    //
    $display("after inserting the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //delete()
    qu.delete(2);   
    
    //
    $display("after deleting the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //pop_front()
    x=qu.pop_front();   
    
    //
    $display("pop_front element is %0d",x);
    
    //
    $display("after pop_front the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //pop_back()
    x=qu.pop_back();   
    
    //
    $display("pop_back element is %0d",x);
    
    //
    $display("after pop_back the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
  end
endmodule
    
    
