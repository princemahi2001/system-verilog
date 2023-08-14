class parent #(parameter width=8,type dtype=int);
             bit[width-1:0] a;
             dtype b;
             function void display();
               $display("a value is %0d and b is %0d",a,b);
             endfunction
endclass
module tb;
  initial begin
    parent p1;
    parent #(16,string) p2;
    
    p1=new();
    p2=new();
    
    p1.a=8;
    p1.b=45;
    
    p2.a=5;
    p2.b="abc";
    
    p1.display();
    p2.display();
  end
endmodule

//output
a value is 8 and b is 45
a value is 5 and b is 6382179
