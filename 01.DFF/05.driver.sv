class driver;
  virtual inf inter;    //vitualization convert static one to dynamic one
  mailbox gen2drv;
  transaction tr;
  
  function new(mailbox gen2drv,virtual inf inter);
    this.gen2drv=gen2drv;
    this.inter=inter;
  endfunction
  
  task run();
    forever begin
    tr=new();
    gen2drv.get(tr);
    @(posedge inter.clk);
    inter.d<=tr.d;        //getting the signals from transaction to driver handle name
    inter.rst<=tr.rst;
    end
  endtask
  
endclass
