import package_decode::*; 
import decode_table_package::*; 

class scoreboard extends uvm_scoreboard;
    `uvm_component_utils(scoreboard)
    uvm_analysis_imp #(item,scoreboard) sb_anl_imp; 
    function new(string name = "scoreboard", uvm_component parent = null);
        super.new(name,parent); 
        sb_anl_imp = new("sb_anl_imp",this); 
    endfunction 

    function void build_phase(uvm_phase phase);
        super.build_phase (phase); 
    endfunction 

    function  write(item sb_item); 
        bit flag_err = 0; 
        // expected sb_mem_size, 
        bit [1:0] sb_mem_size;
        bit  sb_mem_signed;
        if(sb_item.mem_cmd == M_SFENCE || sb_item.mem_cmd == M_FLUSH_ALL) begin 
            sb_mem_size = '{((sb_item.instr[24:20] != 0) ? 1'b1 : 1'b0 ) ,((sb_item.instr[19:15] != 0) ? 1'b1 : 1'b0 )}; 
        end 
        else 
            sb_mem_size = sb_item.instr[13:12]; 
        // expected sb_mem_signed
        sb_mem_signed = !sb_item.instr[14]; 
        
        //`uvm_info(get_type_name, $sformatf(" function7 = %b, opcode = %b",sb_item.instr[31:25],sb_item.instr[6:0]), UVM_HIGH);
        
        foreach ( OPCODES[i] ) begin 
 //       `uvm_info(get_type_name, $sformatf(" after masked instr = %h, OPCODE = %h",sb_item.instr & MASKS[i], OPCODES[i]), UVM_LOW);
            if((sb_item.instr & MASKS[i]) == OPCODES[i]) begin 
                // `uvm_info(get_type_name, $sformatf("da------------------------------------ vao if"), UVM_LOW);
                flag_err = 1; 
                //`uvm_info(get_type_name, $sformatf(" after masked instr = %h, OPCODE = %h",sb_item.instr & MASKS[i], OPCODES[i]), UVM_HIGH);

                if (
                (sb_item.uopc            == DECODE_STRUCT[i].uopc) &&
                (sb_item.iq_type         == DECODE_STRUCT[i].iq_type) &&
                (sb_item.fu_code         == DECODE_STRUCT[i].fu_code) &&
                (sb_item.dst_rtype       == DECODE_STRUCT[i].dst_type) &&
                (sb_item.lrs1_rtype      == DECODE_STRUCT[i].rs1_type) &&
                (sb_item.lrs2_rtype      == DECODE_STRUCT[i].rs2_type) &&
                (sb_item.frs3_en         == DECODE_STRUCT[i].frs3_en) &&
            //    (sb_item.imm_packed         == DECODE_STRUCT[i].imm_sel) &&
                (sb_item.uses_ldq        == DECODE_STRUCT[i].uses_ldq) &&
                (sb_item.uses_stq        == DECODE_STRUCT[i].uses_stq) &&
                (sb_item.is_amo          == DECODE_STRUCT[i].is_amo) &&
                (sb_item.is_fence        == DECODE_STRUCT[i].is_fence) &&
                (sb_item.is_fencei       == DECODE_STRUCT[i].is_fencei) &&
                (sb_item.mem_cmd         == DECODE_STRUCT[i].mem_cmd) &&
                //(sb_item.wakeup_delay    == DECODE_STRUCT[i].wakeup_delay) &&
                (sb_item.bypassable      == DECODE_STRUCT[i].bypassable) &&
                (sb_item.is_br           == DECODE_STRUCT[i].is_br) &&
                (sb_item.is_sys_pc2epc   == DECODE_STRUCT[i].is_sys_pc2epc) &&
                (sb_item.is_unique       == DECODE_STRUCT[i].inst_unique) &&
                (sb_item.flush_on_commit == DECODE_STRUCT[i].flush_on_commit) &&
                //(sb_item.csr_cmd         == DECODE_STRUCT[i].csr_cmd) &&
                //(sb_item.uopc_sfb_active == DECODE_STRUCT[i].uopc_sfb_active)
                ((sb_item.mem_size == sb_mem_size)&&(sb_item.mem_signed == sb_mem_signed))
                )
                    `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %h",sb_item.instr), UVM_HIGH)
                else  begin 
                    `uvm_error("SCBD", $sformatf("ERROR! Decode fail with %h",sb_item.instr))
                end 
                break; 
            end 
            // else 
            //      `uvm_info(get_type_name, $sformatf("KHONG vao if i = %d",i), UVM_LOW);
        end 
        if(!flag_err) 
            `uvm_error("SCB",$sformatf("INSTRUCTION MISMATCH TABLE_INSTRC = %h",sb_item.instr)) 

    endfunction

endclass

        // check exception 
        // bit sb_exc_valid;
        // bit [63:0] sb_exc_cause;
        // if( sb_item.io_enq_uop_xcpt_pf_if  && sb_item.io_enq_uop_xcpt_ae_if &&
        //     sb_item.io_enq_uop_bp_debug_if && sb_item.io_enq_uop_bp_xcpt_if &&
        //     sb_item.io_interrupt && (!sb_item.io_enq_uop_is_sfb)) begin 
        //     sb_exc_valid = 1; 
        // end 



            // `uvm_error("SCBD", $sformatf("ERROR ! Decode fail with %b, at i = %0d", sb_item.instr, i))
                    // `uvm_error("SCBD", $sformatf(
                    // "ERROR ! Decode fail with instr_masked= %h, OPCODES = %0h\n\
                    // uopc            : sb=%0d, struct=%0d\n\
                    // iq_type         : sb=%0d, struct=%0d\n\
                    // fu_code         : sb=%0d, struct=%0d\n\
                    // dst_rtype       : sb=%0d, struct=%0d\n\
                    // lrs1_rtype      : sb=%0d, struct=%0d\n\
                    // lrs2_rtype      : sb=%0d, struct=%0d\n\
                    // frs3_en         : sb=%0b, struct=%0b\n\
                    // uses_ldq        : sb=%0b, struct=%0b\n\
                    // uses_stq        : sb=%0b, struct=%0b\n\
                    // is_amo          : sb=%0b, struct=%0b\n\
                    // is_fence        : sb=%0b, struct=%0b\n\
                    // is_fencei       : sb=%0b, struct=%0b\n\
                    // mem_cmd         : sb=%0d, struct=%0d\n\
                    // bypassable      : sb=%0b, struct=%0b\n\
                    // is_br           : sb=%0b, struct=%0b\n\
                    // is_sys_pc2epc   : sb=%0b, struct=%0b\n\
                    // is_unique       : sb=%0b, struct=%0b\n\
                    // flush_on_commit : sb=%0b, struct=%0b",
                    // (sb_item.instr & MASKS[i]), OPCODES[i],
                    // sb_item.uopc,           DECODE_STRUCT[i].uopc,
                    // sb_item.iq_type,        DECODE_STRUCT[i].iq_type,
                    // sb_item.fu_code,        DECODE_STRUCT[i].fu_code,
                    // sb_item.dst_rtype,      DECODE_STRUCT[i].dst_type,
                    // sb_item.lrs1_rtype,     DECODE_STRUCT[i].rs1_type,
                    // sb_item.lrs2_rtype,     DECODE_STRUCT[i].rs2_type,
                    // sb_item.frs3_en,        DECODE_STRUCT[i].frs3_en,
                    // sb_item.uses_ldq,       DECODE_STRUCT[i].uses_ldq,
                    // sb_item.uses_stq,       DECODE_STRUCT[i].uses_stq,
                    // sb_item.is_amo,         DECODE_STRUCT[i].is_amo,
                    // sb_item.is_fence,       DECODE_STRUCT[i].is_fence,
                    // sb_item.is_fencei,      DECODE_STRUCT[i].is_fencei,
                    // sb_item.mem_cmd,        DECODE_STRUCT[i].mem_cmd,
                    // sb_item.bypassable,     DECODE_STRUCT[i].bypassable,
                    // sb_item.is_br,          DECODE_STRUCT[i].is_br,
                    // sb_item.is_sys_pc2epc,  DECODE_STRUCT[i].is_sys_pc2epc,
                    // sb_item.is_unique,      DECODE_STRUCT[i].inst_unique,
                    // sb_item.flush_on_commit,DECODE_STRUCT[i].flush_on_commit
                    // );



                    // if(sb_item.fu_code != DECODE_STRUCT[i].fu_code) begin 
                    //     `uvm_error("SCBD", $sformatf(
                    //     "ERROR ! Decode fail with instr_masked= %h, OPCODES = %0h\n\
                    //     lrs2_rtype : sb=%0d, struct=%0d\n\
                    //     fu_code    : sb=%0d, struct=%0d",
                    //     (sb_item.instr & MASKS[i]), OPCODES[i],
                    //     sb_item.lrs2_rtype, DECODE_STRUCT[i].rs2_type,
                    //     sb_item.fu_code,    DECODE_STRUCT[i].fu_code
                    //     ));
                    // end 
                    // else if(sb_item.lrs2_rtype != DECODE_STRUCT[i].rs2_type)
                    //     `uvm_error("SCBD", $sformatf(
                    //     "ERROR ! Decode fail with instr_masked= %h, OPCODES = %0h\n\
                    //     lrs2_rtype : sb=%0d, struct=%0d\n\
                    //     fu_code    : sb=%0d, struct=%0d",
                    //     (sb_item.instr & MASKS[i]), OPCODES[i],
                    //     sb_item.lrs2_rtype, DECODE_STRUCT[i].rs2_type,
                    //     sb_item.fu_code,    DECODE_STRUCT[i].fu_code
                    //     ));