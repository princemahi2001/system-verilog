module tb;
  int qu[$:2];    //Bounded queue declaration
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
    qu.push_back(6);   //push element is discarded because it is bounded queue
    
    //
    $display("after push_back the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
    
    //push_back()
    qu.push_front(6);   //last element is discarded because it is bounded queue
    
    //
    $display("after push_front the element ");
    
    //print
    foreach(qu[i]) $display("queue[%0d]=%0d",i,qu[i]);
  end
endmodule
