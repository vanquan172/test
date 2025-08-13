class base_test extends uvm_test; 
    `uvm_component_utils(base_test)

    function new(string name = "base_test",uvm_component parent = null); 
        super.new(name,parent); 
    endfunction 
    
    env en; 
    bas_seq bseq; 
    virtual decode_if.DRV vif; 

     function void build_phase (uvm_phase phase );
        super.build_phase(phase); 
        en = env::type_id::create("en",this); 
        // if(!uvm_config_db#( virtual decode_if.DRV)::get(this,"","decode_if_DRV",vif))
        //     `uvm_fatal(get_full_name(),"Could not get interface")
        bseq = bas_seq::type_id::create("bseq"); 
        bseq.randomize(); 
    endfunction 

     task run_phase(uvm_phase phase); 
        phase.raise_objection(this); 
 //       apply_reset(); 
        bseq.start(en.agt.sqcr); 
        #200;      
       
        // repeat(30) begin 
        //     #10; 
        //     bseq.start(en.agt.sqcr); 
        // end 

        phase.drop_objection(this);

    endtask 

    // task apply_reset();
    //     vif.cb.rstn <= 0; 
    //     repeat(5) @(vif.cb); 
    //     vif.cb.rstn <= 1;
    //     repeat(5) @(vif.cb); 
    // endtask 

endclass
