class parent;
  rand int a;
  constraint c1{a>0; a<30;}
  function void display();
    $display("a value is %0d",a);
  endfunction
endclass
module tb;
parent p1;
initial begin
  p1=new();
  repeat(5)
    begin
      assert(p1.randomize());
      p1.display();
    end
  end
endmodule
