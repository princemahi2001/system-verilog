module fifo(data_in,rst,clk,rd,wr,full,empty,data_out);
  input [7:0] data_in;
  input rst,clk,rd,wr;
  output full,empty;
  output reg [7:0] data_out;
  
  reg [7:0] mem [31:0];
  reg [4:0] rd_ptr,wr_ptr;
  
  always @(posedge clk)
    begin
      if(rst) 
        begin
        data_out <=0;
        wr_ptr <=0;
        rd_ptr <=0;
   
        end
      else
        begin
          if(wr==1 && full==0)
            begin
              mem[wr_ptr] <=data_in;
              wr_ptr <= wr_ptr+1;
            end
          if(rd==1 && empty==0)
            begin
              data_out <=mem[rd_ptr];
              rd_ptr <=rd_ptr+1;
            end
        end
    end
  assign full=((wr_ptr-rd_ptr)==31) ? 1:0;
  assign empty=((wr_ptr-rd_ptr)==0)? 1:0;
endmodule
                



interface intf;
  logic [7:0] data_in;
  logic rst,clk,rd,wr;
  logic full,empty;
  logic [7:0] data_out;
endinterface

//transaction class
class transaction;
  rand bit [7:0] data_in;
  rand bit rd,wr;
  bit full,empty;
  bit [7:0]data_out;
  
  constraint rd_wr{rd !=wr;
                   wr dist{0 :/50 , 1 :/50};
                   rd dist{0 :/50 ,1 :/50};}
  constraint datainput{data_in > 1;data_in < 50;}
  
  function void display(string tag);
    begin
      $display("[%0s]:data_in=%0d ,wr=%0b ,rd=%0b, data_out=%0d, full=%0b, empty=%0b",tag,data_in,wr,rd,data_out,full,empty);
    end
  endfunction
  
  function transaction copy();
    begin
      copy=new();
      copy.data_in=this.data_in;
      copy.rd=this.rd;
      copy.wr=this.wr;
      copy.data_out=this.data_out;
      copy.full=this.full;
      copy.empty=this.empty;
    end
  endfunction
  
endclass



//generator class

class generator;
  transaction tr;
  mailbox gen2driv;
  function new(mailbox gen2driv);
      this.gen2driv=gen2driv;
      tr=new();
  endfunction
  
  task run();
    repeat(20)
    begin
      tr=new();
      assert(tr.randomize());
      gen2driv.put(tr.copy);
      tr.display("GEN");
    end
  endtask
  
endclass



//class driver 
  
class driver;
  transaction tr;
  mailbox gen2driv;
  virtual intf vif;
  function new(virtual intf vif,mailbox gen2driv);
    this.vif=vif;
    this.gen2driv=gen2driv;
  endfunction
  
  task preset();
    vif.rst=1'b1;
    vif.data_in=0;
    vif.wr=1'b0;
    vif.rd=1'b0;
    vif.full=1'b0;
    vif.empty=1'b0;
    vif.data_out=0;
    repeat(5) @(posedge vif.clk);
    vif.rst=1'b0;
    //tr.display("DRIV");
    $display("[driv]: Reset done");
  endtask
    
  task run;
    repeat(20)
      begin
        tr=new();
        gen2driv.get(tr);
        
        tr.display("DRV");
        
        vif.data_in=tr.data_in;
        vif.wr=tr.wr;
        vif.rd=tr.rd;
        
        repeat(2) @(posedge vif.clk);
      end
  endtask
  
endclass


//monitor class

class monitor;
  transaction tr;
  mailbox mon2sco;
  virtual intf vif;
  function new(virtual intf vif,mailbox mon2sco);
    this.vif=vif;
    this.mon2sco=mon2sco;
  endfunction
  
  
  task run();
    tr=new();
    
    repeat(20) begin
      repeat(2) @(posedge vif.clk);
      tr.wr=vif.wr;
      tr.rd=vif.rd;
      tr.data_in=vif.data_in;
      tr.full=vif.full;
      tr.empty=vif.empty;
      tr.data_out=vif.data_out;
      
      mon2sco.put(tr);
      
      tr.display("MON");
    end
  endtask
  
endclass

  

//scorebard class

class scoreboard;
  mailbox mon2sco;
  transaction tr;
  bit [7:0] din[$];
  bit [7:0] temp;
  
  function new(mailbox mon2sco);
    this.mon2sco=mon2sco;
  endfunction
  
  task run;
    forever begin
      mon2sco.get(tr);
      tr.display("SCO");
      
      if(tr.wr==1'b1)
        begin
          din.push_front(tr.data_in);
          //$display("[SCO]: Data stored in queue :%0d",tr.data_in);
        end
      
      if(tr.rd==1'b1)
        begin
          if(tr.empty==1'b0)
            begin
              temp=din.pop_back();
              if(tr.data_out==temp)
                $display("Data is Matched");
              else
                $display("Data is not Matched");
            end
          else
            $display("FIFO is empty");
        end
    end
  endtask
  
endclass


//environment class 

class environment;
  virtual intf vif;
  transaction tr;
  generator gn;
  driver driv;
  monitor mno;
  scoreboard sco;
  mailbox gen2driv;
  mailbox mon2sco;
  
  function new(virtual intf vif);
    this.vif=vif;
    gen2driv=new();
    mon2sco=new();
    
    gn=new(gen2driv);
    driv=new(vif,gen2driv);
    
    mno=new(vif,mon2sco);
    sco=new(mon2sco);
    
  endfunction
  
  task pre_test();
    driv.preset();
  endtask
  
  task test();
    fork
      gn.run();
      driv.run();
      mno.run();
      sco.run();
    join
  endtask
    
  task post_test();
    $finish();
  endtask
  
  task run();
    pre_test();
    test();
    post_test();
  endtask
    
 endclass



//testbench top module 

module tb;
  intf vif();
  fifo dut(vif.data_in,vif.rst,vif.clk,vif.rd,
           vif.wr,vif.full,vif.empty,vif.data_out);
  initial begin
    vif.clk=1'b0;
  end
  always #10 vif.clk=~vif.clk;
  environment env;
  initial begin
    env=new(vif);
    env.run();
  end
  initial begin
    $display("completed");
  end
endmodule
