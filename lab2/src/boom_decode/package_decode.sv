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
    32'he000_302f // AMOMAXU.D

};


localparam logic [31:0] MASKS [] = '{
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

    // RV32M
    32'hfe00_707f, // MUL
    32'hfe00_707f, // MULH
    32'hfe00_707f, // MULHSU
    32'hfe00_707f, // MULHU
    32'hfe00_707f, // DIV
    32'hfe00_707f, // DIVU
    32'hfe00_707f, // REM
    32'hfe00_707f, // REMU

    // RV64M
    32'hfe00_707f, // MULW
    32'hfe00_707f, // DIVW
    32'hfe00_707f, // DIVUW
    32'hfe00_707f, // REMW
    32'hfe00_707f,  // REMUW

    //RV32A 
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

    //RV64A 
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
    32'hf800_707f // AMOMAXU.D
};

endpackage