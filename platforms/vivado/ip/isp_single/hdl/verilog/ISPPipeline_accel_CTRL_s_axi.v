// ==============================================================
// Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2021.1 (64-bit)
// Copyright 1986-2021 Xilinx, Inc. All Rights Reserved.
// ==============================================================
`timescale 1ns/1ps
module ISPPipeline_accel_CTRL_s_axi
#(parameter
    C_S_AXI_ADDR_WIDTH = 12,
    C_S_AXI_DATA_WIDTH = 32
)(
    input  wire                          ACLK,
    input  wire                          ARESET,
    input  wire                          ACLK_EN,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] AWADDR,
    input  wire                          AWVALID,
    output wire                          AWREADY,
    input  wire [C_S_AXI_DATA_WIDTH-1:0] WDATA,
    input  wire [C_S_AXI_DATA_WIDTH/8-1:0] WSTRB,
    input  wire                          WVALID,
    output wire                          WREADY,
    output wire [1:0]                    BRESP,
    output wire                          BVALID,
    input  wire                          BREADY,
    input  wire [C_S_AXI_ADDR_WIDTH-1:0] ARADDR,
    input  wire                          ARVALID,
    output wire                          ARREADY,
    output wire [C_S_AXI_DATA_WIDTH-1:0] RDATA,
    output wire [1:0]                    RRESP,
    output wire                          RVALID,
    input  wire                          RREADY,
    output wire                          interrupt,
    output wire [15:0]                   width,
    output wire [15:0]                   height,
    output wire [7:0]                    mode_reg,
    output wire [15:0]                   rgain,
    output wire [15:0]                   bgain,
    output wire [15:0]                   pawb,
    input  wire [9:0]                    gamma_lut_address0,
    input  wire                          gamma_lut_ce0,
    output wire [7:0]                    gamma_lut_q0,
    output wire                          ap_start,
    input  wire                          ap_done,
    input  wire                          ap_ready,
    input  wire                          ap_idle
);
//------------------------Address Info-------------------
// 0x000 : Control signals
//         bit 0  - ap_start (Read/Write/COH)
//         bit 1  - ap_done (Read/COR)
//         bit 2  - ap_idle (Read)
//         bit 3  - ap_ready (Read/COR)
//         bit 7  - auto_restart (Read/Write)
//         others - reserved
// 0x004 : Global Interrupt Enable Register
//         bit 0  - Global Interrupt Enable (Read/Write)
//         others - reserved
// 0x008 : IP Interrupt Enable Register (Read/Write)
//         bit 0  - enable ap_done interrupt (Read/Write)
//         bit 1  - enable ap_ready interrupt (Read/Write)
//         others - reserved
// 0x00c : IP Interrupt Status Register (Read/TOW)
//         bit 0  - ap_done (COR/TOW)
//         bit 1  - ap_ready (COR/TOW)
//         others - reserved
// 0x010 : Data signal of width
//         bit 15~0 - width[15:0] (Read/Write)
//         others   - reserved
// 0x014 : reserved
// 0x018 : Data signal of height
//         bit 15~0 - height[15:0] (Read/Write)
//         others   - reserved
// 0x01c : reserved
// 0x020 : Data signal of mode_reg
//         bit 7~0 - mode_reg[7:0] (Read/Write)
//         others  - reserved
// 0x024 : reserved
// 0x030 : Data signal of rgain
//         bit 15~0 - rgain[15:0] (Read/Write)
//         others   - reserved
// 0x034 : reserved
// 0x038 : Data signal of bgain
//         bit 15~0 - bgain[15:0] (Read/Write)
//         others   - reserved
// 0x03c : reserved
// 0x054 : Data signal of pawb
//         bit 15~0 - pawb[15:0] (Read/Write)
//         others   - reserved
// 0x058 : reserved
// 0x800 ~
// 0xbff : Memory 'gamma_lut' (768 * 8b)
//         Word n : bit [ 7: 0] - gamma_lut[4n]
//                  bit [15: 8] - gamma_lut[4n+1]
//                  bit [23:16] - gamma_lut[4n+2]
//                  bit [31:24] - gamma_lut[4n+3]
// (SC = Self Clear, COR = Clear on Read, TOW = Toggle on Write, COH = Clear on Handshake)

//------------------------Parameter----------------------
localparam
    ADDR_AP_CTRL         = 12'h000,
    ADDR_GIE             = 12'h004,
    ADDR_IER             = 12'h008,
    ADDR_ISR             = 12'h00c,
    ADDR_WIDTH_DATA_0    = 12'h010,
    ADDR_WIDTH_CTRL      = 12'h014,
    ADDR_HEIGHT_DATA_0   = 12'h018,
    ADDR_HEIGHT_CTRL     = 12'h01c,
    ADDR_MODE_REG_DATA_0 = 12'h020,
    ADDR_MODE_REG_CTRL   = 12'h024,
    ADDR_RGAIN_DATA_0    = 12'h030,
    ADDR_RGAIN_CTRL      = 12'h034,
    ADDR_BGAIN_DATA_0    = 12'h038,
    ADDR_BGAIN_CTRL      = 12'h03c,
    ADDR_PAWB_DATA_0     = 12'h054,
    ADDR_PAWB_CTRL       = 12'h058,
    ADDR_GAMMA_LUT_BASE  = 12'h800,
    ADDR_GAMMA_LUT_HIGH  = 12'hbff,
    WRIDLE               = 2'd0,
    WRDATA               = 2'd1,
    WRRESP               = 2'd2,
    WRRESET              = 2'd3,
    RDIDLE               = 2'd0,
    RDDATA               = 2'd1,
    RDRESET              = 2'd2,
    ADDR_BITS                = 12;

//------------------------Local signal-------------------
    reg  [1:0]                    wstate = WRRESET;
    reg  [1:0]                    wnext;
    reg  [ADDR_BITS-1:0]          waddr;
    wire [C_S_AXI_DATA_WIDTH-1:0] wmask;
    wire                          aw_hs;
    wire                          w_hs;
    reg  [1:0]                    rstate = RDRESET;
    reg  [1:0]                    rnext;
    reg  [C_S_AXI_DATA_WIDTH-1:0] rdata;
    wire                          ar_hs;
    wire [ADDR_BITS-1:0]          raddr;
    // internal registers
    reg                           int_ap_idle;
    reg                           int_ap_ready = 1'b0;
    wire                          task_ap_ready;
    reg                           int_ap_done = 1'b0;
    wire                          task_ap_done;
    reg                           int_task_ap_done = 1'b0;
    reg                           int_ap_start = 1'b0;
    reg                           int_auto_restart = 1'b0;
    reg                           auto_restart_status = 1'b0;
    wire                          auto_restart_done;
    reg                           int_gie = 1'b0;
    reg  [1:0]                    int_ier = 2'b0;
    reg  [1:0]                    int_isr = 2'b0;
    reg  [15:0]                   int_width = 'b0;
    reg  [15:0]                   int_height = 'b0;
    reg  [7:0]                    int_mode_reg = 'b0;
    reg  [15:0]                   int_rgain = 'b0;
    reg  [15:0]                   int_bgain = 'b0;
    reg  [15:0]                   int_pawb = 'b0;
    // memory signals
    wire [7:0]                    int_gamma_lut_address0;
    wire                          int_gamma_lut_ce0;
    wire [31:0]                   int_gamma_lut_q0;
    wire [7:0]                    int_gamma_lut_address1;
    wire                          int_gamma_lut_ce1;
    wire                          int_gamma_lut_we1;
    wire [3:0]                    int_gamma_lut_be1;
    wire [31:0]                   int_gamma_lut_d1;
    wire [31:0]                   int_gamma_lut_q1;
    reg                           int_gamma_lut_read;
    reg                           int_gamma_lut_write;
    reg  [1:0]                    int_gamma_lut_shift0;

//------------------------Instantiation------------------
// int_gamma_lut
ISPPipeline_accel_CTRL_s_axi_ram #(
    .MEM_STYLE ( "auto" ),
    .MEM_TYPE  ( "2P" ),
    .BYTES     ( 4 ),
    .DEPTH     ( 192 )
) int_gamma_lut (
    .clk0      ( ACLK ),
    .address0  ( int_gamma_lut_address0 ),
    .ce0       ( int_gamma_lut_ce0 ),
    .we0       ( 'b0 ),
    .d0        ( 'b0 ),
    .q0        ( int_gamma_lut_q0 ),
    .clk1      ( ACLK ),
    .address1  ( int_gamma_lut_address1 ),
    .ce1       ( int_gamma_lut_ce1 ),
    .we1       ( int_gamma_lut_be1 ),
    .d1        ( int_gamma_lut_d1 ),
    .q1        ( int_gamma_lut_q1 )
);


//------------------------AXI write fsm------------------
assign AWREADY = (wstate == WRIDLE);
assign WREADY  = (wstate == WRDATA) && (!ar_hs);
assign BRESP   = 2'b00;  // OKAY
assign BVALID  = (wstate == WRRESP);
assign wmask   = { {8{WSTRB[3]}}, {8{WSTRB[2]}}, {8{WSTRB[1]}}, {8{WSTRB[0]}} };
assign aw_hs   = AWVALID & AWREADY;
assign w_hs    = WVALID & WREADY;

// wstate
always @(posedge ACLK) begin
    if (ARESET)
        wstate <= WRRESET;
    else if (ACLK_EN)
        wstate <= wnext;
end

// wnext
always @(*) begin
    case (wstate)
        WRIDLE:
            if (AWVALID)
                wnext = WRDATA;
            else
                wnext = WRIDLE;
        WRDATA:
            if (w_hs)
                wnext = WRRESP;
            else
                wnext = WRDATA;
        WRRESP:
            if (BREADY)
                wnext = WRIDLE;
            else
                wnext = WRRESP;
        default:
            wnext = WRIDLE;
    endcase
end

// waddr
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (aw_hs)
            waddr <= AWADDR[ADDR_BITS-1:0];
    end
end

//------------------------AXI read fsm-------------------
assign ARREADY = (rstate == RDIDLE);
assign RDATA   = rdata;
assign RRESP   = 2'b00;  // OKAY
assign RVALID  = (rstate == RDDATA) & !int_gamma_lut_read;
assign ar_hs   = ARVALID & ARREADY;
assign raddr   = ARADDR[ADDR_BITS-1:0];

// rstate
always @(posedge ACLK) begin
    if (ARESET)
        rstate <= RDRESET;
    else if (ACLK_EN)
        rstate <= rnext;
end

// rnext
always @(*) begin
    case (rstate)
        RDIDLE:
            if (ARVALID)
                rnext = RDDATA;
            else
                rnext = RDIDLE;
        RDDATA:
            if (RREADY & RVALID)
                rnext = RDIDLE;
            else
                rnext = RDDATA;
        default:
            rnext = RDIDLE;
    endcase
end

// rdata
always @(posedge ACLK) begin
    if (ACLK_EN) begin
        if (ar_hs) begin
            rdata <= 'b0;
            case (raddr)
                ADDR_AP_CTRL: begin
                    rdata[0] <= int_ap_start;
                    rdata[1] <= int_task_ap_done;
                    rdata[2] <= int_ap_idle;
                    rdata[3] <= int_ap_ready;
                    rdata[7] <= int_auto_restart;
                end
                ADDR_GIE: begin
                    rdata <= int_gie;
                end
                ADDR_IER: begin
                    rdata <= int_ier;
                end
                ADDR_ISR: begin
                    rdata <= int_isr;
                end
                ADDR_WIDTH_DATA_0: begin
                    rdata <= int_width[15:0];
                end
                ADDR_HEIGHT_DATA_0: begin
                    rdata <= int_height[15:0];
                end
                ADDR_MODE_REG_DATA_0: begin
                    rdata <= int_mode_reg[7:0];
                end
                ADDR_RGAIN_DATA_0: begin
                    rdata <= int_rgain[15:0];
                end
                ADDR_BGAIN_DATA_0: begin
                    rdata <= int_bgain[15:0];
                end
                ADDR_PAWB_DATA_0: begin
                    rdata <= int_pawb[15:0];
                end
            endcase
        end
        else if (int_gamma_lut_read) begin
            rdata <= int_gamma_lut_q1;
        end
    end
end


//------------------------Register logic-----------------
assign interrupt         = int_gie & (|int_isr);
assign ap_start          = int_ap_start;
assign task_ap_done      = (ap_done && !auto_restart_status) || auto_restart_done;
assign task_ap_ready     = ap_ready && !int_auto_restart;
assign auto_restart_done = auto_restart_status && (ap_idle && !int_ap_idle);
assign width             = int_width;
assign height            = int_height;
assign mode_reg          = int_mode_reg;
assign rgain             = int_rgain;
assign bgain             = int_bgain;
assign pawb              = int_pawb;
// int_ap_start
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_start <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0] && WDATA[0])
            int_ap_start <= 1'b1;
        else if (ap_ready)
            int_ap_start <= int_auto_restart; // clear on handshake/auto restart
    end
end

// int_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_done <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_done <= ap_done;
    end
end

// int_task_ap_done
always @(posedge ACLK) begin
    if (ARESET)
        int_task_ap_done <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_done)
            int_task_ap_done <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_task_ap_done <= 1'b0; // clear on read
    end
end

// int_ap_idle
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_idle <= 1'b0;
    else if (ACLK_EN) begin
            int_ap_idle <= ap_idle;
    end
end

// int_ap_ready
always @(posedge ACLK) begin
    if (ARESET)
        int_ap_ready <= 1'b0;
    else if (ACLK_EN) begin
        if (task_ap_ready)
            int_ap_ready <= 1'b1;
        else if (ar_hs && raddr == ADDR_AP_CTRL)
            int_ap_ready <= 1'b0;
    end
end

// int_auto_restart
always @(posedge ACLK) begin
    if (ARESET)
        int_auto_restart <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_AP_CTRL && WSTRB[0])
            int_auto_restart <=  WDATA[7];
    end
end

// auto_restart_status
always @(posedge ACLK) begin
    if (ARESET)
        auto_restart_status <= 1'b0;
    else if (ACLK_EN) begin
        if (int_auto_restart)
            auto_restart_status <= 1'b1;
        else if (ap_idle)
            auto_restart_status <= 1'b0;
    end
end

// int_gie
always @(posedge ACLK) begin
    if (ARESET)
        int_gie <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_GIE && WSTRB[0])
            int_gie <= WDATA[0];
    end
end

// int_ier
always @(posedge ACLK) begin
    if (ARESET)
        int_ier <= 1'b0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_IER && WSTRB[0])
            int_ier <= WDATA[1:0];
    end
end

// int_isr[0]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[0] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[0] & ap_done)
            int_isr[0] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[0] <= int_isr[0] ^ WDATA[0]; // toggle on write
    end
end

// int_isr[1]
always @(posedge ACLK) begin
    if (ARESET)
        int_isr[1] <= 1'b0;
    else if (ACLK_EN) begin
        if (int_ier[1] & ap_ready)
            int_isr[1] <= 1'b1;
        else if (w_hs && waddr == ADDR_ISR && WSTRB[0])
            int_isr[1] <= int_isr[1] ^ WDATA[1]; // toggle on write
    end
end

// int_width[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_width[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_WIDTH_DATA_0)
            int_width[15:0] <= (WDATA[31:0] & wmask) | (int_width[15:0] & ~wmask);
    end
end

// int_height[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_height[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_HEIGHT_DATA_0)
            int_height[15:0] <= (WDATA[31:0] & wmask) | (int_height[15:0] & ~wmask);
    end
end

// int_mode_reg[7:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_mode_reg[7:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_MODE_REG_DATA_0)
            int_mode_reg[7:0] <= (WDATA[31:0] & wmask) | (int_mode_reg[7:0] & ~wmask);
    end
end

// int_rgain[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_rgain[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_RGAIN_DATA_0)
            int_rgain[15:0] <= (WDATA[31:0] & wmask) | (int_rgain[15:0] & ~wmask);
    end
end

// int_bgain[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_bgain[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_BGAIN_DATA_0)
            int_bgain[15:0] <= (WDATA[31:0] & wmask) | (int_bgain[15:0] & ~wmask);
    end
end

// int_pawb[15:0]
always @(posedge ACLK) begin
    if (ARESET)
        int_pawb[15:0] <= 0;
    else if (ACLK_EN) begin
        if (w_hs && waddr == ADDR_PAWB_DATA_0)
            int_pawb[15:0] <= (WDATA[31:0] & wmask) | (int_pawb[15:0] & ~wmask);
    end
end


//------------------------Memory logic-------------------
// gamma_lut
assign int_gamma_lut_address0 = gamma_lut_address0 >> 2;
assign int_gamma_lut_ce0      = gamma_lut_ce0;
assign gamma_lut_q0           = int_gamma_lut_q0 >> (int_gamma_lut_shift0 * 8);
assign int_gamma_lut_address1 = ar_hs? raddr[9:2] : waddr[9:2];
assign int_gamma_lut_ce1      = ar_hs | (int_gamma_lut_write & WVALID);
assign int_gamma_lut_we1      = int_gamma_lut_write & w_hs;
assign int_gamma_lut_be1      = int_gamma_lut_we1 ? WSTRB : 'b0;
assign int_gamma_lut_d1       = WDATA;
// int_gamma_lut_read
always @(posedge ACLK) begin
    if (ARESET)
        int_gamma_lut_read <= 1'b0;
    else if (ACLK_EN) begin
        if (ar_hs && raddr >= ADDR_GAMMA_LUT_BASE && raddr <= ADDR_GAMMA_LUT_HIGH)
            int_gamma_lut_read <= 1'b1;
        else
            int_gamma_lut_read <= 1'b0;
    end
end

// int_gamma_lut_write
always @(posedge ACLK) begin
    if (ARESET)
        int_gamma_lut_write <= 1'b0;
    else if (ACLK_EN) begin
        if (aw_hs && AWADDR[ADDR_BITS-1:0] >= ADDR_GAMMA_LUT_BASE && AWADDR[ADDR_BITS-1:0] <= ADDR_GAMMA_LUT_HIGH)
            int_gamma_lut_write <= 1'b1;
        else if (w_hs)
            int_gamma_lut_write <= 1'b0;
    end
end

// int_gamma_lut_shift0
always @(posedge ACLK) begin
    if (ARESET)
        int_gamma_lut_shift0 <= 1'b0;
    else if (ACLK_EN) begin
        if (gamma_lut_ce0)
            int_gamma_lut_shift0 <= gamma_lut_address0[1:0];
    end
end


endmodule


`timescale 1ns/1ps

