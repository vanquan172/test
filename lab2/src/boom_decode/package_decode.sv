package package_decode;

    // convert to string
    function string convert2str(bit a);
        return $sformatf("Instruction=%0d", a);
    endfunction

    // localparam
        // Short forward branch active?
            localparam IS_SFB_ACTIVE = 0; // choose between 0 and 1
        // number of generated instruction
            localparam MIN_NUM = 100;
            localparam MAX_NUM = 250;
        // extension
            localparam RV32I       = 0;
            localparam RV64I       = 1;
            localparam RV32M       = 2;
            localparam RV64M       = 3;
            localparam RV32A       = 4;
            localparam RV64A       = 5;
            localparam RVCSR       = 6;
            localparam RV32F       = 7;
            localparam RV64F       = 8;
            localparam RV32D       = 9;
            localparam RV64D       = 10;
        // RV32 Types
            localparam RV32I_RType = 0;
            localparam RV32I_IType = 1;
            localparam RV32I_SType = 2;
            localparam RV32I_BType = 3;
            localparam RV32I_UType = 4;
            localparam RV32I_JType = 5;
            localparam RV32I_FENCE_Type = 6;
            localparam RV32I_ENVIR_Type = 7;

        // RV64 Types
            localparam RV64I_IType = 0;
            localparam RV64I_SType = 1;
            localparam RV64I_RType_I = 2;
            localparam RV64I_RType_W = 3;
        // RV32F Types 
            localparam RV32F_LSType = 0;
            localparam RV32F_R4Type = 1;
            localparam RV32F_RType = 2;
        // RV32D Types 
            localparam RV32D_LSType = 0;
            localparam RV32D_R4Type = 1;
            localparam RV32D_RType = 2;


