// `define str_indx 0  // RV32I
// `define ed_indx  39 
// `define str_indx 40 // RV64I
// `define ed_indx  54 
// `define str_indx 55 // RV32M
// `define ed_indx  62 
// `define str_indx 63 // RV64M
// `define ed_indx  67 
// `define str_indx 68 // RV32A
// `define ed_indx  78 
// `define str_indx 79 // RV64A
// `define ed_indx  89 

// `define str_indx 90 // RVCSR
// `define ed_indx  95 

// `define str_indx 96  // RV32F
// `define ed_indx  121  
// `define str_indx 122 // RV64F
// `define ed_indx  125 
// `define str_indx 126 // RV32D
// `define ed_indx  151 
`define str_indx 152 // RV64D
`define ed_indx  157 




import package_decode::*;

bit [31:0] instr_op;

    covergroup cv_gr_RV ( int index) with function sample(bit [31:0] instr_val);
      option.per_instance = 1;
       type_option.merge_instances = 0;
    coverpoint instr_val {
        bins single_bin = { OPCODES[index] };
    }
    endgroup
    

class coverage extends uvm_subscriber #(item);
  `uvm_component_utils(coverage)

  cv_gr_RV arr_cv_gr_RV [158];
    
  function new(string name="coverage", uvm_component parent=null);
    int i; 
    super.new(name, parent);
    
    for (i = `str_indx; i <= `ed_indx; i++) begin
      arr_cv_gr_RV[i] = new(i);
    end
  endfunction

  function void write(item t);
    bit [31:0] instrc; 
    int i;             
    instrc = t.instr; 

    for (i = `str_indx; i <= `ed_indx  ; i++) begin
      instr_op = (instrc & MASKS[i]);
      arr_cv_gr_RV[i].sample((instrc & MASKS[i]));
    //  `uvm_info("WRITE",$sformatf("instr_op = %h index i = %d",instr_op, i), UVM_HIGH) 

    end
  endfunction

  function void extract_phase(uvm_phase phase);
    real cov;               
    real overall_coverage; 
    int  num_bins_hit;      
    int  i;                 

    super.extract_phase(phase); 

    num_bins_hit = 0;
    for (i = `str_indx; i <= `ed_indx; i++) begin
        cov = arr_cv_gr_RV[i].get_inst_coverage();
        if (cov >= 100.0) num_bins_hit++;
        `uvm_info("COVERAGE_REPORT",
                    $sformatf("cv_gr_RV[%0d] coverage: %0.2f%%", i, cov),
                    UVM_HIGH)
    end

    overall_coverage = (num_bins_hit * 100.0) / (`ed_indx -`str_indx + 1);
    `uvm_info("COVERAGE_REPORT",
              $sformatf("Overall coverage: %0.2f%% (%0d/%0d bins hit)",
                        overall_coverage, num_bins_hit,  (`ed_indx -`str_indx + 1)),
              UVM_HIGH)
  endfunction

  function void report_phase(uvm_phase phase);
    super.report_phase(phase);
  endfunction
endclass


