// Code your testbench here
// or browse Examples
module tb;
  int a_array1[*] ;     // associative array of integer (unspecified index)
  int a2[bit [7:0]];   //index type is bit [7:0] and entry type is int
  int a[string];  //index type is string and entry type is bit
  initial 
    begin
      
      //for a
      a["RED"]=3;
      a["yellow"]=5;
      a["blue"]=9;
      
      //for a2  
      a2[7]=34;
      a2[8]=32;
      
      
      //display
      foreach(a2[i]) $display("a[%0d]=%0d",i,a2[i]);   //for a2
      foreach(a[i]) $display("a[%0s]=%0d",i,a[i]);    //for a
    end
endmodule