localparam logic [31:0] OPCODES [] = '{
    // Nhóm LUI / AUIPC / JAL / JALR
    32'h0000_0037, // LUI
    32'h0000_0017, // AUIPC
    32'h0000_006f, // JAL
    32'h0000_0067, // JALR

    // Nhóm BEQ / BNE / BLT / BGE / BLTU / BGEU + load/store + immediate
    32'h0000_0063, // BEQ
    32'h0000_1063, // BNE
    32'h0000_4063, // BLT
    32'h0000_5063, // BGE
    32'h0000_6063, // BLTU
    32'h0000_7063, // BGEU
    32'h0000_0003, // LB
    32'h0000_1003, // LH
    32'h0000_2003, // LW
    32'h0000_4003, // LBU
    32'h0000_5003, // LHU
    32'h0000_0023, // SB
    32'h0000_1023, // SH
    32'h0000_2023, // SW
    32'h0000_0013, // ADDI
    32'h0000_2013, // SLTI
    32'h0000_3013, // SLTIU
    32'h0000_4013, // XORI
    32'h0000_6013, // ORI
    32'h0000_7013, // ANDI

    // Nhóm SLLI / SRLI / SRAI
    32'h0000_1013, // SLLI
    32'h0000_5013, // SRLI
    32'h4000_5013, // SRAI

    // Nhóm ADD / SUB / SLL / SLT / SLTU / XOR / SRL / SRA / OR / AND
    32'h0000_0033, // ADD
    32'h4000_0033, // SUB
    32'h0000_1033, // SLL
    32'h0000_2033, // SLT
    32'h0000_3033, // SLTU
    32'h0000_4033, // XOR
    32'h0000_5033, // SRL
    32'h4000_5033, // SRA
    32'h0000_6033, // OR
    32'h0000_7033, // AND

    // FENCE / ECALL // EBREAK
    32'h0000_000f, // FENCE
    32'h0000_0073, // ECALL
    32'h0010_0073, // EBREAK

    // RV64I LWU / LD / SD / ADDIW
    32'h0000_6003, // LWU
    32'h0000_3003, // LD
    32'h0000_3023, // SD
    32'h0000_001b, // ADDIW

    // RV64I SLLI / SRLI / SRAI (khác mask so với RV32)
    32'h0000_1013, // SLLI
    32'h0000_5013, // SRLI
    32'h4000_5013, // SRAI

    // RV64I SLLIW / SRLIW / SRAIW / ADDW / SUBW / SLLW / SRLW / SRAW
    32'h0000_101b, // SLLIW
    32'h0000_501b, // SRLIW
    32'h4000_501b, // SRAIW
    32'h0000_003b, // ADDW
    32'h4000_003b, // SUBW
    32'h0000_103b, // SLLW
    32'h0000_503b, // SRLW
    32'h4000_503b, // SRAW

    // RV32M
    32'h0200_0033, // MUL
    32'h0200_1033, // MULH
    32'h0200_2033, // MULHSU
    32'h0200_3033, // MULHU
    32'h0200_4033, // DIV
    32'h0200_5033, // DIVU
    32'h0200_6033, // REM
    32'h0200_7033, // REMU

    // RV64M
    32'h0200_003b, // MULW
    32'h0200_403b, // DIVW
    32'h0200_503b, // DIVUW
    32'h0200_603b, // REMW
    32'h0200_703b, // REMUW

        //RV32A 
    32'h1000_202f, //LR.W
    32'h1800_202f, // SC.W.
    32'h0800_202f, // AMOSWAP.W
    32'h0000_202f, // AMOADD.W
    32'h2000_202f, // AMOXOR.W
    32'h6000_202f, // AMOAND.W
    32'h4000_202f, // AMOOR.W
    32'h8000_202f, // AMOMIN.W
    32'ha000_202f, // AMOMAX.W
    32'hc000_202f, // AMOMINU.W
    32'he000_202f, // AMOMAXU.W

    //RV64A 
    32'h1000_302f, //LR.D
    32'h1800_302f, // SC.D
    32'h0800_302f, // AMOSWAP.D
    32'h0000_302f, // AMOADD.D
    32'h2000_302f, // AMOXOR.D
    32'h6000_302f, // AMOAND.D
    32'h4000_302f, // AMOOR.D
    32'h8000_302f, // AMOMIN.D
    32'ha000_302f, // AMOMAX.D
    32'hc000_302f, // AMOMINU.D
    32'he000_302f, // AMOMAXU.D

    //RVCRS 
    32'h0000_1073, 
    32'h0000_2073, 
    32'h0000_3073, 
    32'h0000_5073, 
    32'h0000_6073, 
    32'h0000_7073, 

    // RV32F
    32'h0000_2007, // FLW
    32'h0000_2027, // FSW
    
    // FMADD.S
    32'h0000_0043, // FMADD.S
    32'h0000_0047, // FMSUB.S
    32'h0000_004b, // FNMSUB.S
    32'h0000_004f, // FNMADD.S
    
    // FADD.S / FSUB.S / FMUL.S / FDIV.S / FSQRT.S
    32'h0000_0053, // FADD.S
    32'h0800_0053, // FSUB.S
    32'h1000_0053, // FMUL.S
    32'h1800_0053, // FDIV.S
    32'h5800_0053, // FSQRT.S
    
    // FSGNJ.S / FSGNJN.S / FSGNJX.S
    32'h2000_0053, // FSGNJ.S
    32'h2000_1053, // FSGNJN.S
    32'h2000_2053, // FSGNJX.S
    32'h2800_0053, // FMIN.S
    32'h2800_1053, // FMAX.S
    
    // FCVT.W.S / FCVT.WU.S
    32'hc000_0053, // FCVT.W.S
    32'hc010_0053, // FCVT.WU.S
    
    // FMV.X.W / FEQ.S / FLT.S / FLE.S / FCLASS.S
    32'he000_0053, // FMV.X.W
    32'ha000_2053, // FEQ.S
    32'ha000_1053, // FLT.S
    32'ha000_0053, // FLE.S
    32'he000_1053, // FCLASS.S
    
    // FCVT.S.W / FCVT.S.WU
    32'hd000_0053, // FCVT.S.W
    32'hd010_0053, // FCVT.S.WU
    
    // FMV.W.X
    32'hf000_0053, // FMV.W.X

    // RV64F
    32'hc020_0053, // FCVT.L.S
    32'hc030_0053, // FCVT.LU.S
    32'hd020_0053, // FCVT.S.L
    32'hd030_0053, // FCVT.S.LU

    
        // RV32D
    32'h0000_3007, // FLD
    32'h0000_3027, // FSD

    // FMADD.D / FMSUB.D / FNMSUB.D / FNMADD.D
    32'h0200_0043, // FMADD.D 0000 0010
    32'h0200_0047, // FMSUB.D
    32'h0200_004b, // FNMSUB.D
    32'h0200_004f, // FNMADD.D

    // FADD.D / FSUB.D / FMUL.D / FDIV.D / FSQRT.D
    32'h0200_0053, // FADD.D
    32'h0a00_0053, // FSUB.D
    32'h1200_0053, // FMUL.D
    32'h1a00_0053, // FDIV.D
    32'h5a00_0053, // FSQRT.D

    // FSGNJ.D / FSGNJN.D / FSGNJX.D / FMIN.D / FMAX.D
    32'h2200_0053, // FSGNJ.D
    32'h2200_1053, // FSGNJN.D
    32'h2200_2053, // FSGNJX.D
    32'h2a00_0053, // FMIN.D
    32'h2a00_1053, // FMAX.D

    // FCVT.S.D / FCVT.D.S
    32'h4010_0053, // FCVT.S.D
    32'h4200_0053, // FCVT.D.S

    // FEQ.D / FLT.D / FLE.D / FCLASS.D
    32'ha200_2053, // FEQ.D
    32'ha200_1053, // FLT.D
    32'ha200_0053, // FLE.D
    32'he200_1053, // FCLASS.D

    // FCVT.W.D / FCVT.WU.D / FCVT.D.W / FCVT.D.WU
    32'hc200_0053, // FCVT.W.D
    32'hc210_0053, // FCVT.WU.D
    32'hd200_0053, // FCVT.D.W
    32'hd210_0053, // FCVT.D.WU

    // RV64D
    32'hc220_0053, // FCVT.L.D
    32'hc230_0053, // FCVT.LU.D
    32'he200_0053, // FMV.X.D
    32'hd220_0053, // FCVT.D.L
    32'hd230_0053, // FCVT.D.LU
    32'hf200_0053 // FMV.D.X


};


