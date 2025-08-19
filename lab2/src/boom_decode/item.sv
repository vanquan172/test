// @author: hungnc5
import package_decode::*;

class item extends uvm_sequence_item;
    `uvm_object_utils(item)

    // this is for monitor
    bit rstn;
    bit [31:0] instr; 
    bit [31:0] out_instr;
    bit [2:0] iq_type;
    bit is_br;
    bit bypassable;
    bit [4:0] mem_cmd;
    bit is_fence;
    bit is_fencei;
    bit is_amo;
    bit uses_ldq;
    bit uses_stq;
    bit flush_on_commit;
    bit [6:0] uopc;
    bit [9:0] fu_code;
    bit is_jalr;
    bit is_jal;
    bit [19:0] imm_packed;
    bit [5:0] ldst;
    bit [5:0] lrs1;
    bit [5:0] lrs2;
    bit [5:0] lrs3;
    bit is_unique;
    bit is_sys_pc2epc;
    bit ldst_is_rs1;
    bit ldst_val;
    bit [1:0] dst_rtype;
    bit [1:0] lrs1_rtype;
    bit [1:0] lrs2_rtype;
    bit frs3_en;
    bit fp_val;
    bit [1:0] mem_size;
    bit mem_signed;
    bit exception;

    rand bit io_enq_uop_is_sfb;
    bit      io_deq_uop_is_sfb;

    rand bit [63:0] io_interrupt_cause;
    rand bit io_interrupt;

    rand bit io_csr_decode_fp_illegal;
    rand bit io_csr_decode_read_illegal;
    rand bit io_csr_decode_write_illegal;
    rand bit io_csr_decode_write_flush;
    rand bit io_csr_decode_system_illegal;

    rand bit io_enq_uop_xcpt_pf_if;
    rand bit io_enq_uop_xcpt_ae_if;
    rand bit io_enq_uop_bp_debug_if;
    rand bit io_enq_uop_bp_xcpt_if;

    bit [63:0] exc_cause;

    rand bit [31:0] true_random_instr; 

    // random val
        // extension
        rand bit [3:0] extension;
        // rs1, rs2, rd
        rand bit [4:0] rs1; // value from 0 to 31
        rand bit [4:0] rs2; // value from 0 to 31
        rand bit [4:0] rs3; // value from 0 to 31
        rand bit [4:0] rd ; // value from 0 to 31
        // RV32I Base Instruction
            // Types
            rand bit [3:0] RV32I_type;
            // R-Type
            rand bit [6:0] RV32I_RType_opcode;
            rand bit [2:0] RV32I_RType_funct3;
            rand bit [6:0] RV32I_RType_funct7;
            // I-Type
            rand bit [6:0] RV32I_IType_opcode;
            rand bit [2:0] RV32I_IType_funct3;
            rand bit [4:0] RV32I_IType_rs1;
            rand bit [4:0] RV32I_IType_rd;
            rand bit [11:0] RV32I_IType_imm;
            // S-Type
            rand bit [6:0] RV32I_SType_opcode;
            rand bit [2:0] RV32I_SType_funct3;
            rand bit [11:0] RV32I_SType_imm;
            // B-Type
            rand bit [6:0] RV32I_BType_opcode;
            rand bit [2:0] RV32I_BType_funct3;
            rand bit [12:0] RV32I_BType_imm;
            // U-Type
            rand bit [6:0] RV32I_UType_opcode;
            rand bit [31:12] RV32I_UType_imm;
            // J-Type
            rand bit [6:0] RV32I_JType_opcode;
            rand bit [20:1] RV32I_JType_imm;
            // FENCE
            rand bit [3:0] RV32I_FENCE_fm;
            rand bit [3:0] RV32I_FENCE_pred;
            rand bit [3:0] RV32I_FENCE_succ;
            rand bit [6:0] RV32I_FENCE_opcode;
            rand bit [4:0] RV32I_FENCE_rs1;
            rand bit [4:0] RV32I_FENCE_rd;
            rand bit [2:0] RV32I_FENCE_funct3;

            // ECALL_BREAK
            rand bit [11:0] RV32I_ENVIR_funct12; 
            rand bit [2:0] RV32I_ENVIR_funct3; 
            rand bit [6:0] RV32I_ENVIR_opcode;
            rand bit [4:0] RV32I_ENVIR_rs1;
            rand bit [4:0] RV32I_ENVIR_rd;


        // RV64I Base instruction
            // Types
            rand bit [2:0] RV64I_type;
            // R-Type
            rand bit [6:0] RV64I_RType_opcode_I;
            rand bit [6:0] RV64I_RType_opcode_W;
            rand bit [2:0] RV64I_RType_funct3;
            rand bit [5:0] RV64I_RType_funct7_I;
            rand bit [6:0] RV64I_RType_funct7_W;
            rand bit [5:0] RV64I_RType_shamt_I;
            rand bit [4:0] RV64I_RType_shamt_W;
            // I-Type
            rand bit [6:0] RV64I_IType_opcode;
            rand bit [2:0] RV64I_IType_funct3;
            rand bit [11:0] RV64I_IType_imm;
            // S-Type
            rand bit [6:0] RV64I_SType_opcode;
            rand bit [2:0] RV64I_SType_funct3;
            rand bit [11:0] RV64I_SType_imm;
        // RV32M Base instruction
            // R-Type
            rand bit [6:0] RV32M_opcode;
            rand bit [2:0] RV32M_funct3;
            rand bit [4:0] RV32M_funct7;
         // RV64M Base instruction
            // R-Type
            rand bit [6:0] RV64M_opcode;
            rand bit [2:0] RV64M_funct3;
            rand bit [4:0] RV64M_funct7; 
        // RV32A Base instruction 
            rand bit [6:0] RV32A_opcode; 
            rand bit [2:0] RV32A_funct3; 
            rand bit [4:0] RV32A_funct7; 
            rand bit [4:0] RV32A_rs1; 
            rand bit [4:0] RV32A_rs2; 
            rand bit [4:0] RV32A_rd; 
            rand bit  RV32A_aq; 
            rand bit  RV32A_rl; 
        // RV64A Base instruction 
            rand bit [6:0] RV64A_opcode; 
            rand bit [2:0] RV64A_funct3; 
            rand bit [4:0] RV64A_funct7; 
            rand bit [4:0] RV64A_rs1; 
            rand bit [4:0] RV64A_rs2; 
            rand bit [4:0] RV64A_rd; 
            rand bit  RV64A_aq; 
            rand bit  RV64A_rl; 
        // RVCRS
            rand bit [6:0] RVCSR_opcode; 
            rand bit [2:0] RVCSR_funct3; 
            rand bit [11:0] RVCSR_csr; 
            rand bit [4:0] RVCSR_rs1; 
            rand bit [4:0] RVCSR_rd; 
        // RV32F
            rand bit [1:0] RV32F_type; 
            rand bit [6:0] RV32F_LSType_opcode; 
            rand bit [11:0] RV32F_LSType_imm; 
            rand bit [4:0] RV32F_LSType_rs1; 
            rand bit [4:0] RV32F_LSType_rs2; 
            rand bit [4:0] RV32F_LSType_rd; 
            rand bit [2:0] RV32F_LSType_wid; 

            rand bit [6:0] RV32F_R4Type_opcode; 
            rand bit [1:0] RV32F_R4Type_fmt; 
            rand bit [4:0] RV32F_R4Type_rs1; 
            rand bit [4:0] RV32F_R4Type_rs2; 
            rand bit [4:0] RV32F_R4Type_rs3; 
            rand bit [4:0] RV32F_R4Type_rd; 
            rand bit [2:0] RV32F_R4Type_rm; 

            rand bit [6:0] RV32F_RType_opcode; 
            rand bit [1:0] RV32F_RType_fmt; 
            rand bit [4:0] RV32F_RType_rs1; 
            rand bit [4:0] RV32F_RType_rs2; 
            rand bit [4:0] RV32F_RType_funct5; 
            rand bit [4:0] RV32F_RType_rd; 
            rand bit [2:0] RV32F_RType_rm;            

        // RV64F
            rand bit [6:0] RV64F_RType_opcode; 
            rand bit [1:0] RV64F_RType_fmt; 
            rand bit [4:0] RV64F_RType_rs1; 
            rand bit [4:0] RV64F_RType_rs2; 
            rand bit [4:0] RV64F_RType_funct5; 
            rand bit [4:0] RV64F_RType_rd; 
            rand bit [2:0] RV64F_RType_rm;   

        // RV32D
            rand bit [1:0] RV32D_type; 
            rand bit [6:0] RV32D_LSType_opcode; 
            rand bit [11:0] RV32D_LSType_imm; 
            rand bit [4:0] RV32D_LSType_rs1; 
            rand bit [4:0] RV32D_LSType_rs2; 
            rand bit [4:0] RV32D_LSType_rd; 
            rand bit [2:0] RV32D_LSType_wid; 

            rand bit [6:0] RV32D_R4Type_opcode; 
            rand bit [1:0] RV32D_R4Type_fmt; 
            rand bit [4:0] RV32D_R4Type_rs1; 
            rand bit [4:0] RV32D_R4Type_rs2; 
            rand bit [4:0] RV32D_R4Type_rs3; 
            rand bit [4:0] RV32D_R4Type_rd; 
            rand bit [2:0] RV32D_R4Type_rm; 

            rand bit [6:0] RV32D_RType_opcode; 
            rand bit [1:0] RV32D_RType_fmt; 
            rand bit [4:0] RV32D_RType_rs1; 
            rand bit [4:0] RV32D_RType_rs2; 
            rand bit [4:0] RV32D_RType_funct5; 
            rand bit [4:0] RV32D_RType_rd; 
            rand bit [2:0] RV32D_RType_rm;            

        // RV64D
            rand bit [6:0] RV64D_RType_opcode; 
            rand bit [1:0] RV64D_RType_fmt; 
            rand bit [4:0] RV64D_RType_rs1; 
            rand bit [4:0] RV64D_RType_rs2; 
            rand bit [4:0] RV64D_RType_funct5; 
            rand bit [4:0] RV64D_RType_rd; 
            rand bit [2:0] RV64D_RType_rm;  
    function new(string name = "item");
        super.new(name);
    endfunction

    // constraint hierarchy
        // extension
            constraint solve_extension { solve extension before RV32I_type,
                                                                RV64I_type,
                                                                RV32M_opcode,
                                                                RV64M_opcode, 
                                                                RV32A_opcode,
                                                                RV64A_opcode,
                                                                RVCSR_opcode,
                                                                RV32F_type,
                                                                RV64F_RType_opcode,
                                                                RV32D_type,
                                                                RV64D_RType_opcode;
            }

        // RV32I_Type
            constraint solve_RV32I_type { solve RV32I_type before RV32I_RType_opcode, 
                                                                  RV32I_IType_opcode,
                                                                  RV32I_SType_opcode,
                                                                  RV32I_BType_opcode,
                                                                  RV32I_UType_opcode,
                                                                  RV32I_JType_opcode,
                                                                  RV32I_FENCE_opcode,
                                                                  RV32I_ENVIR_opcode;
            }

            constraint solve_RV32I_RType_opcode { solve  RV32I_RType_opcode before RV32I_RType_funct3, 
                                                                                   RV32I_RType_funct7;
                                                                                   
            }
            constraint solve_RV32I_IType_opcode { solve  RV32I_IType_opcode before RV32I_IType_funct3; 
                                                                             
            }
            constraint solve_RV32I_SType_opcode { solve  RV32I_SType_opcode before RV32I_SType_funct3;
            }

            constraint solve_RV32I_BType_opcode { solve  RV32I_BType_opcode before RV32I_BType_funct3;  
                                                                             
            }
            constraint solve_FENCE_fm { solve  RV32I_FENCE_fm before RV32I_FENCE_pred , RV32I_FENCE_succ;  
                                                                             
            }
            //....//

        // RV64I_Type
            constraint solve_RV64I_type { solve RV64I_type before RV64I_RType_opcode_I,
                                                                  RV64I_RType_opcode_W,
                                                                  RV64I_IType_opcode,                                                        
                                                                  RV64I_SType_opcode;                                                        
            } 
            constraint solve_RV64I_RType_opcode { solve  RV64I_RType_opcode_I, RV64I_RType_opcode_W before RV64I_RType_funct3, 
                                                                                   RV64I_RType_funct7_I,
                                                                                   RV64I_RType_funct7_W;
                                                                                   
            }
            constraint solve_RV64I_IType_opcode { solve  RV64I_IType_opcode before RV64I_IType_funct3; 
                                                                             
            }
            constraint solve_RV64I_SType_opcode { solve  RV64I_SType_opcode before RV64I_SType_funct3;
            }
        // RV32M
            constraint solve_RV32M_opcode { solve RV32M_opcode before RV32M_funct3, 
                                                                       RV32M_funct7; 
            }  
        // RV64M
            constraint solve_RV64M_opcode { solve RV64M_opcode before RV64M_funct3, 
                                                                      RV64M_funct7; 
            } 
        // RV32A
            constraint c_RV32A_funct7_rs2{
                solve RV32A_funct7 before RV32A_rs2;
            }
        // RV64A
            constraint c_RV64A_funct7_rs2{
                solve RV64A_funct7 before RV64A_rs2;
            }
        // RV32F
            constraint c_RV32F_Type_opcode{
                solve RV32F_type before RV32F_LSType_opcode,
                                        RV32F_R4Type_opcode,
                                        RV32F_RType_opcode; 
            }
            constraint c_RV32F_funct5_rs2_rm{
                solve RV32F_RType_funct5 before RV32F_RType_rs2,
                                                RV32F_RType_rm;
            }
        // RV64F
            constraint c_RV64F_funct5_rs2_rm{
                solve RV64F_RType_funct5 before RV64F_RType_rs2;
            }
        // RV32D
            constraint c_RV32D_Type_opcode{
                solve RV32D_type before RV32D_LSType_opcode,
                                        RV32D_R4Type_opcode,
                                        RV32D_RType_opcode; 
            }
            constraint c_RV32D_funct5_rs2_rm{
                solve RV32D_RType_fmt before RV32D_RType_funct5; 
                solve RV32D_RType_funct5 before RV32D_RType_rs2,
                                                RV32D_RType_rm;
            }
            
        // RV64D
            constraint c_RV64D_funct5_rs2_rm{
                solve RV64D_RType_funct5 before RV64D_RType_rs2,
                                                RV64D_RType_rm;
            } 
    

    // constraint
        // extension
            constraint c_extension {  extension inside { 
                                                        RV32I,
                                                        RV64I,
                                                        RV32M,
                                                        RV64M,
                                                        RV32A,
                                                        RV64A,   
                                                        RVCSR,   
                                                        RV32F,  
                                                        RV64F,   
                                                        RV32D,   
                                                        RV64D   
                                                              };
            }


        // RV32I_type
            // Intruction Type

            constraint EX_RVType {
                if(extension == RV32I) {
                    RV32I_type inside {RV32I_RType, RV32I_IType, RV32I_SType, RV32I_BType, RV32I_UType, RV32I_JType,
                                        RV32I_FENCE_Type, RV32I_ENVIR_Type};
                    //RV32I_type inside {RV32I_BType};
                }
                else if(extension == RV64I){
                    RV64I_type inside {RV64I_IType, RV64I_SType, RV64I_RType_I, RV64I_RType_W}; 
                }
                else if(extension == RV32M) {
                    RV32M_opcode == 7'b0110011; 
                }
                else if(extension == RV64M) {
                    RV64M_opcode == 7'b0111011; 
                }    
                else if(extension == RV32A) {
                    RV32A_opcode == 7'b0101111; 
                }
                else if(extension == RV64A) {
                    RV64A_opcode == 7'b0101111; 
                }
                else if(extension == RVCSR) {
                    RVCSR_opcode == 7'b1110011; 
                }               
                else if(extension == RV32F) {
                    RV32F_type inside {RV32F_LSType, RV32F_R4Type, RV32F_RType};  
                }
                else if(extension == RV64F) {
                    RV64F_RType_opcode == 7'b1010011; 
                }    

                else if(extension == RV32D) {
                    RV32D_type inside {RV32D_LSType, RV32D_R4Type, RV32D_RType};  
                }
                else if(extension == RV64D) {
                    RV64D_RType_opcode == 7'b1010011; 
                }               
            }
            constraint c_RV32IType_OPCODEType{
                (RV32I_type == RV32I_RType) -> RV32I_RType_opcode inside {7'b0010011, 7'b0110011};
                (RV32I_type == RV32I_IType) -> RV32I_IType_opcode inside {7'b1100111, 7'b0000011,7'b0010011};
                (RV32I_type == RV32I_SType) -> RV32I_SType_opcode inside {7'b0100011};
                (RV32I_type == RV32I_BType) -> RV32I_BType_opcode inside {7'b1100011};
                (RV32I_type == RV32I_UType) -> RV32I_UType_opcode inside {7'b0110111, 7'b0010111};
                (RV32I_type == RV32I_JType) -> RV32I_JType_opcode inside {7'b1101111};
                (RV32I_type == RV32I_FENCE_Type) -> RV32I_FENCE_opcode inside {7'b0001111};
                (RV32I_type == RV32I_ENVIR_Type) -> RV32I_ENVIR_opcode inside {7'b1110011};
                
            }
            // R-Type
            constraint c_RV32I_RType_funct {
                if(RV32I_RType_opcode == 7'b0010011){
                    RV32I_RType_funct3 inside {3'b001, 3'b101};
                    (RV32I_RType_funct3 == 3'b001) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b101) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                }
                else if(RV32I_RType_opcode == 7'b0110011){
                    RV32I_RType_funct3 inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
                    (RV32I_RType_funct3 == 3'b000) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                    (RV32I_RType_funct3 == 3'b001) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b010) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b011) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b100) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b101) -> RV32I_RType_funct7 inside {7'b0000000, 7'b0100000};
                    (RV32I_RType_funct3 == 3'b110) -> RV32I_RType_funct7 == 7'b0000000;
                    (RV32I_RType_funct3 == 3'b111) -> RV32I_RType_funct7 == 7'b0000000;
                }
            }

            constraint c_RV32I_IType_funct {
                if(RV32I_IType_opcode == 7'b1100111){
                    RV32I_IType_funct3 == 3'b000;
                }
                else if(RV32I_IType_opcode == 7'b0000011){
                    RV32I_IType_funct3 inside {3'b000, 3'b001, 3'b010, 3'b100, 3'b101};
                }
                else if (RV32I_IType_opcode == 7'b0010011){
                    RV32I_IType_funct3 inside {3'b000, 3'b010, 3'b011, 3'b100, 3'b110, 3'b111};
                }
            }

            constraint c_RV32I_SType_funct {
                if(RV32I_SType_opcode == 7'b0100011){
                    RV32I_SType_funct3 inside {3'b000, 3'b001, 3'b010};
                }
            }            

            constraint c_RV32I_BType_funct {
                if(RV32I_BType_opcode == 7'b1100011){
                    RV32I_BType_funct3 inside {3'b000, 3'b001, 3'b100, 3'b101, 3'b110, 3'b111};
                }
            } 
            constraint c_FENCE_ {
                RV32I_FENCE_fm inside {4'b0000, 4'b1000};
                RV32I_FENCE_rs1 == 5'b00000; 
                RV32I_FENCE_rd == 5'b00000; 
                RV32I_FENCE_funct3 == 3'b000; 
            } 
            constraint c_FENCE_pred_succ {
                if(RV32I_FENCE_fm == 4'b0000) {
                    RV32I_FENCE_pred inside {[0:15]}; 
                    RV32I_FENCE_succ inside {[0:15]}; 
                }
                else if(RV32I_FENCE_fm == 4'b1000) {
                    RV32I_FENCE_pred inside {4'b0011}; 
                    RV32I_FENCE_succ inside {4'b0011}; 
                }
            }     
            constraint c_ENVIR_ {
                RV32I_ENVIR_funct12 inside {12'b0000_0000_0000, 12'b0000_0000_0001};
                RV32I_ENVIR_funct3 inside {3'b000};
                RV32I_ENVIR_rs1 == 5'b00000; 
                RV32I_ENVIR_rd == 5'b00000; 
            }        

        // RV64I-Type
            constraint c_RV64Type_OPCODEType{
                (RV64I_type == RV64I_RType_I) -> RV64I_RType_opcode_I inside {7'b0010011};
                (RV64I_type == RV64I_RType_W) -> RV64I_RType_opcode_W inside {7'b0011011,7'b0111011};
                (RV64I_type == RV64I_IType) -> RV64I_IType_opcode inside {7'b0000011, 7'b0011011};
                (RV64I_type == RV64I_SType) -> RV64I_SType_opcode inside {7'b0100011};
                
            }
            
            // constraint c_RV64I_RType_types {
            //     RV64I_RType_types inside  {RV64I_RType_I, RV64I_RType_W}; 
            // }
            constraint c_RV64I_RType_I_funct {
                if(RV64I_RType_opcode_I == 7'b0010011){
                    RV64I_RType_funct3 inside {3'b001, 3'b101};
                    (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_I == 6'b000000;
                    (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_I inside {6'b000000, 6'b010000};
                }
            }


            constraint c_RV64I_RType_W_funct {
                    if(RV64I_RType_opcode_W == 7'b0011011){
                        RV64I_RType_funct3 inside {3'b001,3'b101};
                        (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_W inside {7'b0000000};
                        (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                    }
                    else if(RV64I_RType_opcode_W == 7'b0111011){
                        RV64I_RType_funct3 inside {3'b000,3'b001,3'b101};
                        (RV64I_RType_funct3 == 3'b000) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                        (RV64I_RType_funct3 == 3'b001) -> RV64I_RType_funct7_W inside {7'b0000000};
                        (RV64I_RType_funct3 == 3'b101) -> RV64I_RType_funct7_W inside {7'b0000000, 7'b0100000};
                    }
            }

            constraint c_RV64I_IType_funct {
                if(RV64I_IType_opcode == 7'b0000011){
                    RV64I_IType_funct3 inside {3'b110, 3'b011};
                }
                else if(RV64I_IType_opcode == 7'b0011011){
                    RV64I_IType_funct3 inside {3'b000};
                }
            }
            constraint c_RV64I_SType_funct {
                    RV64I_SType_funct3 inside {3'b011};
            }
        // RV32M
            constraint c_RV32M {
            //    RV32M_opcode == 7'b0110011; 
                RV32M_funct3 inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b101, 3'b110, 3'b111};
                RV32M_funct7 == 7'b0000001;
            }
        // RV64M
            constraint c_RV64M {
            //    RV64M_opcode == 7'b0111011; 
                RV64M_funct3 inside {3'b000, 3'b100, 3'b101, 3'b110, 3'b111};
                RV64M_funct7 == 7'b0000001;
            }
        // RV32A
            constraint c_RV32A {
                RV32A_funct3 inside {3'b010};
                RV32A_funct7 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b01100, 5'b01000, 5'b10000, 5'b10100, 5'b11000, 5'b11100};
                (RV32A_funct7 == 5'b00010) -> RV32A_rs2 == 5'b00000; 
            }
        // RV64A
            constraint c_RV64A {
                RV64A_funct3 inside {3'b011};
                RV64A_funct7 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b01100, 5'b01000, 5'b10000, 5'b10100, 5'b11000, 5'b11100};
                (RV64A_funct7 == 5'b00010) -> RV64A_rs2 == 5'b00000; 
            }
        // RVCRS
            constraint c_RVCSR {
                RVCSR_funct3 inside {3'b001, 3'b010, 3'b011, 3'b101, 3'b110, 3'b111};
            }
        // RV32F
            constraint c_RV32FType_OPCODEType{
                (RV32F_type == RV32F_LSType) -> RV32F_LSType_opcode inside {7'b0000111, 7'b0100111};
                (RV32F_type == RV32F_R4Type) -> RV32F_R4Type_opcode inside {7'b1000011, 7'b1000111,7'b1001011,7'b1001111};
                (RV32F_type == RV32F_RType) -> RV32F_RType_opcode inside {7'b1010011};
                
            }
            constraint c_RV32F_LS_Type{
                RV32F_LSType_wid == 3'b010; 
            }

            constraint c_RV32F_R4_Type{
                RV32F_R4Type_fmt == 2'b00; 
                RV32F_R4Type_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 
            }
            constraint c_RV32F_R_Type{
                RV32F_RType_fmt == 2'b00; 
                RV32F_RType_funct5 inside{5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b00101, 
                                            5'b01011, 5'b10100, 5'b11000, 5'b11010, 5'b11100, 5'b11110}; 
                
                if (RV32F_RType_funct5 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b01011, 5'b11000, 5'b11010}){
                    RV32F_RType_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 
                }
                else {
                    (RV32F_RType_funct5 == 5'b00100) -> RV32F_RType_rm inside{3'b000, 3'b001, 3'b010};     
                    (RV32F_RType_funct5 == 5'b00101) -> RV32F_RType_rm inside{3'b000, 3'b001};     
                    (RV32F_RType_funct5 == 5'b11100) -> RV32F_RType_rm inside{3'b000,3'b001};     
                    (RV32F_RType_funct5 == 5'b00101) -> RV32F_RType_rm inside{3'b000, 3'b001};     
                    (RV32F_RType_funct5 == 5'b10100) -> RV32F_RType_rm inside{3'b000, 3'b001, 3'b010};     
//                    (RV32F_RType_funct5 == 5'b11100) -> RV32F_RType_rm inside{3'b001};     
                    (RV32F_RType_funct5 == 5'b11110) -> RV32F_RType_rm inside{3'b000};     

                }
                if (RV32F_RType_funct5 inside {5'b01011, 5'b11100,  5'b11110}){
                    RV32F_RType_rs2 inside {5'b00000}; 
                }
                else if (RV32F_RType_funct5 inside {5'b11000, 5'b11010}) {
                    RV32F_RType_rs2 inside {5'b00001, 5'b00000}; 
                }
            }
        // RV64F
            constraint c_RV64F_R_Type{
                RV64F_RType_fmt == 2'b00; 
                RV64F_RType_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 

                RV64F_RType_funct5 inside{5'b11000, 5'b11010 }; 
                
                if (RV64F_RType_funct5 == 5'b11000){
                    RV64F_RType_rs2 inside {5'b00010, 5'b00011}; 
                }
                else if(RV64F_RType_funct5 == 5'b11010) {
                    RV64F_RType_rs2 inside {5'b00010, 5'b00011}; 
                }
            }

        // RV32D
            constraint c_RV32DType_OPCODEType{
                (RV32D_type == RV32D_LSType) -> RV32D_LSType_opcode inside {7'b0000111, 7'b0100111};
                (RV32D_type == RV32D_R4Type) -> RV32D_R4Type_opcode inside {7'b1000011, 7'b1000111,7'b1001011,7'b1001111};
                (RV32D_type == RV32D_RType) -> RV32D_RType_opcode inside {7'b1010011};
                
            }
            constraint c_RV32D_LS_Type{
                RV32D_LSType_wid == 3'b011; 
            }

            constraint c_RV32D_R4_Type{
                RV32D_R4Type_fmt == 2'b01; 
                RV32D_R4Type_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 
            }
            constraint c_RV32D_R_Type{
                RV32D_RType_fmt inside {2'b01, 2'b00}; 
                if(RV32D_RType_fmt == 2'b00){
                    RV32D_RType_funct5 == 5'b01000;
                }
                else {
                    RV32D_RType_funct5 inside{5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b00100, 5'b00101, 5'b01011, 
                                            5'b01000, 5'b10100, 5'b11100, 5'b11000, 5'b11010}; 
                }


                if (RV32D_RType_funct5 inside {5'b00000, 5'b00001, 5'b00010, 5'b00011, 5'b01011, 5'b01000, 5'b11000, 5'b11010}){
                    RV32D_RType_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 
                }
                else {
                    (RV32D_RType_funct5 == 5'b00100) -> RV32D_RType_rm inside{3'b000, 3'b001, 3'b010};     
                    (RV32D_RType_funct5 == 5'b00101) -> RV32D_RType_rm inside{3'b000, 3'b001};     
                    (RV32D_RType_funct5 == 5'b10100) -> RV32D_RType_rm inside{3'b000, 3'b001, 3'b010};     
                    (RV32D_RType_funct5 == 5'b11100) -> RV32D_RType_rm inside{3'b001};     

                }
                if (RV32D_RType_funct5 inside {5'b01011, 5'b11100}){
                    RV32D_RType_rs2 inside {5'b00000}; 
                }
                else if (RV32D_RType_funct5 inside {5'b11000, 5'b11010}) {
                    RV32D_RType_rs2 inside {5'b00001, 5'b00000}; 
                }
                else if (RV32D_RType_funct5 == 5'b01000 && RV32D_RType_fmt == 2'b00){
                    RV32D_RType_rs2 == 5'b00001; 
                }
                else if (RV32D_RType_funct5 == 5'b01000 && RV32D_RType_fmt == 2'b01){
                    RV32D_RType_rs2 == 5'b00000; 
                }
            }
        // RV64D
            constraint c_RV64D_R_Type{
                RV64D_RType_fmt == 2'b01; 
            //    RV64D_RType_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 

                RV64D_RType_funct5 inside{5'b11000, 5'b11100, 5'b11010, 5'b11110 }; 
                
                if(RV64D_RType_funct5 inside {5'b11100, 5'b11110}){
                    RV64D_RType_rm == 3'b000; 
                }
                else {
                    RV64D_RType_rm inside {3'b000, 3'b001, 3'b010, 3'b011, 3'b100, 3'b111}; 
                }

                if (RV64D_RType_funct5 == 5'b11000){
                    RV64D_RType_rs2 inside {5'b00010, 5'b00011}; 
                }
                else if(RV64D_RType_funct5 == 5'b11010) {
                    RV64D_RType_rs2 inside {5'b00010, 5'b00011}; 
                }
                else if(RV64D_RType_funct5 inside {5'b11100, 5'b11110}) {
                    RV64D_RType_rs2 inside {5'b00000}; 
                }
            }
            
endclass                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                