class env extends uvm_env;
    `uvm_component_utils(env)
    function new(string name = "env",uvm_component parent = null); 
        super.new(name,parent); 
    endfunction 

    agent agt; 
    scoreboard sb; 
    coverage cv; 
    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        agt = agent::type_id::create("agt",this); 
        sb = scoreboard::type_id::create("sb",this); 
        cv = coverage::type_id::create("cv",this); 
    endfunction 

    function void connect_phase(uvm_phase phase);
        agt.mon.mon_anl_port.connect(sb.sb_anl_imp); 
        agt.mon.mon_anl_port.connect(cv.analysis_export); 
    endfunction 
endclass