module ISPPipeline_accel_CTRL_s_axi_ram
#(parameter
    MEM_STYLE = "auto",
    MEM_TYPE  = "S2P",
    BYTES  = 4,
    DEPTH  = 256,
    AWIDTH = log2(DEPTH)
) (
    input  wire               clk0,
    input  wire [AWIDTH-1:0]  address0,
    input  wire               ce0,
    input  wire [BYTES-1:0]   we0,
    input  wire [BYTES*8-1:0] d0,
    output reg  [BYTES*8-1:0] q0,
    input  wire               clk1,
    input  wire [AWIDTH-1:0]  address1,
    input  wire               ce1,
    input  wire [BYTES-1:0]   we1,
    input  wire [BYTES*8-1:0] d1,
    output reg  [BYTES*8-1:0] q1
);
//------------------------ Parameters -------------------
localparam
    BYTE_WIDTH = 8,
    PORT0 = (MEM_TYPE == "S2P") ? "WO" : ((MEM_TYPE == "2P") ? "RO" : "RW"),
    PORT1 = (MEM_TYPE == "S2P") ? "RO" : "RW";
//------------------------Local signal-------------------
(* ram_style = MEM_STYLE*)
reg  [BYTES*8-1:0] mem[0:DEPTH-1];
wire re0, re1;
//------------------------Task and function--------------
function integer log2;
    input integer x;
    integer n, m;
