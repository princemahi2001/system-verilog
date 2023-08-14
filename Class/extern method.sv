class parent;
  int a;
  int b;
  extern function void display();
    extern task delay();
endclass
      function void parent::display();
        $display("a value is %0d",a);
      endfunction
      task parent::delay();
        #45;
        $display("b value is %0d",b);
      endtask
      
      
module tb;
  parent p1;
  initial begin
    p1=new();
    
    p1.a=3;
    p1.b=5;
    p1.display();
    p1.delay();
  end
endmodule
      
      
