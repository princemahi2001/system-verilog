
class abc;
  int packet_id;
  static int no_of_packets=0;
  function new();
    no_of_packets++;
    packet_id= no_of_packets;
  endfunction
  static function void print();
    //$display("packet id value is %0d",packet_id);  it will show error because it is not an static variable
    $display("no of packets value is %0d",no_of_packets);
  endfunction
endclass 
module tb;
  initial begin
    abc a[3];
    abc p;
    foreach(a[i])
      begin
        a[i]=new();
      end
    
    //accessing static variable without creating handle
    $display("value is %0d",p.no_of_packets);
    
    //accessing static method without creating handle
    p.print();
  end
endmodule
