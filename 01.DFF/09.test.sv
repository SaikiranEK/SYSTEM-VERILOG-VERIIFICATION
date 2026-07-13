class test;
  environment env;
  virtual inf inter;
  
  function new(virtual inf inter);
    this.inter=inter;
    env=new(inter);
  endfunction
  
  task run();
    env.run();
  endtask
  
endclass
