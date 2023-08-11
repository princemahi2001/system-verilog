
class abc;
  int packet_id;
  static int no_of_packets=0;        //static variable
  function new();
    no_of_packets++;
    packet_id= no_of_packets;
  endfunction
  function void display();
    $display("packet id value is %0d",packet_id);
    $display("no of packets value is %0d",no_of_packets);
  endfunction

  //static member
  static function void print();
    //$display("packet id value is %0d",packet_id);  it will show error because it is not an static variable
    $display("no of packets value is %0d",no_of_packets);
  endfunction
endclass 
module tb;
  initial begin
    abc a[3];
    foreach(a[i])
      begin
        a[i]=new();
        a[i].display();
        a[i].print();
      end
  end
endmodule
