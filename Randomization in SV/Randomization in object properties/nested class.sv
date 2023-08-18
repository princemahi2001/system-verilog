class parent;
  rand int a;
  constraint c1{a>0; a<30;}
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass
class child;
  rand parent p1;
  function new();
    p1=new();
  endfunction
endclass

module tb;
  child c1;
initial begin
  c1=new();
  repeat(5)
    begin
      assert(c1.randomize());
      c1.p1.display();
    end
  end
endmodule