begin
    n = 1;
    m = 2;
    while (m < x) begin
        n = n + 1;
        m = m * 2;
    end
    log2 = n;
end
endfunction
//------------------------Body---------------------------
generate
    if (MEM_STYLE == "hls_ultra" && PORT0 == "RW") begin
        assign re0 = ce0 & ~|we0;
    end else begin
        assign re0 = ce0;
    end
endgenerate

generate
    if (MEM_STYLE == "hls_ultra" && PORT1 == "RW") begin
        assign re1 = ce1 & ~|we1;
    end else begin
        assign re1 = ce1;
    end
endgenerate

// read port 0
generate if (PORT0 != "WO") begin
    always @(posedge clk0) begin
        if (re0) q0 <= mem[address0];
    end
end
endgenerate

// read port 1
generate if (PORT1 != "WO") begin
    always @(posedge clk1) begin
        if (re1) q1 <= mem[address1];
    end
end
endgenerate

integer i;
// write port 0
generate if (PORT0 != "RO") begin
    always @(posedge clk0) begin
        if (ce0)
        for (i = 0; i < BYTES; i = i + 1)
            if (we0[i])
                mem[address0][i*BYTE_WIDTH +: BYTE_WIDTH] <= d0[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

// write port 1
generate if (PORT1 != "RO") begin
    always @(posedge clk1) begin
        if (ce1)
        for (i = 0; i < BYTES; i = i + 1)
            if (we1[i])
                mem[address1][i*BYTE_WIDTH +: BYTE_WIDTH] <= d1[i*BYTE_WIDTH +: BYTE_WIDTH];
    end
end
endgenerate

endmodule

