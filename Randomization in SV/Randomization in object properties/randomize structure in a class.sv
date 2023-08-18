class parent;
  typedef struct{randc int a;
                 bit [3:0] b;
                }str;
  rand str s1;
  constraint c2{s1.a<20; s1.a>10;}
endclass

module tb;
  parent c1;
initial begin
  c1=new();
  repeat(5)
    begin
      assert(c1.randomize());
      $display("a value is %0d",c1.s1.a);
    end
  end
endmodule
