class monitor;
  virtual inf inter;
  mailbox mon2scr;
  transaction tr;
  
  function new(virtual inf inter,mailbox mon2scr);
    this.inter=inter;
    this.mon2scr=mon2scr;
  endfunction
  
  task run();
    forever begin
      tr=new();
      @(posedge inter.clk)
      tr.rst=inter.rst;
      tr.d=inter.d;
      tr.q=inter.q;
      mon2scr.put(tr);
    end
  endtask
  
endclass
