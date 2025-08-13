class agent extends uvm_agent;
    `uvm_component_utils(agent)
    function new(string name ="agent",uvm_component parent = null); 
        super.new(name,parent); 
    endfunction 

    driver drv;
    monitor mon; 
    uvm_sequencer#(item) sqcr; 
    function void build_phase(uvm_phase phase);
        super.build_phase(phase); 
        drv = driver::type_id::create("drv",this); 
        mon = monitor::type_id::create("mon",this); 
        sqcr = uvm_sequencer#(item)::type_id::create("sqcr",this); 
    endfunction 

    function void connect_phase(uvm_phase phase); 
        drv.seq_item_port.connect(sqcr.seq_item_export);
    endfunction 

endclass