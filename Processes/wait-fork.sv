
module tb;
  initial begin
    fork
      $display("fork1 called at %0d",$time);
      #2 $display("fork2 called at %0d",$time);
      #2 $display("fork3 called at %0d",$time);
      #5 $display("fork4 called at %0d",$time);
      #8 $display("fork5 called at %0d",$time);
      #9 $display("fork6 called at %0d",$time);
    join_any
    wait fork;
     $display("out fork called at %0d",$time);
  end
endmodule
