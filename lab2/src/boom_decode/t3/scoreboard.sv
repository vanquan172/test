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
        `uvm_info(get_type_name, $sformatf("inside scoreboard %b",item.instr), UVM_LOW);

    //LUI    
        if(sb_item.instr & MASK_LUI_JALR == LUI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LUI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LUI"))
        end  
// AUIPC
else if(sb_item.instr & MASK_LUI_JALR == AUIPC) begin 
    if (
        (sb_item.uopc            == AUIPC_struct.uopc) &&
        (sb_item.iq_type         == AUIPC_struct.iq_type) &&
        (sb_item.fu_code         == AUIPC_struct.fu_code) &&
        (sb_item.dst_type        == AUIPC_struct.dst_type) &&
        (sb_item.rs1_type        == AUIPC_struct.rs1_type) &&
        (sb_item.rs2_type        == AUIPC_struct.rs2_type) &&
        (sb_item.frs3_en         == AUIPC_struct.frs3_en) &&
        (sb_item.imm_sel         == AUIPC_struct.imm_sel) &&
        (sb_item.uses_ldq        == AUIPC_struct.uses_ldq) &&
        (sb_item.uses_stq        == AUIPC_struct.uses_stq) &&
        (sb_item.is_amo          == AUIPC_struct.is_amo) &&
        (sb_item.is_fence        == AUIPC_struct.is_fence) &&
        (sb_item.is_fencei       == AUIPC_struct.is_fencei) &&
        (sb_item.mem_cmd         == AUIPC_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == AUIPC_struct.wakeup_delay) &&
        (sb_item.bypassable      == AUIPC_struct.bypassable) &&
        (sb_item.is_br           == AUIPC_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == AUIPC_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == AUIPC_struct.inst_unique) &&
        (sb_item.flush_on_commit == AUIPC_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == AUIPC_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == AUIPC_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "AUIPC"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "AUIPC"))
end  

// JAL 
else if(sb_item.instr & MASK_LUI_JALR == JAL) begin 
    if (
        (sb_item.uopc            == JAL_struct.uopc) &&
        (sb_item.iq_type         == JAL_struct.iq_type) &&
        (sb_item.fu_code         == JAL_struct.fu_code) &&
        (sb_item.dst_type        == JAL_struct.dst_type) &&
        (sb_item.rs1_type        == JAL_struct.rs1_type) &&
        (sb_item.rs2_type        == JAL_struct.rs2_type) &&
        (sb_item.frs3_en         == JAL_struct.frs3_en) &&
        (sb_item.imm_sel         == JAL_struct.imm_sel) &&
        (sb_item.uses_ldq        == JAL_struct.uses_ldq) &&
        (sb_item.uses_stq        == JAL_struct.uses_stq) &&
        (sb_item.is_amo          == JAL_struct.is_amo) &&
        (sb_item.is_fence        == JAL_struct.is_fence) &&
        (sb_item.is_fencei       == JAL_struct.is_fencei) &&
        (sb_item.mem_cmd         == JAL_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == JAL_struct.wakeup_delay) &&
        (sb_item.bypassable      == JAL_struct.bypassable) &&
        (sb_item.is_br           == JAL_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == JAL_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == JAL_struct.inst_unique) &&
        (sb_item.flush_on_commit == JAL_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == JAL_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == JAL_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "JAL"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "JAL"))
end  

// JALR
else if(sb_item.instr & MASK_LUI_JALR == JALR) begin 
    if (
        (sb_item.uopc            == JALR_struct.uopc) &&
        (sb_item.iq_type         == JALR_struct.iq_type) &&
        (sb_item.fu_code         == JALR_struct.fu_code) &&
        (sb_item.dst_type        == JALR_struct.dst_type) &&
        (sb_item.rs1_type        == JALR_struct.rs1_type) &&
        (sb_item.rs2_type        == JALR_struct.rs2_type) &&
        (sb_item.frs3_en         == JALR_struct.frs3_en) &&
        (sb_item.imm_sel         == JALR_struct.imm_sel) &&
        (sb_item.uses_ldq        == JALR_struct.uses_ldq) &&
        (sb_item.uses_stq        == JALR_struct.uses_stq) &&
        (sb_item.is_amo          == JALR_struct.is_amo) &&
        (sb_item.is_fence        == JALR_struct.is_fence) &&
        (sb_item.is_fencei       == JALR_struct.is_fencei) &&
        (sb_item.mem_cmd         == JALR_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == JALR_struct.wakeup_delay) &&
        (sb_item.bypassable      == JALR_struct.bypassable) &&
        (sb_item.is_br           == JALR_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == JALR_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == JALR_struct.inst_unique) &&
        (sb_item.flush_on_commit == JALR_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == JALR_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == JALR_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "JALR"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "JALR"))
end  

// BEG
else if(sb_item.instr & MASK_BEG_ANDI == BEG) begin 
    if (
        (sb_item.uopc            == BEG_struct.uopc) &&
        (sb_item.iq_type         == BEG_struct.iq_type) &&
        (sb_item.fu_code         == BEG_struct.fu_code) &&
        (sb_item.dst_type        == BEG_struct.dst_type) &&
        (sb_item.rs1_type        == BEG_struct.rs1_type) &&
        (sb_item.rs2_type        == BEG_struct.rs2_type) &&
        (sb_item.frs3_en         == BEG_struct.frs3_en) &&
        (sb_item.imm_sel         == BEG_struct.imm_sel) &&
        (sb_item.uses_ldq        == BEG_struct.uses_ldq) &&
        (sb_item.uses_stq        == BEG_struct.uses_stq) &&
        (sb_item.is_amo          == BEG_struct.is_amo) &&
        (sb_item.is_fence        == BEG_struct.is_fence) &&
        (sb_item.is_fencei       == BEG_struct.is_fencei) &&
        (sb_item.mem_cmd         == BEG_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BEG_struct.wakeup_delay) &&
        (sb_item.bypassable      == BEG_struct.bypassable) &&
        (sb_item.is_br           == BEG_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BEG_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BEG_struct.inst_unique) &&
        (sb_item.flush_on_commit == BEG_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BEG_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BEG_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BEG"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BEG"))
end  

// BNE
else if(sb_item.instr & MASK_BEG_ANDI == BNE) begin 
    if (
        (sb_item.uopc            == BNE_struct.uopc) &&
        (sb_item.iq_type         == BNE_struct.iq_type) &&
        (sb_item.fu_code         == BNE_struct.fu_code) &&
        (sb_item.dst_type        == BNE_struct.dst_type) &&
        (sb_item.rs1_type        == BNE_struct.rs1_type) &&
        (sb_item.rs2_type        == BNE_struct.rs2_type) &&
        (sb_item.frs3_en         == BNE_struct.frs3_en) &&
        (sb_item.imm_sel         == BNE_struct.imm_sel) &&
        (sb_item.uses_ldq        == BNE_struct.uses_ldq) &&
        (sb_item.uses_stq        == BNE_struct.uses_stq) &&
        (sb_item.is_amo          == BNE_struct.is_amo) &&
        (sb_item.is_fence        == BNE_struct.is_fence) &&
        (sb_item.is_fencei       == BNE_struct.is_fencei) &&
        (sb_item.mem_cmd         == BNE_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BNE_struct.wakeup_delay) &&
        (sb_item.bypassable      == BNE_struct.bypassable) &&
        (sb_item.is_br           == BNE_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BNE_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BNE_struct.inst_unique) &&
        (sb_item.flush_on_commit == BNE_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BNE_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BNE_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BNE"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BNE"))
end  

// BLT
if (sb_item.instr & MASK_BEG_ANDI == BLT) begin 
    if (
        (sb_item.uopc            == BLT_struct.uopc) &&
        (sb_item.iq_type         == BLT_struct.iq_type) &&
        (sb_item.fu_code         == BLT_struct.fu_code) &&
        (sb_item.dst_type        == BLT_struct.dst_type) &&
        (sb_item.rs1_type        == BLT_struct.rs1_type) &&
        (sb_item.rs2_type        == BLT_struct.rs2_type) &&
        (sb_item.frs3_en         == BLT_struct.frs3_en) &&
        (sb_item.imm_sel         == BLT_struct.imm_sel) &&
        (sb_item.uses_ldq        == BLT_struct.uses_ldq) &&
        (sb_item.uses_stq        == BLT_struct.uses_stq) &&
        (sb_item.is_amo          == BLT_struct.is_amo) &&
        (sb_item.is_fence        == BLT_struct.is_fence) &&
        (sb_item.is_fencei       == BLT_struct.is_fencei) &&
        (sb_item.mem_cmd         == BLT_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BLT_struct.wakeup_delay) &&
        (sb_item.bypassable      == BLT_struct.bypassable) &&
        (sb_item.is_br           == BLT_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BLT_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BLT_struct.inst_unique) &&
        (sb_item.flush_on_commit == BLT_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BLT_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BLT_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BLT"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BLT"))
end  

// BGE
else if (sb_item.instr & MASK_BEG_ANDI == BGE) begin 
    if (
        (sb_item.uopc            == BGE_struct.uopc) &&
        (sb_item.iq_type         == BGE_struct.iq_type) &&
        (sb_item.fu_code         == BGE_struct.fu_code) &&
        (sb_item.dst_type        == BGE_struct.dst_type) &&
        (sb_item.rs1_type        == BGE_struct.rs1_type) &&
        (sb_item.rs2_type        == BGE_struct.rs2_type) &&
        (sb_item.frs3_en         == BGE_struct.frs3_en) &&
        (sb_item.imm_sel         == BGE_struct.imm_sel) &&
        (sb_item.uses_ldq        == BGE_struct.uses_ldq) &&
        (sb_item.uses_stq        == BGE_struct.uses_stq) &&
        (sb_item.is_amo          == BGE_struct.is_amo) &&
        (sb_item.is_fence        == BGE_struct.is_fence) &&
        (sb_item.is_fencei       == BGE_struct.is_fencei) &&
        (sb_item.mem_cmd         == BGE_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BGE_struct.wakeup_delay) &&
        (sb_item.bypassable      == BGE_struct.bypassable) &&
        (sb_item.is_br           == BGE_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BGE_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BGE_struct.inst_unique) &&
        (sb_item.flush_on_commit == BGE_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BGE_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BGE_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BGE"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BGE"))
end   

// BLTU
else if (sb_item.instr & MASK_BEG_ANDI == BLTU) begin 
    if (
        (sb_item.uopc            == BLTU_struct.uopc) &&
        (sb_item.iq_type         == BLTU_struct.iq_type) &&
        (sb_item.fu_code         == BLTU_struct.fu_code) &&
        (sb_item.dst_type        == BLTU_struct.dst_type) &&
        (sb_item.rs1_type        == BLTU_struct.rs1_type) &&
        (sb_item.rs2_type        == BLTU_struct.rs2_type) &&
        (sb_item.frs3_en         == BLTU_struct.frs3_en) &&
        (sb_item.imm_sel         == BLTU_struct.imm_sel) &&
        (sb_item.uses_ldq        == BLTU_struct.uses_ldq) &&
        (sb_item.uses_stq        == BLTU_struct.uses_stq) &&
        (sb_item.is_amo          == BLTU_struct.is_amo) &&
        (sb_item.is_fence        == BLTU_struct.is_fence) &&
        (sb_item.is_fencei       == BLTU_struct.is_fencei) &&
        (sb_item.mem_cmd         == BLTU_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BLTU_struct.wakeup_delay) &&
        (sb_item.bypassable      == BLTU_struct.bypassable) &&
        (sb_item.is_br           == BLTU_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BLTU_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BLTU_struct.inst_unique) &&
        (sb_item.flush_on_commit == BLTU_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BLTU_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BLTU_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BLTU"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BLTU"))
end  

// BGEU
else if (sb_item.instr & MASK_BEG_ANDI == BGEU) begin 
    if (
        (sb_item.uopc            == BGEU_struct.uopc) &&
        (sb_item.iq_type         == BGEU_struct.iq_type) &&
        (sb_item.fu_code         == BGEU_struct.fu_code) &&
        (sb_item.dst_type        == BGEU_struct.dst_type) &&
        (sb_item.rs1_type        == BGEU_struct.rs1_type) &&
        (sb_item.rs2_type        == BGEU_struct.rs2_type) &&
        (sb_item.frs3_en         == BGEU_struct.frs3_en) &&
        (sb_item.imm_sel         == BGEU_struct.imm_sel) &&
        (sb_item.uses_ldq        == BGEU_struct.uses_ldq) &&
        (sb_item.uses_stq        == BGEU_struct.uses_stq) &&
        (sb_item.is_amo          == BGEU_struct.is_amo) &&
        (sb_item.is_fence        == BGEU_struct.is_fence) &&
        (sb_item.is_fencei       == BGEU_struct.is_fencei) &&
        (sb_item.mem_cmd         == BGEU_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == BGEU_struct.wakeup_delay) &&
        (sb_item.bypassable      == BGEU_struct.bypassable) &&
        (sb_item.is_br           == BGEU_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == BGEU_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == BGEU_struct.inst_unique) &&
        (sb_item.flush_on_commit == BGEU_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == BGEU_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == BGEU_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "BGEU"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "BGEU"))
end  

// LB
else if (sb_item.instr & MASK_BEG_ANDI == LB) begin 
    if (
        (sb_item.uopc            == LB_struct.uopc) &&
        (sb_item.iq_type         == LB_struct.iq_type) &&
        (sb_item.fu_code         == LB_struct.fu_code) &&
        (sb_item.dst_type        == LB_struct.dst_type) &&
        (sb_item.rs1_type        == LB_struct.rs1_type) &&
        (sb_item.rs2_type        == LB_struct.rs2_type) &&
        (sb_item.frs3_en         == LB_struct.frs3_en) &&
        (sb_item.imm_sel         == LB_struct.imm_sel) &&
        (sb_item.uses_ldq        == LB_struct.uses_ldq) &&
        (sb_item.uses_stq        == LB_struct.uses_stq) &&
        (sb_item.is_amo          == LB_struct.is_amo) &&
        (sb_item.is_fence        == LB_struct.is_fence) &&
        (sb_item.is_fencei       == LB_struct.is_fencei) &&
        (sb_item.mem_cmd         == LB_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == LB_struct.wakeup_delay) &&
        (sb_item.bypassable      == LB_struct.bypassable) &&
        (sb_item.is_br           == LB_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == LB_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == LB_struct.inst_unique) &&
        (sb_item.flush_on_commit == LB_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == LB_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == LB_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LB"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LB"))
end  

// LH
if (sb_item.instr & MASK_BEG_ANDI == LH) begin 
    if (
        (sb_item.uopc            == LH_struct.uopc) &&
        (sb_item.iq_type         == LH_struct.iq_type) &&
        (sb_item.fu_code         == LH_struct.fu_code) &&
        (sb_item.dst_type        == LH_struct.dst_type) &&
        (sb_item.rs1_type        == LH_struct.rs1_type) &&
        (sb_item.rs2_type        == LH_struct.rs2_type) &&
        (sb_item.frs3_en         == LH_struct.frs3_en) &&
        (sb_item.imm_sel         == LH_struct.imm_sel) &&
        (sb_item.uses_ldq        == LH_struct.uses_ldq) &&
        (sb_item.uses_stq        == LH_struct.uses_stq) &&
        (sb_item.is_amo          == LH_struct.is_amo) &&
        (sb_item.is_fence        == LH_struct.is_fence) &&
        (sb_item.is_fencei       == LH_struct.is_fencei) &&
        (sb_item.mem_cmd         == LH_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == LH_struct.wakeup_delay) &&
        (sb_item.bypassable      == LH_struct.bypassable) &&
        (sb_item.is_br           == LH_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == LH_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == LH_struct.inst_unique) &&
        (sb_item.flush_on_commit == LH_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == LH_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == LH_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LH"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LH"))
end  

// LW
else if (sb_item.instr & MASK_BEG_ANDI == LW) begin 
    if (
        (sb_item.uopc            == LW_struct.uopc) &&
        (sb_item.iq_type         == LW_struct.iq_type) &&
        (sb_item.fu_code         == LW_struct.fu_code) &&
        (sb_item.dst_type        == LW_struct.dst_type) &&
        (sb_item.rs1_type        == LW_struct.rs1_type) &&
        (sb_item.rs2_type        == LW_struct.rs2_type) &&
        (sb_item.frs3_en         == LW_struct.frs3_en) &&
        (sb_item.imm_sel         == LW_struct.imm_sel) &&
        (sb_item.uses_ldq        == LW_struct.uses_ldq) &&
        (sb_item.uses_stq        == LW_struct.uses_stq) &&
        (sb_item.is_amo          == LW_struct.is_amo) &&
        (sb_item.is_fence        == LW_struct.is_fence) &&
        (sb_item.is_fencei       == LW_struct.is_fencei) &&
        (sb_item.mem_cmd         == LW_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == LW_struct.wakeup_delay) &&
        (sb_item.bypassable      == LW_struct.bypassable) &&
        (sb_item.is_br           == LW_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == LW_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == LW_struct.inst_unique) &&
        (sb_item.flush_on_commit == LW_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == LW_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == LW_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LW"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LW"))
end  

// LBU
if (sb_item.instr & MASK_LUI_JALR == LBU) begin 
    if (
        (sb_item.uopc            == LBU_struct.uopc) &&
        (sb_item.iq_type         == LBU_struct.iq_type) &&
        (sb_item.fu_code         == LBU_struct.fu_code) &&
        (sb_item.dst_type        == LBU_struct.dst_type) &&
        (sb_item.rs1_type        == LBU_struct.rs1_type) &&
        (sb_item.rs2_type        == LBU_struct.rs2_type) &&
        (sb_item.frs3_en         == LBU_struct.frs3_en) &&
        (sb_item.imm_sel         == LBU_struct.imm_sel) &&
        (sb_item.uses_ldq        == LBU_struct.uses_ldq) &&
        (sb_item.uses_stq        == LBU_struct.uses_stq) &&
        (sb_item.is_amo          == LBU_struct.is_amo) &&
        (sb_item.is_fence        == LBU_struct.is_fence) &&
        (sb_item.is_fencei       == LBU_struct.is_fencei) &&
        (sb_item.mem_cmd         == LBU_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == LBU_struct.wakeup_delay) &&
        (sb_item.bypassable      == LBU_struct.bypassable) &&
        (sb_item.is_br           == LBU_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == LBU_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == LBU_struct.inst_unique) &&
        (sb_item.flush_on_commit == LBU_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == LBU_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == LBU_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LBU"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LBU"))
end  

// LHU
else if (sb_item.instr & MASK_BEG_ANDI == LHU) begin 
    if (
        (sb_item.uopc            == LHU_struct.uopc) &&
        (sb_item.iq_type         == LHU_struct.iq_type) &&
        (sb_item.fu_code         == LHU_struct.fu_code) &&
        (sb_item.dst_type        == LHU_struct.dst_type) &&
        (sb_item.rs1_type        == LHU_struct.rs1_type) &&
        (sb_item.rs2_type        == LHU_struct.rs2_type) &&
        (sb_item.frs3_en         == LHU_struct.frs3_en) &&
        (sb_item.imm_sel         == LHU_struct.imm_sel) &&
        (sb_item.uses_ldq        == LHU_struct.uses_ldq) &&
        (sb_item.uses_stq        == LHU_struct.uses_stq) &&
        (sb_item.is_amo          == LHU_struct.is_amo) &&
        (sb_item.is_fence        == LHU_struct.is_fence) &&
        (sb_item.is_fencei       == LHU_struct.is_fencei) &&
        (sb_item.mem_cmd         == LHU_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == LHU_struct.wakeup_delay) &&
        (sb_item.bypassable      == LHU_struct.bypassable) &&
        (sb_item.is_br           == LHU_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == LHU_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == LHU_struct.inst_unique) &&
        (sb_item.flush_on_commit == LHU_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == LHU_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == LHU_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "LHU"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "LHU"))
end  

// SB
else if (sb_item.instr & MASK_BEG_ANDI == SB) begin 
    if (
        (sb_item.uopc            == SB_struct.uopc) &&
        (sb_item.iq_type         == SB_struct.iq_type) &&
        (sb_item.fu_code         == SB_struct.fu_code) &&
        (sb_item.dst_type        == SB_struct.dst_type) &&
        (sb_item.rs1_type        == SB_struct.rs1_type) &&
        (sb_item.rs2_type        == SB_struct.rs2_type) &&
        (sb_item.frs3_en         == SB_struct.frs3_en) &&
        (sb_item.imm_sel         == SB_struct.imm_sel) &&
        (sb_item.uses_ldq        == SB_struct.uses_ldq) &&
        (sb_item.uses_stq        == SB_struct.uses_stq) &&
        (sb_item.is_amo          == SB_struct.is_amo) &&
        (sb_item.is_fence        == SB_struct.is_fence) &&
        (sb_item.is_fencei       == SB_struct.is_fencei) &&
        (sb_item.mem_cmd         == SB_struct.mem_cmd) &&
        (sb_item.wakeup_delay    == SB_struct.wakeup_delay) &&
        (sb_item.bypassable      == SB_struct.bypassable) &&
        (sb_item.is_br           == SB_struct.is_br) &&
        (sb_item.is_sys_pc2ep    == SB_struct.is_sys_pc2ep) &&
        (sb_item.inst_unique     == SB_struct.inst_unique) &&
        (sb_item.flush_on_commit == SB_struct.flush_on_commit) &&
        (sb_item.crs_cmd         == SB_struct.crs_cmd) &&
        (sb_item.uopc_sfb_active == SB_struct.uopc_sfb_active)
    )
        `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SB"), UVM_HIGH)
    else 
        `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SB"))
end  

    // SH
        else if(sb_item.instr & MASK_BEG_ANDI == SH) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SH"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SH"))
        end  
    // SW
        else if(sb_item.instr & MASK_BEG_ANDI == SW) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SW"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SW"))
        end  
    // ADDI
        else if(sb_item.instr & MASK_BEG_ANDI == ADDI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ADDI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ADDI"))
        end  


    // SLTI
        else if(sb_item.instr & MASK_BEG_ANDI == SLTI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SLTI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTI"))
        end  
    // SLTIU
        else if(sb_item.instr & MASK_BEG_ANDI == SLTIU) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SLTIU"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTIU"))
        end  
    // XORI
        else if(sb_item.instr & MASK_BEG_ANDI == XORI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "XORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "XORI"))
        end  

    //ORI
        else if(sb_item.instr & MASK_BEG_ANDI == ORI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ORI"))
        end  
    //ANDI
        else if(sb_item.instr & MASK_BEG_ANDI == ANDI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ANDI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ANDI"))
        end  




   // SLLI
        else if(sb_item.instr & MASK_SLLI_SRAI == SLLI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SLLI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLLI"))
        end  

    // SRLI
        else if(sb_item.instr & MASK_SLLI_SRAI == SRLI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SRLI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRLI"))
        end  


    // SRAI
        else if(sb_item.instr & MASK_SLLI_SRAI == SRAI) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SRAI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SRAI"))
        end  
    // ADD
        else if(sb_item.instr & MASK_ADD_AND == ADD) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SLTIU"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTIU"))
        end  
    // SUB
        else if(sb_item.instr & MASK_ADD_AND == SUB) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "XORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "XORI"))
        end  

    //SLL
        else if(sb_item.instr & MASK_ADD_AND == SLL) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ORI"))
        end  
    //SLT
        else if(sb_item.instr & MASK_ADD_AND == SLT) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ANDI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ANDI"))
        end  

    // SLTU
        else if(sb_item.instr & MASK_ADD_AND == SLTU) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "SLTIU"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "SLTIU"))
        end  
    // XOR
        else if(sb_item.instr & MASK_ADD_AND == XOR) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "XORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "XORI"))
        end  

    //SRL
        else if(sb_item.instr & MASK_ADD_AND == SRL) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ORI"))
        end  
    //SRA
        else if(sb_item.instr & MASK_ADD_AND == SRA) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ANDI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ANDI"))
        end  


    //OR
        else if(sb_item.instr & MASK_ADD_AND == OR) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ORI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ORI"))
        end  
    //AND
        else if(sb_item.instr & MASK_ADD_AND == AND) begin 
            if (
                (sb_item.uopc            == LUI_struct.uopc) &&
                (sb_item.iq_type         == LUI_struct.iq_type) &&
                (sb_item.fu_code         == LUI_struct.fu_code) &&
                (sb_item.dst_type        == LUI_struct.dst_type) &&
                (sb_item.rs1_type        == LUI_struct.rs1_type) &&
                (sb_item.rs2_type        == LUI_struct.rs2_type) &&
                (sb_item.frs3_en         == LUI_struct.frs3_en) &&
                (sb_item.imm_sel         == LUI_struct.imm_sel) &&
                (sb_item.uses_ldq        == LUI_struct.uses_ldq) &&
                (sb_item.uses_stq        == LUI_struct.uses_stq) &&
                (sb_item.is_amo          == LUI_struct.is_amo) &&
                (sb_item.is_fence        == LUI_struct.is_fence) &&
                (sb_item.is_fencei       == LUI_struct.is_fencei) &&
                (sb_item.mem_cmd         == LUI_struct.mem_cmd) &&
                (sb_item.wakeup_delay    == LUI_struct.wakeup_delay) &&
                (sb_item.bypassable      == LUI_struct.bypassable) &&
                (sb_item.is_br           == LUI_struct.is_br) &&
                (sb_item.is_sys_pc2ep    == LUI_struct.is_sys_pc2ep) &&
                (sb_item.inst_unique     == LUI_struct.inst_unique) &&
                (sb_item.flush_on_commit == LUI_struct.flush_on_commit) &&
                (sb_item.crs_cmd         == LUI_struct.crs_cmd) &&
                (sb_item.uopc_sfb_active == LUI_struct.uopc_sfb_active)
                `uvm_info("SCBD", $sformatf("SUCCESS! Decode successfully with %s !", "ANDI"), UVM_HIGH)
            )
            else 
                `uvm_error("SCBD", $sformatf("ERROR ! Failed to decode the following instruction: %s", "ANDI"))
        end  
    endfunction 

endclass 