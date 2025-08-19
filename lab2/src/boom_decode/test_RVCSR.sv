class test_RVCSR extends base_test;
  `uvm_component_utils(test_RVCSR)
  function new(string name="test_RVCSR", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    bseq.randomize() with { 
        //num inside {[MIN_NUM:MAX_NUM]}; 
        num == 100; 
        select_extension == RVCSR;
    };
    
  endfunction
endclass