localparam logic [31:0] MASKS [] = '{
    // =========================
    // RV32I
    // =========================
    // Nhóm LUI / AUIPC / JAL / JALR
    32'h0000_007f, // LUI
    32'h0000_007f, // AUIPC
    32'h0000_007f, // JAL
    32'h0000_007f, // JALR

    // Nhóm BEQ / BNE / BLT / BGE / BLTU / BGEU + load/store + immediate
    32'h0000_707f, // BEQ
    32'h0000_707f, // BNE
    32'h0000_707f, // BLT
    32'h0000_707f, // BGE
    32'h0000_707f, // BLTU
    32'h0000_707f, // BGEU
    32'h0000_707f, // LB
    32'h0000_707f, // LH
    32'h0000_707f, // LW
    32'h0000_707f, // LBU
    32'h0000_707f, // LHU
    32'h0000_707f, // SB
    32'h0000_707f, // SH
    32'h0000_707f, // SW
    32'h0000_707f, // ADDI
    32'h0000_707f, // SLTI
    32'h0000_707f, // SLTIU
    32'h0000_707f, // XORI
    32'h0000_707f, // ORI
    32'h0000_707f, // ANDI

    // Nhóm SLLI / SRLI / SRAI (RV32I)
    32'hfe00_707f, // SLLI
    32'hfe00_707f, // SRLI
    32'hfe00_707f, // SRAI

    // Nhóm ADD / SUB / SLL / SLT / SLTU / XOR / SRL / SRA / OR / AND
    32'hfe00_707f, // ADD
    32'hfe00_707f, // SUB
    32'hfe00_707f, // SLL
    32'hfe00_707f, // SLT
    32'hfe00_707f, // SLTU
    32'hfe00_707f, // XOR
    32'hfe00_707f, // SRL
    32'hfe00_707f, // SRA
    32'hfe00_707f, // OR
    32'hfe00_707f, // AND

    // FENCE / ECALL // EBREAK
    32'h0000_007f, // FENCE
    32'hfff0_707f, // ECALL
    32'hfff0_707f, // EBREAK

    // =========================
    // RV64I
    // =========================

    // RV64I LWU / LD / SD / ADDIW
    32'h0000_707f, // LWU
    32'h0000_707f, // LD
    32'h0000_707f, // SD
    32'h0000_707f, // ADDIW

    // RV64I SLLI / SRLI / SRAI (mask khác RV32I)
    32'hfc00_707f, // SLLI
    32'hfc00_707f, // SRLI
    32'hfc00_707f, // SRAI

    // RV64I SLLIW / SRLIW / SRAIW / ADDW / SUBW / SLLW / SRLW / SRAW
    32'hfe00_707f, // SLLIW
    32'hfe00_707f, // SRLIW
    32'hfe00_707f, // SRAIW
    32'hfe00_707f, // ADDW
    32'hfe00_707f, // SUBW
    32'hfe00_707f, // SLLW
    32'hfe00_707f, // SRLW
    32'hfe00_707f, // SRAW

    // =========================
    // RV32M
    // =========================
    32'hfe00_707f, // MUL
    32'hfe00_707f, // MULH
    32'hfe00_707f, // MULHSU
    32'hfe00_707f, // MULHU
    32'hfe00_707f, // DIV
    32'hfe00_707f, // DIVU
    32'hfe00_707f, // REM
    32'hfe00_707f, // REMU

    // =========================
    // RV64M
    // =========================
    32'hfe00_707f, // MULW
    32'hfe00_707f, // DIVW
    32'hfe00_707f, // DIVUW
    32'hfe00_707f, // REMW
    32'hfe00_707f,  // REMUW

    // =========================
    // RV32A
    // =========================
    32'hf800_707f, //LR.W
    32'hf800_707f, // SC.W.
    32'hf800_707f, // AMOSWAP.W
    32'hf800_707f, // AMOADD.W
    32'hf800_707f, // AMOXOR.W
    32'hf800_707f, // AMOAND.W
    32'hf800_707f, // AMOOR.W
    32'hf800_707f, // AMOMIN.W
    32'hf800_707f, // AMOMAX.W
    32'hf800_707f, // AMOMINU.W
    32'hf800_707f, // AMOMAXU.W

    // =========================
    // RV64A
    // =========================
    32'hf800_707f, //LR.D
    32'hf800_707f, // SC.D
    32'hf800_707f, // AMOSWAP.D
    32'hf800_707f, // AMOADD.D
    32'hf800_707f, // AMOXOR.D
    32'hf800_707f, // AMOAND.D
    32'hf800_707f, // AMOOR.D
    32'hf800_707f, // AMOMIN.D
    32'hf800_707f, // AMOMAX.D
    32'hf800_707f, // AMOMINU.D
    32'hf800_707f, // AMOMAXU.D

    // =========================
    // RVCRS
    // =========================
    32'h0000_707f, 
    32'h0000_707f, 
    32'h0000_707f, 
    32'h0000_707f, 
    32'h0000_707f, 
    32'h0000_707f, 

    // =========================
    // RV32F
    // =========================
    
    // FLW - FSW
    32'h0000_707f, // FLW
    32'h0000_707f, // FSW

    // FMADD.S - FNMADD.S
    32'h0600_007f, // FMADD.S 0000 0110 0000
    32'h0600_007f, // FMSUB.S
    32'h0600_007f, // FNMSUB.S
    32'h0600_007f, // FNMADD.S

    // FADD.S - FSQRT.S
    32'hfe00_007f, // FADD.S
    32'hfe00_007f, // FSUB.S
    32'hfe00_007f, // FMUL.S
    32'hfe00_007f, // FDIV.S
    32'hfe00_007f, // FSQRT.S

    // FSGNJ.S - FMAX.S
    32'hfe00_707f, // FSGNJ.S
    32'hfe00_707f, // FSGNJN.S
    32'hfe00_707f, // FSGNJX.S
    32'hfe00_707f, // FMIN.S
    32'hfe00_707f, // FMAX.S

    // FCVT.W.S - FCVT.WU.S
    32'hfff0_007f, // FCVT.W.S
    32'hfff0_007f, // FCVT.WU.S

    // FMV.X.W - FCLASS.S
    32'hfe00_707f, // FMV.X.W
    32'hfe00_707f, // FEQ.S
    32'hfe00_707f, // FLT.S
    32'hfe00_707f, // FLE.S
    32'hfe00_707f, // FCLASS.S

    // FCVT.S.W - FMV.W.X
    32'hfff0_007f, // FCVT.S.W
    32'hfff0_007f, // FCVT.S.WU
    32'hfff0_007f, // FMV.W.X

    // RV64F
    32'hfff0_007f, // FCVT.L.S
    32'hfff0_007f, // FCVT.LU.S
    32'hfff0_007f, // FCVT.S.L
    32'hfff0_007f, // FCVT.S.LU

    // =========================
    // RV32D
    // =========================
    
    // FLD - FSD
    32'h0000_707f, // FLD
    32'h0000_707f, // FSD

    // FMADD.D - FNMADD.D
    32'h0600_007f, // FMADD.D
    32'h0600_007f, // FMSUB.D
    32'h0600_007f, // FNMSUB.D
    32'h0600_007f, // FNMADD.D

    // FADD.D - FSQRT.D
    32'hfe00_007f, // FADD.D
    32'hfe00_007f, // FSUB.D
    32'hfe00_007f, // FMUL.D
    32'hfe00_007f, // FDIV.D
    32'hfe00_007f, // FSQRT.D

    // FSGNJ.D - FMAX.D
    32'hfe00_707f, // FSGNJ.D
    32'hfe00_707f, // FSGNJN.D
    32'hfe00_707f, // FSGNJX.D
    32'hfe00_707f, // FMIN.D
    32'hfe00_707f, // FMAX.D

    // FCVT.S.D - FCVT.D.S
    32'hfff0_007f, // FCVT.S.D
    32'hfff0_007f, // FCVT.D.S

    // FEQ.D - FCLASS.D
    32'hfe00_707f, // FEQ.D
    32'hfe00_707f, // FLT.D
    32'hfe00_707f, // FLE.D
    32'hfe00_707f, // FCLASS.D

    // FCVT.W.D - FCVT.D.WU
    32'hfff0_007f, // FCVT.W.D
    32'hfff0_007f, // FCVT.WU.D
    32'hfff0_007f, // FCVT.D.W
    32'hfff0_007f, // FCVT.D.WU

    // RV64D
    32'hfff0_007f, // FCVT.L.D
    32'hfff0_007f, // FCVT.LU.D
    32'hfff0_007f, // FMV.X.D
    32'hfff0_007f, // FCVT.D.L
    32'hfff0_007f, // FCVT.D.LU
    32'hfff0_007f // FMV.D.X

};

endpackage