class monitor extends uvm_monitor;
    `uvm_component_utils(monitor)
    uvm_analysis_port #(item) mon_anl_port; 
    function new(string name = "monitor", uvm_component parent = null); 
        super.new(name,parent); 
        mon_anl_port = new("mon_anl_port",this); 
    endfunction 
    virtual decode_if.MON vif; 
    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        if(!uvm_config_db#(virtual decode_if.MON)::get(this,"","decode_if_MON",vif))
            `uvm_info(get_full_name(),"could not get vif",UVM_LOW); 

    endfunction 

    item mon_item;
    task run_phase(uvm_phase phase); 
//        super.run_phase(phase);
        forever begin 
//            @(vif.clk); 
            @(negedge vif.clk);
            mon_item = item::type_id::create("mon_item");
            mon_item.instr                          = vif.instr;
            mon_item.uopc                           = vif.uopc;
            mon_item.iq_type                        = vif.iq_type;
            mon_item.is_br                          = vif.is_br;
            mon_item.bypassable                     = vif.bypassable;
            mon_item.mem_cmd                        = vif.mem_cmd;
            mon_item.is_fence                       = vif.is_fence;
            mon_item.is_fencei                      = vif.is_fencei;
            mon_item.is_amo                         = vif.is_amo;
            mon_item.uses_ldq                       = vif.uses_ldq;
            mon_item.uses_stq                       = vif.uses_stq;
            mon_item.flush_on_commit                = vif.flush_on_commit;
            mon_item.io_enq_uop_is_sfb              = vif.io_enq_uop_is_sfb;
            mon_item.io_deq_uop_is_sfb              = vif.io_deq_uop_is_sfb;
            mon_item.fu_code                        = vif.fu_code;
            mon_item.is_jalr                        = vif.is_jalr;
            mon_item.is_jal                         = vif.is_jal;
            mon_item.imm_packed                     = vif.imm_packed;
            mon_item.is_sys_pc2epc                  = vif.is_sys_pc2epc;
            mon_item.ldst                           = vif.ldst;
            mon_item.lrs1                           = vif.lrs1;
            mon_item.lrs2                           = vif.lrs2;
            mon_item.lrs3                           = vif.lrs3;
            mon_item.is_unique                      = vif.is_unique;
            mon_item.ldst_is_rs1                    = vif.ldst_is_rs1;
            mon_item.ldst_val                       = vif.ldst_val;
            mon_item.dst_rtype                      = vif.dst_rtype;
            mon_item.lrs1_rtype                     = vif.lrs1_rtype;
            mon_item.lrs2_rtype                     = vif.lrs2_rtype;
            mon_item.frs3_en                        = vif.frs3_en;
            mon_item.fp_val                         = vif.fp_val;
            mon_item.mem_size                       = vif.mem_size;
            mon_item.mem_signed                     = vif.mem_signed;

            mon_item.io_interrupt_cause             = vif.io_interrupt_cause;
            mon_item.io_interrupt                   = vif.io_interrupt;

            mon_item.io_csr_decode_fp_illegal       = vif.io_csr_decode_fp_illegal;
            mon_item.io_csr_decode_read_illegal     = vif.io_csr_decode_read_illegal;
            mon_item.io_csr_decode_write_illegal    = vif.io_csr_decode_write_illegal;
            mon_item.io_csr_decode_write_flush      = vif.io_csr_decode_write_flush;
            mon_item.io_csr_decode_system_illegal   = vif.io_csr_decode_system_illegal;

            mon_item.io_enq_uop_xcpt_pf_if          = vif.io_enq_uop_xcpt_pf_if;
            mon_item.io_enq_uop_xcpt_ae_if          = vif.io_enq_uop_xcpt_ae_if;
            mon_item.io_enq_uop_bp_debug_if         = vif.io_enq_uop_bp_debug_if;
            mon_item.io_enq_uop_bp_xcpt_if          = vif.io_enq_uop_bp_xcpt_if;

            mon_item.exception                      = vif.exception;
            mon_item.exc_cause                      = vif.exc_cause;
            mon_item.true_random_instr              = vif.true_random_instr;

            mon_anl_port.write(mon_item);
        

        end 
    endtask 

endclass


