import package_decode::*; 
class driver extends uvm_driver#(item); 
    `uvm_component_utils (driver)
    function new(string name = "driver", uvm_component parent = null); 
        super.new(name,parent); 
    endfunction 
    virtual decode_if.DRV vif; 
    function void build_phase(uvm_phase phase); 
        super.build_phase(phase); 
        if(!uvm_config_db#(virtual decode_if.DRV)::get(this,"","decode_if_DRV",vif))
            `uvm_fatal(get_full_name(),"could not get interface"); 

    endfunction 

    
    task run_phase(uvm_phase phase); 
        super.run_phase(phase);
        forever begin 
            item seq; 
            seq_item_port.get_next_item(seq);  
            drive_seq(seq); 
            seq_item_port.item_done();
              
        end 
    endtask

    task drive_seq (item seq);

        bit [31:0] instr_tmp; 
        case(seq.extension)
            RV32I: begin 
                case(seq.RV32I_type) 
                    RV32I_RType: begin 
                        instr_tmp = {seq.RV32I_RType_funct7,seq.rs2, seq.rs1, seq.RV32I_RType_funct3, seq.rd, seq.RV32I_RType_opcode}; 
                    end 
                    RV32I_IType: begin 
                        instr_tmp = {seq.RV32I_IType_imm, seq.rs1, seq.RV32I_IType_funct3, seq.rd, seq.RV32I_IType_opcode}; 
                    end 
                    RV32I_SType: begin                         
                        instr_tmp = {seq.RV32I_SType_imm[11:5], seq.rs2, seq.rs1, seq.RV32I_SType_funct3, seq.RV32I_SType_imm[4:0], seq.RV32I_SType_opcode}; 
                    end 
                    RV32I_BType: begin 
                        instr_tmp = {seq.RV32I_BType_imm[12],seq.RV32I_BType_imm[10:5] , seq.rs2, seq.rs1, seq.RV32I_BType_funct3, seq.RV32I_BType_imm[4:1],seq.RV32I_BType_imm[11], seq.RV32I_BType_opcode}; 
                    end 
                    RV32I_UType: begin 
                        instr_tmp = {seq.RV32I_UType_imm[31:12], seq.rd, seq.RV32I_UType_opcode}; 
                    end 
                    RV32I_JType: begin 
                        instr_tmp = {seq.RV32I_JType_imm[20],seq.RV32I_JType_imm[10:1],seq.RV32I_JType_imm[11],seq.RV32I_JType_imm[19:12], seq.rd, seq.RV32I_JType_opcode}; 
                    end 
                    RV32I_FENCE_Type: begin 
                        instr_tmp = {seq.RV32I_FENCE_fm,seq.RV32I_FENCE_pred,seq.RV32I_FENCE_succ,seq.RV32I_FENCE_rs1, seq.RV32I_FENCE_funct3,seq.RV32I_FENCE_rd, seq.RV32I_FENCE_opcode}; 
                    end 
                    RV32I_ENVIR_Type: begin 
                        instr_tmp = {seq.RV32I_ENVIR_funct12,seq.RV32I_ENVIR_rs1,seq.RV32I_ENVIR_funct3,seq.RV32I_ENVIR_rd, seq.RV32I_ENVIR_opcode}; 
                    end 
                endcase
            end 
            RV64I: begin 
                case(seq.RV64I_type) 
                    RV64I_RType_I: begin 
                        instr_tmp = {seq.RV64I_RType_funct7_I,seq.RV64I_RType_shamt_I, seq.rs1, seq.RV64I_RType_funct3, seq.rd, seq.RV64I_RType_opcode_I}; 
                    end 

                    RV64I_RType_W: begin 
                        if(seq.RV64I_RType_opcode_W == 7'b0011011)
                            instr_tmp = {seq.RV64I_RType_funct7_W,seq.RV64I_RType_shamt_W, seq.rs1, seq.RV64I_RType_funct3, seq.rd, seq.RV64I_RType_opcode_W}; 
                        else 
                            instr_tmp = {seq.RV64I_RType_funct7_W,seq.rs2, seq.rs1, seq.RV64I_RType_funct3, seq.rd, seq.RV64I_RType_opcode_W}; 
                    end
                    RV64I_IType: begin 
                        instr_tmp = {seq.RV64I_IType_imm, seq.rs1, seq.RV64I_IType_funct3, seq.rd, seq.RV64I_IType_opcode}; 
                    end 
                    RV64I_SType: begin                         
                        instr_tmp = {seq.RV64I_SType_imm[11:5], seq.rs2, seq.rs1, seq.RV64I_SType_funct3, seq.RV64I_SType_imm[4:0], seq.RV64I_SType_opcode}; 
                    end 
     
                endcase
            end 
            RV32M: begin 
                instr_tmp = {seq.RV32M_funct7,seq.rs2, seq.rs1, seq.RV32M_funct3, seq.rd, seq.RV32M_opcode}; 
            end 
            RV64M: begin 
                instr_tmp = {seq.RV64M_funct7,seq.rs2, seq.rs1, seq.RV64M_funct3, seq.rd, seq.RV64M_opcode}; 
            end 
            RV32A: begin 
                instr_tmp = {seq.RV32A_funct7,seq.RV32A_aq, seq.RV32A_rl,seq.RV32A_rs2, seq.RV32A_rs1, seq.RV32A_funct3, seq.RV32A_rd, seq.RV32A_opcode}; 
                
            end 
            RV64A: begin 
                instr_tmp = {seq.RV64A_funct7,seq.RV64A_aq, seq.RV64A_rl,seq.RV64A_rs2, seq.RV64A_rs1, seq.RV64A_funct3, seq.RV64A_rd, seq.RV64A_opcode}; 
            end 
        endcase

        @(vif.cb); 
        vif.cb.instr                       <= instr_tmp;
        vif.cb.io_enq_uop_is_sfb           <= seq.io_enq_uop_is_sfb;
        vif.cb.io_interrupt_cause          <= seq.io_interrupt_cause;
        vif.cb.io_interrupt                <= seq.io_interrupt;
        vif.cb.io_csr_decode_fp_illegal    <= seq.io_csr_decode_fp_illegal;
        vif.cb.io_csr_decode_read_illegal  <= seq.io_csr_decode_read_illegal;
        vif.cb.io_csr_decode_write_illegal <= seq.io_csr_decode_write_illegal;
        vif.cb.io_csr_decode_write_flush   <= seq.io_csr_decode_write_flush;
        vif.cb.io_csr_decode_system_illegal <= seq.io_csr_decode_system_illegal;
        vif.cb.io_enq_uop_xcpt_pf_if       <= seq.io_enq_uop_xcpt_pf_if;
        vif.cb.io_enq_uop_xcpt_ae_if       <= seq.io_enq_uop_xcpt_ae_if;
        vif.cb.io_enq_uop_bp_debug_if      <= seq.io_enq_uop_bp_debug_if;
        vif.cb.io_enq_uop_bp_xcpt_if       <= seq.io_enq_uop_bp_xcpt_if;
        vif.cb.true_random_instr           <= seq.true_random_instr;

        `uvm_info(get_type_name(), $sformatf("res1 = %b, rv_type = %b, instr = %b", seq.rs1,seq.RV32I_type,instr_tmp), UVM_HIGH);
    endtask
endclass

