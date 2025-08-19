// @author: hungnc5

  import uvm_pkg::*;
  `include "uvm_macros.svh"
  import uvm_tb_pkg::*;

module tb;
  reg clk;
  
  always #10 clk =~ clk;
  decode_if vif (clk);
	
	DecodeUnit u0(
         // Input signals to DUT
  .io_enq_uop_inst              (vif.instr),
  .io_enq_uop_is_sfb            (0),
  .io_enq_uop_xcpt_pf_if        (vif.io_enq_uop_xcpt_pf_if),
  .io_enq_uop_xcpt_ae_if        (vif.io_enq_uop_xcpt_ae_if),
  .io_enq_uop_bp_debug_if       (vif.io_enq_uop_bp_debug_if),
  .io_enq_uop_bp_xcpt_if        (vif.io_enq_uop_bp_xcpt_if),
  .io_interrupt                 (vif.io_interrupt),
  .io_interrupt_cause           (vif.io_interrupt_cause),
  .io_csr_decode_fp_illegal     (vif.io_csr_decode_fp_illegal),
  .io_csr_decode_read_illegal   (vif.io_csr_decode_read_illegal),
  .io_csr_decode_write_illegal  (vif.io_csr_decode_write_illegal),
  .io_csr_decode_write_flush    (vif.io_csr_decode_write_flush),
  .io_csr_decode_system_illegal (vif.io_csr_decode_system_illegal),

  // Output signals from DUT
  .io_deq_uop_uopc              (vif.uopc),

  .io_deq_uop_debug_inst        (vif.out_instr),
  .io_deq_uop_is_sfb            (vif.io_deq_uop_is_sfb),
  
  .io_deq_uop_iq_type           (vif.iq_type),
  .io_deq_uop_is_br             (vif.is_br),
  .io_deq_uop_bypassable        (vif.bypassable),
  .io_deq_uop_mem_cmd           (vif.mem_cmd),
  .io_deq_uop_is_fence          (vif.is_fence),
  .io_deq_uop_is_fencei         (vif.is_fencei),
  .io_deq_uop_is_amo            (vif.is_amo),
  .io_deq_uop_uses_ldq          (vif.uses_ldq),
  .io_deq_uop_uses_stq          (vif.uses_stq),
  .io_deq_uop_flush_on_commit   (vif.flush_on_commit),
  .io_deq_uop_fu_code           (vif.fu_code),
  .io_deq_uop_is_jalr           (vif.is_jalr),
  .io_deq_uop_is_jal            (vif.is_jal),
  .io_deq_uop_imm_packed        (vif.imm_packed),
  .io_deq_uop_ldst              (vif.ldst),
  .io_deq_uop_lrs1              (vif.lrs1),
  .io_deq_uop_lrs2              (vif.lrs2),
  .io_deq_uop_lrs3              (vif.lrs3),
  .io_deq_uop_is_unique         (vif.is_unique),
  .io_deq_uop_is_sys_pc2epc     (vif.is_sys_pc2epc),
  .io_deq_uop_ldst_is_rs1       (vif.ldst_is_rs1),
  .io_deq_uop_ldst_val          (vif.ldst_val),
  .io_deq_uop_dst_rtype         (vif.dst_rtype),
  .io_deq_uop_lrs1_rtype        (vif.lrs1_rtype),
  .io_deq_uop_lrs2_rtype        (vif.lrs2_rtype),
  .io_deq_uop_frs3_en           (vif.frs3_en),
  .io_deq_uop_fp_val            (vif.fp_val),
  .io_deq_uop_mem_size          (vif.mem_size),
  .io_deq_uop_mem_signed        (vif.mem_signed),
  .io_deq_uop_exception         (vif.exception),
  .io_deq_uop_exc_cause         (vif.exc_cause)
 
    );
  
  initial begin
    clk <= 0;
    uvm_config_db#(virtual decode_if.MON)::set(uvm_root::get(), "*", "decode_if_MON", vif);
    uvm_config_db#(virtual decode_if.DRV)::set(uvm_root::get(), "*", "decode_if_DRV", vif);
    run_test("test_RV64D");
  end

  // initial begin
  //   $vcdplusfile("wave_wave.vpd");
  //   $vcdpluson();
  // end
endmodule
