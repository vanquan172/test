// @author: hungnc5
package decode_table_package;
  parameter Y = 1'b1;
  parameter N = 1'b0;
  parameter X = 1'bx;
  parameter uopNOP  =  0;
  parameter uopLD   =  1;
  parameter uopSTA  =  2;
  parameter uopSTD  =  3;
  parameter uopLUI  =  4;
  parameter uopADDI =  5;
  parameter uopANDI =  6;
  parameter uopORI  =  7;
  parameter uopXORI =  8;
  parameter uopSLTI =  9;
  parameter uopSLTIU= 10;
  parameter uopSLLI = 11;
  parameter uopSRAI = 12;
  parameter uopSRLI = 13;

  parameter uopSLL  = 14;
  parameter uopADD  = 15;
  parameter uopSUB  = 16;
  parameter uopSLT  = 17;
  parameter uopSLTU = 18;
  parameter uopAND  = 19;
  parameter uopOR   = 20;
  parameter uopXOR  = 21;
  parameter uopSRA  = 22;
  parameter uopSRL  = 23;

  parameter uopBEQ  = 24;
  parameter uopBNE  = 25;
  parameter uopBGE  = 26;
  parameter uopBGEU = 27;
  parameter uopBLT  = 28;
  parameter uopBLTU = 29; 
  parameter uopCSRRW= 30;
  parameter uopCSRRS= 31;
  parameter uopCSRRC= 32;
  parameter uopCSRRWI=33;
  parameter uopCSRRSI=34;
  parameter uopCSRRCI=35;

  parameter uopJ    = 36;
  parameter uopJAL  = 37;
  parameter uopJALR = 38;
  parameter uopAUIPC= 39;

  parameter uopCFLSH= 41;
  parameter uopFENCE= 42;
  parameter uopADDIW= 43;
  parameter uopADDW = 44;
  parameter uopSUBW = 45;
  parameter uopSLLIW= 46;
  parameter uopSLLW = 47;
  parameter uopSRAIW= 48;
  parameter uopSRAW = 49;
  parameter uopSRLIW= 50;
  parameter uopSRLW = 51;
  parameter uopMUL  = 52;
  parameter uopMULH = 53;
  parameter uopMULHU= 54;
  parameter uopMULHSU=55;
  parameter uopMULW = 56;
  parameter uopDIV  = 57;
  parameter uopDIVU = 58;
  parameter uopREM  = 59;
  parameter uopREMU = 60;
  parameter uopDIVW = 61;
  parameter uopDIVUW= 62;
  parameter uopREMW = 63;
  parameter uopREMUW= 64;
  parameter uopFENCEI    =  65;
  parameter uopAMO_AG    =  67;

  parameter uopFMV_W_X   =  68;
  parameter uopFMV_D_X   =  69;
  parameter uopFMV_X_W   =  70;
  parameter uopFMV_X_D   =  71;

  parameter uopFSGNJ_S   =  72;
  parameter uopFSGNJ_D   =  73;

  parameter uopFCVT_S_D  =  74;
  parameter uopFCVT_D_S  =  75; 

  parameter uopFCVT_S_X  =  76;
  parameter uopFCVT_D_X  =  77;

  parameter uopFCVT_X_S  =  78;
  parameter uopFCVT_X_D  =  79;

  parameter uopCMPR_S    =  80;
  parameter uopCMPR_D    =  81;

  parameter uopFCLASS_S  =  82;
  parameter uopFCLASS_D  =  83;

  parameter uopFMINMAX_S =  84;
  parameter uopFMINMAX_D =  85;

  parameter uopFADD_S    =  87;
  parameter uopFSUB_S    =  88;
  parameter uopFMUL_S    =  89;
  parameter uopFADD_D    =  90;
  parameter uopFSUB_D    =  91;
  parameter uopFMUL_D    =  92;

  parameter uopFMADD_S   =  93;
  parameter uopFMSUB_S   =  94;
  parameter uopFNMADD_S  =  95;
  parameter uopFNMSUB_S  =  96;
  parameter uopFMADD_D   =  97;
  parameter uopFMSUB_D   =  98;
  parameter uopFNMADD_D  =  99;
  parameter uopFNMSUB_D  = 100;

  parameter uopFDIV_S    = 101;
  parameter uopFDIV_D    = 102;
  parameter uopFSQRT_S   = 103;
  parameter uopFSQRT_D   = 104;

  parameter uopWFI       = 105;
  parameter uopERET      = 106;
  parameter uopSFENCE    = 107;

  parameter uopROCC      = 108;

  parameter uopMOV       = 109;

  parameter IQT_INT = 'd1;
  parameter IQT_MEM = 'd2;
  parameter IQT_FP = 'd4;
  parameter IQT_MFP = 'd6;

  parameter FU_X   =  10'bx;
  parameter FU_ALU =   1;
  parameter FU_JMP =   2;
  parameter FU_MEM =   4;
  parameter FU_MUL =   8;
  parameter FU_DIV =  16;
  parameter FU_CSR =  32;
  parameter FU_FPU =  64;
  parameter FU_FDV = 128;
  parameter FU_I2F = 256;
  parameter FU_F2I = 512;
  parameter FU_F2IMEM = 516;

  parameter RT_FIX = 'd0;
  parameter RT_FLT = 'd1;
  parameter RT_PAS = 'd3;
  parameter RT_X = 'd2;

  parameter IS_S   = 1;
  parameter IS_B   = 2;
  parameter IS_U   = 3;
  parameter IS_J   = 4;
  parameter IS_X   = 3'bxxx;
  parameter IS_I = 0;
  
  parameter M_X       = 'b00000;
  parameter M_XRD     = 'b00000;
  parameter M_XWR     = 'b00001;
  parameter M_PFR     = 'b00010;
  parameter M_PFW     = 'b00011;
  parameter M_XA_SWAP = 'b00100;
  parameter M_FLUSH_ALL = 'b00101;
  parameter M_XLR     = 'b00110;
  parameter M_XSC     = 'b00111;
  parameter M_XA_ADD  = 'b01000;
  parameter M_XA_XOR  = 'b01001;
  parameter M_XA_OR   = 'b01010;
  parameter M_XA_AND  = 'b01011;
  parameter M_XA_MIN  = 'b01100;
  parameter M_XA_MAX  = 'b01101;
  parameter M_XA_MINU = 'b01110;
  parameter M_XA_MAXU = 'b01111;
  parameter M_FLUSH   = 'b10000;
  parameter M_PWR     = 'b10001;
  parameter M_PRODUCE = 'b10010;
  parameter M_CLEAN   = 'b10011;
  parameter M_SFENCE  = 'b10100;
  parameter M_HFENCEV = 'b10101;
  parameter M_HFENCEG = 'b10110;
  parameter M_WOK     = 'b10111;
  parameter M_HLVX    = 'b10000;

  parameter CSR_N = 'd0;
  parameter CSR_R = 'd2;
  parameter CSR_I = 'd4;
  parameter CSR_W = 'd5;
  parameter CSR_S = 'd6;
  parameter CSR_C = 'd7;
  
  parameter UOPC_SZ = 'd7;
  parameter IQT_SZ = 'd3;
  parameter FUC_SZ = 'd10;
  parameter IMM_W = 'd3;
  parameter M_SZ = 'd5;


  typedef struct {bit legal, fp_val, fp_single;
          bit [UOPC_SZ-1:0] uopc;
          bit [IQT_SZ-1:0] iq_type;
          bit [FUC_SZ-1:0] fu_code;
          bit [1:0] dst_type;
          bit [1:0] rs1_type;
          bit [1:0] rs2_type;
          bit frs3_en;
          bit [IMM_W-1:0] imm_sel;
          bit uses_ldq, uses_stq, is_amo, is_fence, is_fencei;
          bit [M_SZ-1:0] mem_cmd;
          bit [1:0] wakeup_delay;
          bit bypassable, is_br, is_sys_pc2epc, inst_unique, flush_on_commit;
          bit [2:0] csr_cmd;
          bit [UOPC_SZ-1:0] uopc_sfb_active;}
  decode_ctrl_sig_s;

