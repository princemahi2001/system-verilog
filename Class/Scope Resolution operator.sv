class parent;
  int a;
  static int b;
  
  static function void display();
    $display("b value is %0d",b);
  endfunction
endclass

module tb;
  initial begin
    parent::b=7;
    parent::display();
  end
endmodule
