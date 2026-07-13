class scoreboard;
  transaction tr;
  mailbox mon2scr;
  
  function new(mailbox mon2scr);
    this.mon2scr=mon2scr;
  endfunction
  
  task run();
    forever begin
      mon2scr.get(tr);
      if(tr.rst==1&&tr.q==0||tr.rst==0&&tr.q==tr.d)
        $display("========pass==========");
      else
        $display("========fail==========");
    end
  endtask
  
endclass
      
