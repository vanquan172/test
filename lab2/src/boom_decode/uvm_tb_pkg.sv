package uvm_tb_pkg;
  // Import UVM
  import uvm_pkg::*;
  `include "uvm_macros.svh"

  // Include tất cả các file class UVM

  `include "item.sv"
  `include "sequence.sv"
  `include "driver.sv"
  `include "monitor.sv"
  `include "coverage.sv"
  `include "scoreboard.sv"
  `include "agent.sv"
  `include "env.sv"
  `include "base_test.sv"
  `include "test_RV32I.sv"
  `include "test_RV64I.sv"
  `include "test_RV32M.sv"
  `include "test_RV64M.sv"
  `include "test_RV32A.sv"
  `include "test_RV64A.sv"

  `include "test_RVCSR.sv"
  `include "test_RV32F.sv"
  `include "test_RV64F.sv"
  `include "test_RV32D.sv"
  `include "test_RV64D.sv"

endpackage
