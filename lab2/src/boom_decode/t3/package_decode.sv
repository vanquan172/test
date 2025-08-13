package package_decode;

    // convert to string
    function string convert2str(bit a);
        return $sformatf("Instruction=%0d", a);
    endfunction

    // localparam
        // Short forward branch active?
            localparam IS_SFB_ACTIVE = 1; // choose between 0 and 1
        // number of generated instruction
            localparam MIN_NUM = 10000;
            localparam MAX_NUM = 10000;
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
        // RV64 Types
            localparam RV64I_RType = 0;
            localparam RV64I_IType = 1;
            localparam RV64I_SType = 2;
            localparam RV64I_RType_I = 0;
            localparam RV64I_RType_W = 1;

// RV32I
    localparam MASK_LUI_JALR = 32'h0000_007f; 
    localparam LUI      = 32'h0000_0037;
    localparam AUIPC      = 32'h0000_0017;
    localparam JAL      = 32'h0000_006f;
    localparam JALR      = 32'h0000_067;


    localparam MASK_BEG_ANDI = 32'h0000_707f; 
    localparam BEG      = 32'h0000_0063;
    localparam BNE      = 32'h0000_1063;
    localparam BLT      = 32'h0000_4063;
    localparam BGE      = 32'h0000_5063;
    localparam BLTU      = 32'h0000_6063;
    localparam BGEU      = 32'h0000_7063;
    localparam LB     = 32'h0000_0003;
    localparam LH     = 32'h0000_1003;
    localparam LW     = 32'h0000_2003;
    localparam LBU     = 32'h0000_4003;
    localparam LHU    = 32'h0000_5003;
    localparam SB    = 32'h0000_0023;
    localparam SH    = 32'h0000_1023;
    localparam SW    = 32'h0000_2023;
    localparam ADDI    = 32'h0000_0013;
    localparam SLTI    = 32'h0000_2023;
    localparam SLTIU    = 32'h0000_3023;
    localparam XORI    = 32'h0000_4023;
    localparam ORI    = 32'h0000_6023;
    localparam ANDI    = 32'h0000_7023;


    localparam MASK_SLLI_SRAI = 32'hfe00_707f; 
    localparam SLLI    = 32'h0000_1013;
    localparam SRLI    = 32'h0000_5013;
    localparam SRAI    = 32'h4000_5013;


    localparam MASK_ADD_AND  = 32'hfe00_707f; 
    localparam ADD    = 32'h0000_0033;
    localparam SUB    = 32'h4000_0033;
    localparam SLL    = 32'h0000_1033;
    localparam SLT    = 32'h0000_2033;
    localparam SLTU    = 32'h0000_3033;
    localparam XOR    = 32'h0000_4033;
    localparam SRL    = 32'h0000_5033;
    localparam SRA    = 32'h4000_5033;
    localparam OR     = 32'h0000_6033;
    localparam AND    = 32'h0000_7033;

//RV64I
    localparam MASK_LWU_SD  = 32'h0000_707f; 
    localparam LWU    = 32'h0000_6003;
    localparam LD    = 32'h0000_3003;
    localparam SD    = 32'h0000_3023;
    localparam ADDIW    = 32'h0000_001b;

    localparam MASK_SLLI_SRAI = 32'hfc00_707f; 
    localparam SLLI    = 32'h0000_1013;
    localparam SRLI    = 32'h0000_3013;
    localparam SRAI    = 32'h4000_3013;

    localparam MASK_SLLIW_SRAW = 32'hfe00_707f; 
    localparam SLLIW    = 32'h0000_101b;
    localparam SRLIW    = 32'h0000_501b;
    localparam SRAIW    = 32'h4000_501b;
    localparam ADDW    = 32'h0000_003b;
    localparam SUBW    = 32'h4000_003b;
    localparam SLLW    = 32'h0000_103b;
    localparam SRLW    = 32'h0000_503b;
    localparam SRAW    = 32'h4000_503b;

//RV32M 
    localparam MASK_MUL_REMU  = 32'hfe00_707f; 
    localparam MUL    = 32'h0200_0033;
    localparam MULH    = 32'h0200_1033;
    localparam MULHSU    = 32'h0200_2033;
    localparam MULHU    = 32'h0200_3033;
    localparam DIV    = 32'h0200_4033;
    localparam DIVU    = 32'h0200_5033;
    localparam REM    = 32'h0200_6033;
    localparam REMU    = 32'h0200_7033;


//RV64M
    localparam MASK_MUL_REMU  = 32'hfe00_707f; 
    localparam MULW    = 32'h0200_003b;
    localparam DIVW    = 32'h0200_403b;
    localparam DIVUW    = 32'h0200_503b;
    localparam REMW    = 32'h0200_603b;
    localparam REMUW    = 32'h0200_703b;
endpackage