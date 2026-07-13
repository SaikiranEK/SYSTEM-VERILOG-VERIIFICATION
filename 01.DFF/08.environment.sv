class environment;
  transaction tr;
  generator gen;
  driver drv;
  monitor mon;
  scoreboard scr;
  mailbox gen2drv;
  mailbox mon2scr;
  virtual inf inter;
  
  function new(virtual inf inter);
    this.inter=inter;
    gen2drv=new();
    mon2scr=new();
    gen=new(gen2drv);
    drv=new(gen2drv,inter);
    mon=new(inter,mon2scr);
    scr=new(mon2scr);
  endfunction
  
  task run();
    fork
      gen.run();
      drv.run();
      mon.run();
      scr.run();
    join_any
  endtask
  
endclass
      