localparam decode_ctrl_sig_s DECODE_STRUCT [] = '{
    // Nhóm LUI / AUIPC / JAL / JALR
    '{Y, N, X, uopLUI,   IQT_INT, FU_ALU, RT_FIX, RT_X,   RT_X,   N, IS_U, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopLUI},
    '{Y, N, X, uopAUIPC, IQT_INT, FU_JMP, RT_FIX, RT_X,   RT_X,   N, IS_U, N, N, N, N, N, M_X,   1, N, N, N, N, N, CSR_N, uopAUIPC},
    '{Y, N, X, uopJAL,   IQT_INT, FU_JMP, RT_FIX, RT_X,   RT_X,   N, IS_J, N, N, N, N, N, M_X,   1, N, N, N, N, N, CSR_N, uopJAL},
    '{Y, N, X, uopJALR,  IQT_INT, FU_JMP, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, N, N, N, N, N, CSR_N, uopJALR},

    // Nhóm BEQ / BNE / BLT / BGE / BLTU / BGEU + load/store + immediate
    '{Y, N, X, uopBEQ,   IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBEQ},
    '{Y, N, X, uopBNE,   IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBNE},
    '{Y, N, X, uopBLT,   IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBLT},
    '{Y, N, X, uopBGE,   IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBGE},
    '{Y, N, X, uopBLTU,  IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBLTU},
    '{Y, N, X, uopBGEU,  IQT_INT, FU_ALU, RT_X,   RT_FIX, RT_FIX, N, IS_B, N, N, N, N, N, M_X,   0, N, Y, N, N, N, CSR_N, uopBGEU},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopSTA,   IQT_MEM, FU_MEM, RT_X,   RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},
    '{Y, N, X, uopSTA,   IQT_MEM, FU_MEM, RT_X,   RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},
    '{Y, N, X, uopSTA,   IQT_MEM, FU_MEM, RT_X,   RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},
    '{Y, N, X, uopADDI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopADDI},
    '{Y, N, X, uopSLTI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLTI},
    '{Y, N, X, uopSLTIU, IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLTIU},
    '{Y, N, X, uopXORI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopXORI},
    '{Y, N, X, uopORI,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopORI},
    '{Y, N, X, uopANDI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopANDI},

    // Nhóm SLLI / SRLI / SRAI (RV32I)
    '{Y, N, X, uopSLLI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLLI},
    '{Y, N, X, uopSRLI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRLI},
    '{Y, N, X, uopSRAI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRAI},

    // Nhóm ADD / SUB / SLL / SLT / SLTU / XOR / SRL / SRA / OR / AND
    '{Y, N, X, uopADD,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopADD},
    '{Y, N, X, uopSUB,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSUB},
    '{Y, N, X, uopSLL,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLL},
    '{Y, N, X, uopSLT,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLT},
    '{Y, N, X, uopSLTU,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLTU},
    '{Y, N, X, uopXOR,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopXOR},
    '{Y, N, X, uopSRL,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRL},
    '{Y, N, X, uopSRA,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRA},
    '{Y, N, X, uopOR,    IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopOR},
    '{Y, N, X, uopAND,   IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopAND},

    // FENCE / ECALL / EBREAK
    '{Y, N, X, uopFENCE , IQT_INT, FU_MEM , RT_X  , RT_X  , RT_X  , N, IS_X, N, Y, N, Y, N, M_X, 0, N, N, N, Y, Y, CSR_N, uopFENCE},  // FENCE
    '{Y, N, X, uopERET  , IQT_INT, FU_CSR , RT_X  , RT_X  , RT_X  , N, IS_I, N, N, N, N, N, M_X, 0, N, N, Y, Y, Y, CSR_I, uopERET},  // ECALL
    '{Y, N, X, uopERET  , IQT_INT, FU_CSR , RT_X  , RT_X  , RT_X  , N, IS_I, N, N, N, N, N, M_X, 0, N, N, Y, Y, Y, CSR_I, uopERET},   // EBREAK

    // RV64I LWU / LD / SD / ADDIW
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopLD,    IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 3, N, N, N, N, N, CSR_N, uopLD},
    '{Y, N, X, uopSTA,   IQT_MEM, FU_MEM, RT_X,   RT_FIX, RT_FIX, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},
    '{Y, N, X, uopADDIW, IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopADDIW},

    // RV64I SLLI / SRLI / SRAI
    '{Y, N, X, uopSLLI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLLI},
    '{Y, N, X, uopSRLI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRLI},
    '{Y, N, X, uopSRAI,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRAI},

    // RV64I SLLIW / SRLIW / SRAIW / ADDW / SUBW / SLLW / SRLW / SRAW
    '{Y, N, X, uopSLLIW, IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLLIW},
    '{Y, N, X, uopSRLIW, IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRLIW},
    '{Y, N, X, uopSRAIW, IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRAIW},
    '{Y, N, X, uopADDW,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopADDW},
    '{Y, N, X, uopSUBW,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSUBW},
    '{Y, N, X, uopSLLW,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSLLW},
    '{Y, N, X, uopSRLW,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRLW},
    '{Y, N, X, uopSRAW,  IQT_INT, FU_ALU, RT_FIX, RT_FIX, RT_FIX, N, IS_I, N, N, N, N, N, M_X,   1, Y, N, N, N, N, CSR_N, uopSRAW},

    // RV32M
    '{Y, N, X, uopMUL,   IQT_INT, FU_MUL, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopMUL},
    '{Y, N, X, uopMULH,  IQT_INT, FU_MUL, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopMULH},
    '{Y, N, X, uopMULHSU,IQT_INT, FU_MUL, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopMULHSU},
    '{Y, N, X, uopMULHU, IQT_INT, FU_MUL, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopMULHU},
    '{Y, N, X, uopDIV,   IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopDIV},
    '{Y, N, X, uopDIVU,  IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopDIVU},
    '{Y, N, X, uopREM,   IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopREM},
    '{Y, N, X, uopREMU,  IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopREMU},

    // RV64M
    '{Y, N, X, uopMULW,  IQT_INT, FU_MUL, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopMULW},
    '{Y, N, X, uopDIVW,  IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopDIVW},
    '{Y, N, X, uopDIVUW, IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopDIVUW},
    '{Y, N, X, uopREMW,  IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopREMW},
    '{Y, N, X, uopREMUW, IQT_INT, FU_DIV, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopREMUW},

    // RV32A
    '{Y, N, X, uopLD     , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X  , N, IS_X, Y, N, N, N, N, M_XLR   , 0, N, N, N, Y, Y, CSR_N, uopLD},           // LR.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XSC   , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},       // SC.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_SWAP,0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOSWAP.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_ADD , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOADD.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_XOR , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOXOR.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_AND , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOAND.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_OR  , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOOR.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MIN , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMIN.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAX , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMAX.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MINU, 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMINU.W
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAXU, 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMAXU.W

    // RV64A
    '{Y, N, X, uopLD     , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_X  , N, IS_X, Y, N, N, N, N, M_XLR   , 0, N, N, N, Y, Y, CSR_N, uopLD},           // LR.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XSC   , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},       // SC.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_SWAP,0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOSWAP.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_ADD , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOADD.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_XOR , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOXOR.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_AND , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOAND.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_OR  , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOOR.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MIN , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMIN.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAX , 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMAX.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MINU, 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},      // AMOMINU.D
    '{Y, N, X, uopAMO_AG , IQT_MEM, FU_MEM, RT_FIX, RT_FIX, RT_FIX, N, IS_X, N, Y, Y, N, N, M_XA_MAXU, 0, N, N, N, Y, Y, CSR_N, uopAMO_AG},       // AMOMAXU.D

    // RVCSR
    '{Y, N, X, uopCSRRW,  IQT_INT, FU_CSR, RT_FIX, RT_FIX, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_W,  uopCSRRW},
    '{Y, N, X, uopCSRRS,  IQT_INT, FU_CSR, RT_FIX, RT_FIX, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_S,  uopCSRRS},
    '{Y, N, X, uopCSRRC,  IQT_INT, FU_CSR, RT_FIX, RT_FIX, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_C,  uopCSRRC},

    '{Y, N, X, uopCSRRWI, IQT_INT, FU_CSR, RT_FIX, RT_PAS, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_W,  uopCSRRWI},
    '{Y, N, X, uopCSRRSI, IQT_INT, FU_CSR, RT_FIX, RT_PAS, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_S,  uopCSRRSI},
    '{Y, N, X, uopCSRRCI, IQT_INT, FU_CSR, RT_FIX, RT_PAS, RT_X , N, IS_I, N, N, N, N, N, M_X, 0, N, N, N, Y, Y, CSR_C,  uopCSRRCI},

    // RV32F
    '{Y, Y, Y, uopLD,       IQT_MEM, FU_MEM,   RT_FLT, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 0, N, N, N, N, N, CSR_N, uopLD},       // FLW: 32'h0000_3007
    '{Y, Y, Y, uopSTA,      IQT_MFP, FU_F2IMEM,RT_X,   RT_FIX, RT_FLT, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},     // FSW: 32'h0000_3027
    '{Y, Y, Y, uopFMADD_S,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMADD_S}, // FMADD.S: 32'h0000_3043
    '{Y, Y, Y, uopFMSUB_S,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMSUB_S}, // FMSUB.S: 32'h0000_3047
    '{Y, Y, Y, uopFNMSUB_S, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFNMSUB_S},// FNMSUB.S: 32'h0000_304b
    '{Y, Y, Y, uopFNMADD_S, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFNMADD_S},// FNMADD.S: 32'h0000_304f
    '{Y, Y, Y, uopFADD_S,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFADD_S},  // FADD.S: 32'h0000_0053
    '{Y, Y, Y, uopFSUB_S,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSUB_S},  // FSUB.S: 32'h0800_0053
    '{Y, Y, Y, uopFMUL_S,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMUL_S},  // FMUL.S: 32'h1000_0053
    '{Y, Y, Y, uopFDIV_S,   IQT_FP,  FU_FDV,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFDIV_S},  // FDIV.S: 32'h1800_0053
    '{Y, Y, Y, uopFSQRT_S,  IQT_FP,  FU_FDV,   RT_FLT, RT_FLT, RT_X,   N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSQRT_S}, // FSQRT.S: 32'h5800_0053
    '{Y, Y, Y, uopFSGNJ_S,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_S}, // FSGNJ.S: 32'h2000_0053
    '{Y, Y, Y, uopFSGNJ_S,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_S}, // FSGNJN.S: 32'h2000_1053
    '{Y, Y, Y, uopFSGNJ_S,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_S}, // FSGNJX.S: 32'h2000_2053
    '{Y, Y, Y, uopFMINMAX_S,IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMINMAX_S},// FMIN.S: 32'h2800_0053
    '{Y, Y, Y, uopFMINMAX_S,IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMINMAX_S},// FMAX.S: 32'h2800_1053
    '{Y, Y, Y, uopFCVT_X_S, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_S}, // FCVT.W.S: 32'hc000_0053
    '{Y, Y, Y, uopFCVT_X_S, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_S}, // FCVT.WU.S: 32'hc010_0053
    '{Y, Y, Y, uopFMV_X_W,  IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMV_X_W}, // FMV.X.W: 32'he000_0053
    '{Y, Y, Y, uopCMPR_S,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_S},  // FEQ.S: 32'ha000_2053
    '{Y, Y, Y, uopCMPR_S,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_S},  // FLT.S: 32'ha000_1053
    '{Y, Y, Y, uopCMPR_S,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_S},  // FLE.S: 32'ha000_0053
    '{Y, Y, Y, uopFCLASS_S, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCLASS_S},// FCLASS.S: 32'he000_1053
    '{Y, Y, Y, uopFCVT_S_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_S_X}, // FCVT.S.W: 32'hd000_0053
    '{Y, Y, Y, uopFCVT_S_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_S_X}, // FCVT.S.WU: 32'hd010_0053
    '{Y, Y, Y, uopFMV_W_X,  IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMV_W_X}, // FMV.W.X: 32'hf000_0053

    // RV64F
    '{Y, Y, Y, uopFCVT_X_S, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_S}, // FCVT.L.S: 32'hc020_0053
    '{Y, Y, Y, uopFCVT_X_S, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_S}, // FCVT.LU.S: 32'hc030_0053
    '{Y, Y, Y, uopFCVT_S_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_S_X}, // FCVT.S.L: 32'hd020_0053
    '{Y, Y, Y, uopFCVT_S_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_S_X}, // FCVT.S.LU: 32'hd030_0053

    // RV32D
    '{Y, Y, N, uopLD,       IQT_MEM, FU_MEM,   RT_FLT, RT_FIX, RT_X,   N, IS_I, Y, N, N, N, N, M_XRD, 0, N, N, N, N, N, CSR_N, uopLD},       // FLD: 32'h0000_3007
    '{Y, Y, N, uopSTA,      IQT_MFP, FU_F2IMEM,RT_X,   RT_FIX, RT_FLT, N, IS_S, N, Y, N, N, N, M_XWR, 0, N, N, N, N, N, CSR_N, uopSTA},     // FSD: 32'h0000_3027
    '{Y, Y, N, uopFMADD_D,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMADD_D}, // FMADD.D: 32'h0200_3043
    '{Y, Y, N, uopFMSUB_D,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMSUB_D}, // FMSUB.D: 32'h0200_3047
    '{Y, Y, N, uopFNMSUB_D, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFNMSUB_D},// FNMSUB.D: 32'h0200_304b
    '{Y, Y, N, uopFNMADD_D, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, Y, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFNMADD_D},// FNMADD.D: 32'h0200_304f
    '{Y, Y, N, uopFADD_D,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFADD_D},  // FADD.D: 32'h0200_0053
    '{Y, Y, N, uopFSUB_D,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSUB_D},  // FSUB.D: 32'h0a00_0053
    '{Y, Y, N, uopFMUL_D,   IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMUL_D},  // FMUL.D: 32'h1200_0053
    '{Y, Y, N, uopFDIV_D,   IQT_FP,  FU_FDV,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFDIV_D},  // FDIV.D: 32'h1a00_0053
    '{Y, Y, N, uopFSQRT_D,  IQT_FP,  FU_FDV,   RT_FLT, RT_FLT, RT_X,   N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSQRT_D}, // FSQRT.D: 32'h5a00_0053
    '{Y, Y, N, uopFSGNJ_D,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_D}, // FSGNJ.D: 32'h2100_0053
    '{Y, Y, N, uopFSGNJ_D,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_D}, // FSGNJN.D: 32'h2100_1053
    '{Y, Y, N, uopFSGNJ_D,  IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFSGNJ_D}, // FSGNJX.D: 32'h2100_2053
    '{Y, Y, N, uopFMINMAX_D,IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMINMAX_D},// FMIN.D: 32'h2a00_0053
    '{Y, Y, N, uopFMINMAX_D,IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMINMAX_D},// FMAX.D: 32'h2a00_1053
    '{Y, Y, Y, uopFCVT_S_D, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_S_D}, // FCVT.S.D: 32'h4010_0053
    '{Y, Y, N, uopFCVT_D_S, IQT_FP,  FU_FPU,   RT_FLT, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_D_S}, // FCVT.D.S: 32'h4200_0053
    '{Y, Y, N, uopCMPR_D,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_D},  // FEQ.D: 32'ha200_2053
    '{Y, Y, N, uopCMPR_D,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_D},  // FLT.D: 32'ha200_1053
    '{Y, Y, N, uopCMPR_D,   IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_FLT, N, IS_X, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopCMPR_D},  // FLE.D: 32'ha200_0053
    '{Y, Y, N, uopFCLASS_D, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCLASS_D},// FCLASS.D: 32'he200_1053
    '{Y, Y, N, uopFCVT_X_D, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_D}, // FCVT.W.D: 32'hc200_1053
    '{Y, Y, N, uopFCVT_X_D, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_D}, // FCVT.WU.D: 32'hc210_0053
    '{Y, Y, N, uopFCVT_D_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_D_X}, // FCVT.D.W: 32'hd200_0053
    '{Y, Y, N, uopFCVT_D_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_D_X}, // FCVT.D.WU: 32'hd210_0053

    // RV64D
    '{Y, Y, N, uopFCVT_X_D, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_D}, // FCVT.L.D: 32'hc220_0053
    '{Y, Y, N, uopFCVT_X_D, IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_X_D}, // FCVT.LU.D: 32'hc230_0053
    '{Y, Y, N, uopFMV_X_D,  IQT_FP,  FU_F2I,   RT_FIX, RT_FLT, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMV_X_D}, // FMV.X.D: 32'he000_0053
    '{Y, Y, N, uopFCVT_D_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_D_X}, // FCVT.D.L: 32'hd220_0053
    '{Y, Y, N, uopFCVT_D_X, IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFCVT_D_X}, // FCVT.D.LU: 32'hd230_0053
    '{Y, Y, N, uopFMV_D_X,  IQT_INT, FU_I2F,   RT_FLT, RT_FIX, RT_X,   N, IS_I, N, N, N, N, N, M_X,   0, N, N, N, N, N, CSR_N, uopFMV_D_X}  // FMV.D.X: 32'hf200_0053
    };

endpackage
