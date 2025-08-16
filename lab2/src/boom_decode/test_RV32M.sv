class test_RV32M extends base_test;
  `uvm_component_utils(test_RV32M)
  function new(string name="test_RV32M", uvm_component parent=null);
    super.new(name, parent);
  endfunction
  
  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    bseq.randomize() with { 
        //num inside {[MIN_NUM:MAX_NUM]}; 
        num == 30;  
        select_extension == RV32M;
    };
    
  endfunction
endclass