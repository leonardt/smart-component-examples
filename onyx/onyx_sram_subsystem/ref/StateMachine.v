module coreir_reg #(
    parameter width = 1,
    parameter clk_posedge = 1,
    parameter init = 1
) (
    input clk/*verilator public*/,
    input [width-1:0] in/*verilator public*/,
    output [width-1:0] out/*verilator public*/
);
  reg [width-1:0] outReg/*verilator public*/=init;
  wire real_clk;
  assign real_clk = clk_posedge ? clk : ~clk;
  always @(posedge real_clk) begin
    outReg <= in;
  end
  assign out = outReg;
endmodule

module coreir_not #(
    parameter width = 1
) (
    input [width-1:0] in/*verilator public*/,
    output [width-1:0] out/*verilator public*/
);
  assign out = ~in;
endmodule

module coreir_mux #(
    parameter width = 1
) (
    input [width-1:0] in0/*verilator public*/,
    input [width-1:0] in1/*verilator public*/,
    input sel/*verilator public*/,
    output [width-1:0] out/*verilator public*/
);
  assign out = sel ? in1 : in0;
endmodule

module coreir_mem #(
    parameter has_init = 1'b0,
    parameter sync_read = 1'b0,
    parameter depth = 1,
    parameter width = 1,
    parameter [(width * depth) - 1:0] init = 0
) (
    input clk/*verilator public*/,
    input [width-1:0] wdata/*verilator public*/,
    input [$clog2(depth)-1:0] waddr/*verilator public*/,
    input wen/*verilator public*/,
    output [width-1:0] rdata/*verilator public*/,
    input [$clog2(depth)-1:0] raddr/*verilator public*/
);
  reg [width-1:0] data [depth-1:0]/*verilator public*/;
  generate if (has_init) begin
    genvar j;
    for (j = 0; j < depth; j = j + 1) begin
      initial begin
        data[j] = init[(j+1)*width-1:j*width];
      end
    end
  end
  endgenerate
  always @(posedge clk) begin
    if (wen) begin
      data[waddr] <= wdata;
    end
  end
  generate if (sync_read) begin
  reg [width-1:0] rdata_reg;
  always @(posedge clk) begin
    rdata_reg <= data[raddr];
  end
  assign rdata = rdata_reg;
  end else begin
  assign rdata = data[raddr];
  end
  endgenerate

endmodule

module coreir_eq #(
    parameter width = 1
) (
    input [width-1:0] in0/*verilator public*/,
    input [width-1:0] in1/*verilator public*/,
    output out/*verilator public*/
);
  assign out = in0 == in1;
endmodule

module coreir_const #(
    parameter width = 1,
    parameter value = 1
) (
    output [width-1:0] out/*verilator public*/
);
  assign out = value;
endmodule

module corebit_not (
    input in/*verilator public*/,
    output out/*verilator public*/
);
  assign out = ~in;
endmodule

module corebit_const #(
    parameter value = 1
) (
    output out/*verilator public*/
);
  assign out = value;
endmodule

module commonlib_muxn__N2__width3 (
    input [2:0] in_data [1:0]/*verilator public*/,
    input [0:0] in_sel/*verilator public*/,
    output [2:0] out/*verilator public*/
);
wire [2:0] _join_out;
coreir_mux #(
    .width(3)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width16 (
    input [15:0] in_data [1:0]/*verilator public*/,
    input [0:0] in_sel/*verilator public*/,
    output [15:0] out/*verilator public*/
);
wire [15:0] _join_out;
coreir_mux #(
    .width(16)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width11 (
    input [10:0] in_data [1:0]/*verilator public*/,
    input [0:0] in_sel/*verilator public*/,
    output [10:0] out/*verilator public*/
);
wire [10:0] _join_out;
coreir_mux #(
    .width(11)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module commonlib_muxn__N2__width1 (
    input [0:0] in_data [1:0]/*verilator public*/,
    input [0:0] in_sel/*verilator public*/,
    output [0:0] out/*verilator public*/
);
wire [0:0] _join_out;
coreir_mux #(
    .width(1)
) _join (
    .in0(in_data[0]),
    .in1(in_data[1]),
    .sel(in_sel[0]),
    .out(_join_out)
);
assign out = _join_out;
endmodule

module Register_unq4 (
    input [0:0] I/*verilator public*/,
    output [0:0] O/*verilator public*/,
    input CLK/*verilator public*/
);
wire [0:0] reg_P1_inst0_out;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h0),
    .width(1)
) reg_P1_inst0 (
    .clk(CLK),
    .in(I),
    .out(reg_P1_inst0_out)
);
assign O = reg_P1_inst0_out;
endmodule

module Register_unq1 (
    input [0:0] I/*verilator public*/,
    output [0:0] O/*verilator public*/,
    input CLK/*verilator public*/
);
wire [0:0] reg_P1_inst0_out;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(1'h1),
    .width(1)
) reg_P1_inst0 (
    .clk(CLK),
    .in(I),
    .out(reg_P1_inst0_out)
);
assign O = reg_P1_inst0_out;
endmodule

module Register (
    input [2:0] I/*verilator public*/,
    output [2:0] O/*verilator public*/,
    input CLK/*verilator public*/
);
wire [2:0] reg_P3_inst0_out;
coreir_reg #(
    .clk_posedge(1'b1),
    .init(3'h0),
    .width(3)
) reg_P3_inst0 (
    .clk(CLK),
    .in(I),
    .out(reg_P3_inst0_out)
);
assign O = reg_P3_inst0_out;
endmodule

module Mux2xBits3 (
    input [2:0] I0/*verilator public*/,
    input [2:0] I1/*verilator public*/,
    input S/*verilator public*/,
    output [2:0] O/*verilator public*/
);
wire [2:0] coreir_commonlib_mux2x3_inst0_out;
wire [2:0] coreir_commonlib_mux2x3_inst0_in_data [1:0];
assign coreir_commonlib_mux2x3_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x3_inst0_in_data[0] = I0;
commonlib_muxn__N2__width3 coreir_commonlib_mux2x3_inst0 (
    .in_data(coreir_commonlib_mux2x3_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x3_inst0_out)
);
assign O = coreir_commonlib_mux2x3_inst0_out;
endmodule

module Register_unq3 (
    input [2:0] I/*verilator public*/,
    output [2:0] O/*verilator public*/,
    input CE/*verilator public*/,
    input CLK/*verilator public*/
);
wire [2:0] enable_mux_O;
wire [2:0] reg_P3_inst0_out;
Mux2xBits3 enable_mux (
    .I0(reg_P3_inst0_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(3'h0),
    .width(3)
) reg_P3_inst0 (
    .clk(CLK),
    .in(enable_mux_O),
    .out(reg_P3_inst0_out)
);
assign O = reg_P3_inst0_out;
endmodule

module Mux2xBits16 (
    input [15:0] I0/*verilator public*/,
    input [15:0] I1/*verilator public*/,
    input S/*verilator public*/,
    output [15:0] O/*verilator public*/
);
wire [15:0] coreir_commonlib_mux2x16_inst0_out;
wire [15:0] coreir_commonlib_mux2x16_inst0_in_data [1:0];
assign coreir_commonlib_mux2x16_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x16_inst0_in_data[0] = I0;
commonlib_muxn__N2__width16 coreir_commonlib_mux2x16_inst0 (
    .in_data(coreir_commonlib_mux2x16_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x16_inst0_out)
);
assign O = coreir_commonlib_mux2x16_inst0_out;
endmodule

module Register_unq2 (
    input [15:0] I/*verilator public*/,
    output [15:0] O/*verilator public*/,
    input CE/*verilator public*/,
    input CLK/*verilator public*/
);
wire [15:0] enable_mux_O;
wire [15:0] reg_P16_inst0_out;
Mux2xBits16 enable_mux (
    .I0(reg_P16_inst0_out),
    .I1(I),
    .S(CE),
    .O(enable_mux_O)
);
coreir_reg #(
    .clk_posedge(1'b1),
    .init(16'h0000),
    .width(16)
) reg_P16_inst0 (
    .clk(CLK),
    .in(enable_mux_O),
    .out(reg_P16_inst0_out)
);
assign O = reg_P16_inst0_out;
endmodule

module Mux2xBits11 (
    input [10:0] I0/*verilator public*/,
    input [10:0] I1/*verilator public*/,
    input S/*verilator public*/,
    output [10:0] O/*verilator public*/
);
wire [10:0] coreir_commonlib_mux2x11_inst0_out;
wire [10:0] coreir_commonlib_mux2x11_inst0_in_data [1:0];
assign coreir_commonlib_mux2x11_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x11_inst0_in_data[0] = I0;
commonlib_muxn__N2__width11 coreir_commonlib_mux2x11_inst0 (
    .in_data(coreir_commonlib_mux2x11_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x11_inst0_out)
);
assign O = coreir_commonlib_mux2x11_inst0_out;
endmodule

module Mux2xBits1 (
    input [0:0] I0/*verilator public*/,
    input [0:0] I1/*verilator public*/,
    input S/*verilator public*/,
    output [0:0] O/*verilator public*/
);
wire [0:0] coreir_commonlib_mux2x1_inst0_out;
wire [0:0] coreir_commonlib_mux2x1_inst0_in_data [1:0];
assign coreir_commonlib_mux2x1_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x1_inst0_in_data[0] = I0;
commonlib_muxn__N2__width1 coreir_commonlib_mux2x1_inst0 (
    .in_data(coreir_commonlib_mux2x1_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x1_inst0_out)
);
assign O = coreir_commonlib_mux2x1_inst0_out;
endmodule

module Mux2xBit (
    input I0/*verilator public*/,
    input I1/*verilator public*/,
    input S/*verilator public*/,
    output O/*verilator public*/
);
wire [0:0] coreir_commonlib_mux2x1_inst0_out;
wire [0:0] coreir_commonlib_mux2x1_inst0_in_data [1:0];
assign coreir_commonlib_mux2x1_inst0_in_data[1] = I1;
assign coreir_commonlib_mux2x1_inst0_in_data[0] = I0;
commonlib_muxn__N2__width1 coreir_commonlib_mux2x1_inst0 (
    .in_data(coreir_commonlib_mux2x1_inst0_in_data),
    .in_sel(S),
    .out(coreir_commonlib_mux2x1_inst0_out)
);
assign O = coreir_commonlib_mux2x1_inst0_out[0];
endmodule

module Memory (
    input [10:0] RADDR/*verilator public*/,
    output [15:0] RDATA/*verilator public*/,
    input CLK/*verilator public*/,
    input [10:0] WADDR/*verilator public*/,
    input [15:0] WDATA/*verilator public*/,
    input WE/*verilator public*/
);
wire [15:0] coreir_mem2048x16_inst0_rdata;
coreir_mem #(
    .depth(2048),
    .has_init(1'b0),
    .sync_read(1'b0),
    .width(16)
) coreir_mem2048x16_inst0 (
    .clk(CLK),
    .wdata(WDATA),
    .waddr(WADDR),
    .wen(WE),
    .rdata(coreir_mem2048x16_inst0_rdata),
    .raddr(RADDR)
);
assign RDATA = coreir_mem2048x16_inst0_rdata;
endmodule

module StateMachine (
    input [15:0] receive/*verilator public*/,
    input [0:0] receive_valid/*verilator public*/,
    output [0:0] receive_ready/*verilator public*/,
    input [2:0] offer/*verilator public*/,
    input [0:0] offer_valid/*verilator public*/,
    output [0:0] offer_ready/*verilator public*/,
    output [15:0] send/*verilator public*/,
    input [0:0] send_ready/*verilator public*/,
    output [0:0] send_valid/*verilator public*/,
    output [2:0] current_state/*verilator public*/,
    input CLK/*verilator public*/
);
wire [2:0] CommandFromClient_O;
wire [0:0] CommandFromClient_ready_O;
wire [0:0] CommandFromClient_valid_O;
wire [15:0] DataFromClient_O;
wire [0:0] DataFromClient_ready_O;
wire [0:0] DataFromClient_valid_O;
wire [15:0] DataToClient_O;
wire [0:0] DataToClient_ready_O;
wire [0:0] DataToClient_valid_O;
wire Mux2xBit_inst0_O;
wire Mux2xBit_inst1_O;
wire Mux2xBit_inst10_O;
wire Mux2xBit_inst11_O;
wire Mux2xBit_inst12_O;
wire Mux2xBit_inst13_O;
wire Mux2xBit_inst14_O;
wire Mux2xBit_inst15_O;
wire Mux2xBit_inst16_O;
wire Mux2xBit_inst17_O;
wire Mux2xBit_inst18_O;
wire Mux2xBit_inst19_O;
wire Mux2xBit_inst2_O;
wire Mux2xBit_inst20_O;
wire Mux2xBit_inst21_O;
wire Mux2xBit_inst22_O;
wire Mux2xBit_inst23_O;
wire Mux2xBit_inst3_O;
wire Mux2xBit_inst4_O;
wire Mux2xBit_inst5_O;
wire Mux2xBit_inst6_O;
wire Mux2xBit_inst7_O;
wire Mux2xBit_inst8_O;
wire Mux2xBit_inst9_O;
wire [10:0] Mux2xBits11_inst0_O;
wire [10:0] Mux2xBits11_inst1_O;
wire [10:0] Mux2xBits11_inst2_O;
wire [10:0] Mux2xBits11_inst3_O;
wire [10:0] Mux2xBits11_inst4_O;
wire [10:0] Mux2xBits11_inst5_O;
wire [10:0] Mux2xBits11_inst6_O;
wire [10:0] Mux2xBits11_inst7_O;
wire [15:0] Mux2xBits16_inst0_O;
wire [15:0] Mux2xBits16_inst1_O;
wire [15:0] Mux2xBits16_inst10_O;
wire [15:0] Mux2xBits16_inst11_O;
wire [15:0] Mux2xBits16_inst12_O;
wire [15:0] Mux2xBits16_inst13_O;
wire [15:0] Mux2xBits16_inst14_O;
wire [15:0] Mux2xBits16_inst15_O;
wire [15:0] Mux2xBits16_inst16_O;
wire [15:0] Mux2xBits16_inst17_O;
wire [15:0] Mux2xBits16_inst18_O;
wire [15:0] Mux2xBits16_inst19_O;
wire [15:0] Mux2xBits16_inst2_O;
wire [15:0] Mux2xBits16_inst20_O;
wire [15:0] Mux2xBits16_inst21_O;
wire [15:0] Mux2xBits16_inst22_O;
wire [15:0] Mux2xBits16_inst23_O;
wire [15:0] Mux2xBits16_inst24_O;
wire [15:0] Mux2xBits16_inst25_O;
wire [15:0] Mux2xBits16_inst26_O;
wire [15:0] Mux2xBits16_inst3_O;
wire [15:0] Mux2xBits16_inst4_O;
wire [15:0] Mux2xBits16_inst5_O;
wire [15:0] Mux2xBits16_inst6_O;
wire [15:0] Mux2xBits16_inst7_O;
wire [15:0] Mux2xBits16_inst8_O;
wire [15:0] Mux2xBits16_inst9_O;
wire [0:0] Mux2xBits1_inst0_O;
wire [0:0] Mux2xBits1_inst1_O;
wire [0:0] Mux2xBits1_inst10_O;
wire [0:0] Mux2xBits1_inst11_O;
wire [0:0] Mux2xBits1_inst12_O;
wire [0:0] Mux2xBits1_inst13_O;
wire [0:0] Mux2xBits1_inst14_O;
wire [0:0] Mux2xBits1_inst15_O;
wire [0:0] Mux2xBits1_inst16_O;
wire [0:0] Mux2xBits1_inst17_O;
wire [0:0] Mux2xBits1_inst18_O;
wire [0:0] Mux2xBits1_inst19_O;
wire [0:0] Mux2xBits1_inst2_O;
wire [0:0] Mux2xBits1_inst20_O;
wire [0:0] Mux2xBits1_inst21_O;
wire [0:0] Mux2xBits1_inst22_O;
wire [0:0] Mux2xBits1_inst23_O;
wire [0:0] Mux2xBits1_inst24_O;
wire [0:0] Mux2xBits1_inst25_O;
wire [0:0] Mux2xBits1_inst26_O;
wire [0:0] Mux2xBits1_inst27_O;
wire [0:0] Mux2xBits1_inst28_O;
wire [0:0] Mux2xBits1_inst29_O;
wire [0:0] Mux2xBits1_inst3_O;
wire [0:0] Mux2xBits1_inst30_O;
wire [0:0] Mux2xBits1_inst4_O;
wire [0:0] Mux2xBits1_inst5_O;
wire [0:0] Mux2xBits1_inst6_O;
wire [0:0] Mux2xBits1_inst7_O;
wire [0:0] Mux2xBits1_inst8_O;
wire [0:0] Mux2xBits1_inst9_O;
wire [2:0] Mux2xBits3_inst0_O;
wire [2:0] Mux2xBits3_inst1_O;
wire [2:0] Mux2xBits3_inst10_O;
wire [2:0] Mux2xBits3_inst11_O;
wire [2:0] Mux2xBits3_inst12_O;
wire [2:0] Mux2xBits3_inst13_O;
wire [2:0] Mux2xBits3_inst14_O;
wire [2:0] Mux2xBits3_inst15_O;
wire [2:0] Mux2xBits3_inst16_O;
wire [2:0] Mux2xBits3_inst17_O;
wire [2:0] Mux2xBits3_inst18_O;
wire [2:0] Mux2xBits3_inst19_O;
wire [2:0] Mux2xBits3_inst2_O;
wire [2:0] Mux2xBits3_inst20_O;
wire [2:0] Mux2xBits3_inst21_O;
wire [2:0] Mux2xBits3_inst22_O;
wire [2:0] Mux2xBits3_inst23_O;
wire [2:0] Mux2xBits3_inst24_O;
wire [2:0] Mux2xBits3_inst25_O;
wire [2:0] Mux2xBits3_inst26_O;
wire [2:0] Mux2xBits3_inst27_O;
wire [2:0] Mux2xBits3_inst28_O;
wire [2:0] Mux2xBits3_inst29_O;
wire [2:0] Mux2xBits3_inst3_O;
wire [2:0] Mux2xBits3_inst30_O;
wire [2:0] Mux2xBits3_inst31_O;
wire [2:0] Mux2xBits3_inst32_O;
wire [2:0] Mux2xBits3_inst33_O;
wire [2:0] Mux2xBits3_inst34_O;
wire [2:0] Mux2xBits3_inst35_O;
wire [2:0] Mux2xBits3_inst4_O;
wire [2:0] Mux2xBits3_inst5_O;
wire [2:0] Mux2xBits3_inst6_O;
wire [2:0] Mux2xBits3_inst7_O;
wire [2:0] Mux2xBits3_inst8_O;
wire [2:0] Mux2xBits3_inst9_O;
wire [15:0] SRAM_RDATA;
wire bit_const_1_None_out;
wire [0:0] const_0_1_out;
wire [2:0] const_0_3_out;
wire [15:0] const_10066_16_out;
wire [10:0] const_13_11_out;
wire [15:0] const_13_16_out;
wire [15:0] const_15_16_out;
wire [15:0] const_16_16_out;
wire [0:0] const_1_1_out;
wire [15:0] const_1_16_out;
wire [2:0] const_1_3_out;
wire [2:0] const_2_3_out;
wire [2:0] const_3_3_out;
wire [2:0] const_4_3_out;
wire [2:0] const_5_3_out;
wire [10:0] const_66_11_out;
wire [2:0] const_6_3_out;
wire [2:0] const_7_3_out;
wire [0:0] initreg_O;
wire magma_Bit_not_inst0_out;
wire magma_Bits_1_eq_inst0_out;
wire magma_Bits_1_eq_inst1_out;
wire magma_Bits_1_eq_inst10_out;
wire magma_Bits_1_eq_inst11_out;
wire magma_Bits_1_eq_inst12_out;
wire magma_Bits_1_eq_inst13_out;
wire magma_Bits_1_eq_inst14_out;
wire magma_Bits_1_eq_inst2_out;
wire magma_Bits_1_eq_inst3_out;
wire magma_Bits_1_eq_inst4_out;
wire magma_Bits_1_eq_inst5_out;
wire magma_Bits_1_eq_inst6_out;
wire magma_Bits_1_eq_inst7_out;
wire magma_Bits_1_eq_inst8_out;
wire magma_Bits_1_eq_inst9_out;
wire [0:0] magma_Bits_1_not_inst0_out;
wire [0:0] magma_Bits_1_not_inst1_out;
wire [0:0] magma_Bits_1_not_inst10_out;
wire [0:0] magma_Bits_1_not_inst11_out;
wire [0:0] magma_Bits_1_not_inst12_out;
wire [0:0] magma_Bits_1_not_inst2_out;
wire [0:0] magma_Bits_1_not_inst3_out;
wire [0:0] magma_Bits_1_not_inst4_out;
wire [0:0] magma_Bits_1_not_inst5_out;
wire [0:0] magma_Bits_1_not_inst6_out;
wire [0:0] magma_Bits_1_not_inst7_out;
wire [0:0] magma_Bits_1_not_inst8_out;
wire [0:0] magma_Bits_1_not_inst9_out;
wire magma_Bits_3_eq_inst0_out;
wire magma_Bits_3_eq_inst1_out;
wire magma_Bits_3_eq_inst10_out;
wire magma_Bits_3_eq_inst11_out;
wire magma_Bits_3_eq_inst12_out;
wire magma_Bits_3_eq_inst13_out;
wire magma_Bits_3_eq_inst14_out;
wire magma_Bits_3_eq_inst15_out;
wire magma_Bits_3_eq_inst16_out;
wire magma_Bits_3_eq_inst17_out;
wire magma_Bits_3_eq_inst18_out;
wire magma_Bits_3_eq_inst19_out;
wire magma_Bits_3_eq_inst2_out;
wire magma_Bits_3_eq_inst20_out;
wire magma_Bits_3_eq_inst21_out;
wire magma_Bits_3_eq_inst3_out;
wire magma_Bits_3_eq_inst4_out;
wire magma_Bits_3_eq_inst5_out;
wire magma_Bits_3_eq_inst6_out;
wire magma_Bits_3_eq_inst7_out;
wire magma_Bits_3_eq_inst8_out;
wire magma_Bits_3_eq_inst9_out;
wire [15:0] mem_addr_reg_O;
wire [15:0] mem_data_reg_O;
wire [15:0] redundancy_reg_O;
wire [2:0] state_reg_O;
Register_unq3 CommandFromClient (
    .I(offer),
    .O(CommandFromClient_O),
    .CE(Mux2xBit_inst20_O),
    .CLK(CLK)
);
Register_unq4 CommandFromClient_ready (
    .I(Mux2xBits1_inst29_O),
    .O(CommandFromClient_ready_O),
    .CLK(CLK)
);
Register_unq4 CommandFromClient_valid (
    .I(offer_valid),
    .O(CommandFromClient_valid_O),
    .CLK(CLK)
);
Register_unq2 DataFromClient (
    .I(receive),
    .O(DataFromClient_O),
    .CE(Mux2xBit_inst21_O),
    .CLK(CLK)
);
Register_unq4 DataFromClient_ready (
    .I(Mux2xBits1_inst30_O),
    .O(DataFromClient_ready_O),
    .CLK(CLK)
);
Register_unq4 DataFromClient_valid (
    .I(receive_valid),
    .O(DataFromClient_valid_O),
    .CLK(CLK)
);
Register_unq2 DataToClient (
    .I(Mux2xBits16_inst25_O),
    .O(DataToClient_O),
    .CE(Mux2xBit_inst22_O),
    .CLK(CLK)
);
Register_unq4 DataToClient_ready (
    .I(send_ready),
    .O(DataToClient_ready_O),
    .CLK(CLK)
);
Register_unq4 DataToClient_valid (
    .I(Mux2xBits1_inst28_O),
    .O(DataToClient_valid_O),
    .CLK(CLK)
);
Mux2xBit Mux2xBit_inst0 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_1_eq_inst9_out),
    .O(Mux2xBit_inst0_O)
);
Mux2xBit Mux2xBit_inst1 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_1_eq_inst14_out),
    .O(Mux2xBit_inst1_O)
);
Mux2xBit Mux2xBit_inst10 (
    .I0(Mux2xBit_inst7_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBit_inst10_O)
);
Mux2xBit Mux2xBit_inst11 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBit_inst11_O)
);
Mux2xBit Mux2xBit_inst12 (
    .I0(Mux2xBit_inst9_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBit_inst12_O)
);
Mux2xBit Mux2xBit_inst13 (
    .I0(Mux2xBit_inst10_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBit_inst13_O)
);
Mux2xBit Mux2xBit_inst14 (
    .I0(Mux2xBit_inst11_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBit_inst14_O)
);
Mux2xBit Mux2xBit_inst15 (
    .I0(Mux2xBit_inst12_O),
    .I1(Mux2xBit_inst0_O),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBit_inst15_O)
);
Mux2xBit Mux2xBit_inst16 (
    .I0(Mux2xBit_inst13_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBit_inst16_O)
);
Mux2xBit Mux2xBit_inst17 (
    .I0(Mux2xBit_inst14_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBit_inst17_O)
);
Mux2xBit Mux2xBit_inst18 (
    .I0(Mux2xBit_inst15_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBit_inst18_O)
);
Mux2xBit Mux2xBit_inst19 (
    .I0(Mux2xBit_inst16_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBit_inst19_O)
);
Mux2xBit Mux2xBit_inst2 (
    .I0(bit_const_1_None_out),
    .I1(Mux2xBit_inst1_O),
    .S(magma_Bits_3_eq_inst21_out),
    .O(Mux2xBit_inst2_O)
);
Mux2xBit Mux2xBit_inst20 (
    .I0(Mux2xBit_inst17_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBit_inst20_O)
);
Mux2xBit Mux2xBit_inst21 (
    .I0(Mux2xBit_inst8_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBit_inst21_O)
);
Mux2xBit Mux2xBit_inst22 (
    .I0(Mux2xBit_inst18_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBit_inst22_O)
);
Mux2xBit Mux2xBit_inst23 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBit_inst23_O)
);
Mux2xBit Mux2xBit_inst3 (
    .I0(Mux2xBit_inst2_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBit_inst3_O)
);
Mux2xBit Mux2xBit_inst4 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBit_inst4_O)
);
Mux2xBit Mux2xBit_inst5 (
    .I0(bit_const_1_None_out),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBit_inst5_O)
);
Mux2xBit Mux2xBit_inst6 (
    .I0(Mux2xBit_inst3_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBit_inst6_O)
);
Mux2xBit Mux2xBit_inst7 (
    .I0(Mux2xBit_inst4_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBit_inst7_O)
);
Mux2xBit Mux2xBit_inst8 (
    .I0(Mux2xBit_inst5_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBit_inst8_O)
);
Mux2xBit Mux2xBit_inst9 (
    .I0(Mux2xBit_inst6_O),
    .I1(bit_const_1_None_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBit_inst9_O)
);
Mux2xBits11 Mux2xBits11_inst0 (
    .I0(const_66_11_out),
    .I1(Mux2xBits16_inst0_O[10:0]),
    .S(magma_Bits_1_eq_inst13_out),
    .O(Mux2xBits11_inst0_O)
);
Mux2xBits11 Mux2xBits11_inst1 (
    .I0(const_66_11_out),
    .I1(Mux2xBits11_inst0_O),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits11_inst1_O)
);
Mux2xBits11 Mux2xBits11_inst2 (
    .I0(Mux2xBits11_inst1_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits11_inst2_O)
);
Mux2xBits11 Mux2xBits11_inst3 (
    .I0(Mux2xBits11_inst2_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits11_inst3_O)
);
Mux2xBits11 Mux2xBits11_inst4 (
    .I0(Mux2xBits11_inst3_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits11_inst4_O)
);
Mux2xBits11 Mux2xBits11_inst5 (
    .I0(Mux2xBits11_inst4_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits11_inst5_O)
);
Mux2xBits11 Mux2xBits11_inst6 (
    .I0(Mux2xBits11_inst5_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits11_inst6_O)
);
Mux2xBits11 Mux2xBits11_inst7 (
    .I0(Mux2xBits11_inst6_O),
    .I1(const_66_11_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits11_inst7_O)
);
Mux2xBits16 Mux2xBits16_inst0 (
    .I0(mem_addr_reg_O),
    .I1(const_13_16_out),
    .S(magma_Bits_1_eq_inst0_out),
    .O(Mux2xBits16_inst0_O)
);
Mux2xBits16 Mux2xBits16_inst1 (
    .I0(const_16_16_out),
    .I1(DataFromClient_O),
    .S(magma_Bits_1_eq_inst5_out),
    .O(Mux2xBits16_inst1_O)
);
Mux2xBits16 Mux2xBits16_inst10 (
    .I0(Mux2xBits16_inst7_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits16_inst10_O)
);
Mux2xBits16 Mux2xBits16_inst11 (
    .I0(Mux2xBits16_inst8_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits16_inst11_O)
);
Mux2xBits16 Mux2xBits16_inst12 (
    .I0(Mux2xBits16_inst9_O),
    .I1(Mux2xBits16_inst2_O),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits16_inst12_O)
);
Mux2xBits16 Mux2xBits16_inst13 (
    .I0(Mux2xBits16_inst10_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits16_inst13_O)
);
Mux2xBits16 Mux2xBits16_inst14 (
    .I0(Mux2xBits16_inst11_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits16_inst14_O)
);
Mux2xBits16 Mux2xBits16_inst15 (
    .I0(Mux2xBits16_inst12_O),
    .I1(Mux2xBits16_inst0_O),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits16_inst15_O)
);
Mux2xBits16 Mux2xBits16_inst16 (
    .I0(Mux2xBits16_inst13_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits16_inst16_O)
);
Mux2xBits16 Mux2xBits16_inst17 (
    .I0(Mux2xBits16_inst14_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits16_inst17_O)
);
Mux2xBits16 Mux2xBits16_inst18 (
    .I0(Mux2xBits16_inst15_O),
    .I1(Mux2xBits16_inst0_O),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits16_inst18_O)
);
Mux2xBits16 Mux2xBits16_inst19 (
    .I0(Mux2xBits16_inst16_O),
    .I1(const_1_16_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits16_inst19_O)
);
wire [15:0] Mux2xBits16_inst2_I0;
assign Mux2xBits16_inst2_I0 = {Mux2xBits16_inst0_O[15],Mux2xBits16_inst0_O[14],Mux2xBits16_inst0_O[13],Mux2xBits16_inst0_O[12],Mux2xBits16_inst0_O[11],Mux2xBits16_inst0_O[10:0]};
Mux2xBits16 Mux2xBits16_inst2 (
    .I0(Mux2xBits16_inst2_I0),
    .I1(DataFromClient_O),
    .S(magma_Bits_1_eq_inst11_out),
    .O(Mux2xBits16_inst2_O)
);
Mux2xBits16 Mux2xBits16_inst20 (
    .I0(Mux2xBits16_inst17_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits16_inst20_O)
);
Mux2xBits16 Mux2xBits16_inst21 (
    .I0(Mux2xBits16_inst18_O),
    .I1(Mux2xBits16_inst0_O),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits16_inst21_O)
);
Mux2xBits16 Mux2xBits16_inst22 (
    .I0(Mux2xBits16_inst19_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits16_inst22_O)
);
Mux2xBits16 Mux2xBits16_inst23 (
    .I0(Mux2xBits16_inst20_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits16_inst23_O)
);
Mux2xBits16 Mux2xBits16_inst24 (
    .I0(Mux2xBits16_inst21_O),
    .I1(Mux2xBits16_inst0_O),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits16_inst24_O)
);
Mux2xBits16 Mux2xBits16_inst25 (
    .I0(Mux2xBits16_inst22_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits16_inst25_O)
);
Mux2xBits16 Mux2xBits16_inst26 (
    .I0(const_16_16_out),
    .I1(Mux2xBits16_inst1_O),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits16_inst26_O)
);
wire [15:0] Mux2xBits16_inst3_I0;
assign Mux2xBits16_inst3_I0 = {Mux2xBits16_inst0_O[15],Mux2xBits16_inst0_O[14],Mux2xBits16_inst0_O[13],Mux2xBits16_inst0_O[12],Mux2xBits16_inst0_O[11],Mux2xBits16_inst0_O[10:0]};
Mux2xBits16 Mux2xBits16_inst3 (
    .I0(Mux2xBits16_inst3_I0),
    .I1(DataFromClient_O),
    .S(magma_Bits_1_eq_inst12_out),
    .O(Mux2xBits16_inst3_O)
);
Mux2xBits16 Mux2xBits16_inst4 (
    .I0(const_10066_16_out),
    .I1(DataFromClient_O),
    .S(magma_Bits_1_eq_inst13_out),
    .O(Mux2xBits16_inst4_O)
);
Mux2xBits16 Mux2xBits16_inst5 (
    .I0(const_15_16_out),
    .I1(SRAM_RDATA),
    .S(magma_Bits_3_eq_inst21_out),
    .O(Mux2xBits16_inst5_O)
);
Mux2xBits16 Mux2xBits16_inst6 (
    .I0(const_10066_16_out),
    .I1(Mux2xBits16_inst4_O),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits16_inst6_O)
);
Mux2xBits16 Mux2xBits16_inst7 (
    .I0(Mux2xBits16_inst5_O),
    .I1(const_15_16_out),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits16_inst7_O)
);
Mux2xBits16 Mux2xBits16_inst8 (
    .I0(Mux2xBits16_inst6_O),
    .I1(const_10066_16_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits16_inst8_O)
);
Mux2xBits16 Mux2xBits16_inst9 (
    .I0(Mux2xBits16_inst0_O),
    .I1(Mux2xBits16_inst3_O),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits16_inst9_O)
);
Mux2xBits1 Mux2xBits1_inst0 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst3_out),
    .S(magma_Bits_1_eq_inst5_out),
    .O(Mux2xBits1_inst0_O)
);
Mux2xBits1 Mux2xBits1_inst1 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst4_out),
    .S(magma_Bit_not_inst0_out),
    .O(Mux2xBits1_inst1_O)
);
Mux2xBits1 Mux2xBits1_inst10 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst11_out),
    .S(magma_Bits_1_eq_inst13_out),
    .O(Mux2xBits1_inst10_O)
);
Mux2xBits1 Mux2xBits1_inst11 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst12_out),
    .S(magma_Bits_1_eq_inst14_out),
    .O(Mux2xBits1_inst11_O)
);
Mux2xBits1 Mux2xBits1_inst12 (
    .I0(magma_Bits_1_not_inst2_out),
    .I1(Mux2xBits1_inst11_O),
    .S(magma_Bits_3_eq_inst21_out),
    .O(Mux2xBits1_inst12_O)
);
Mux2xBits1 Mux2xBits1_inst13 (
    .I0(Mux2xBits1_inst12_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits1_inst13_O)
);
Mux2xBits1 Mux2xBits1_inst14 (
    .I0(magma_Bits_1_not_inst0_out),
    .I1(Mux2xBits1_inst10_O),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits1_inst14_O)
);
Mux2xBits1 Mux2xBits1_inst15 (
    .I0(Mux2xBits1_inst13_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits1_inst15_O)
);
Mux2xBits1 Mux2xBits1_inst16 (
    .I0(Mux2xBits1_inst14_O),
    .I1(Mux2xBits1_inst9_O),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits1_inst16_O)
);
Mux2xBits1 Mux2xBits1_inst17 (
    .I0(Mux2xBits1_inst15_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits1_inst17_O)
);
Mux2xBits1 Mux2xBits1_inst18 (
    .I0(Mux2xBits1_inst16_O),
    .I1(Mux2xBits1_inst8_O),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits1_inst18_O)
);
Mux2xBits1 Mux2xBits1_inst19 (
    .I0(Mux2xBits1_inst17_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits1_inst19_O)
);
Mux2xBits1 Mux2xBits1_inst2 (
    .I0(const_1_1_out),
    .I1(Mux2xBits1_inst1_O),
    .S(magma_Bits_1_eq_inst6_out),
    .O(Mux2xBits1_inst2_O)
);
Mux2xBits1 Mux2xBits1_inst20 (
    .I0(magma_Bits_1_not_inst1_out),
    .I1(Mux2xBits1_inst7_O),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits1_inst20_O)
);
Mux2xBits1 Mux2xBits1_inst21 (
    .I0(Mux2xBits1_inst18_O),
    .I1(magma_Bits_1_not_inst0_out),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits1_inst21_O)
);
Mux2xBits1 Mux2xBits1_inst22 (
    .I0(Mux2xBits1_inst19_O),
    .I1(Mux2xBits1_inst3_O),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits1_inst22_O)
);
Mux2xBits1 Mux2xBits1_inst23 (
    .I0(Mux2xBits1_inst20_O),
    .I1(magma_Bits_1_not_inst1_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits1_inst23_O)
);
Mux2xBits1 Mux2xBits1_inst24 (
    .I0(Mux2xBits1_inst21_O),
    .I1(magma_Bits_1_not_inst0_out),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits1_inst24_O)
);
Mux2xBits1 Mux2xBits1_inst25 (
    .I0(Mux2xBits1_inst22_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits1_inst25_O)
);
Mux2xBits1 Mux2xBits1_inst26 (
    .I0(Mux2xBits1_inst23_O),
    .I1(Mux2xBits1_inst2_O),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits1_inst26_O)
);
Mux2xBits1 Mux2xBits1_inst27 (
    .I0(Mux2xBits1_inst24_O),
    .I1(magma_Bits_1_not_inst0_out),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits1_inst27_O)
);
Mux2xBits1 Mux2xBits1_inst28 (
    .I0(Mux2xBits1_inst25_O),
    .I1(magma_Bits_1_not_inst2_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits1_inst28_O)
);
Mux2xBits1 Mux2xBits1_inst29 (
    .I0(Mux2xBits1_inst26_O),
    .I1(magma_Bits_1_not_inst1_out),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits1_inst29_O)
);
Mux2xBits1 Mux2xBits1_inst3 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst5_out),
    .S(magma_Bits_1_eq_inst9_out),
    .O(Mux2xBits1_inst3_O)
);
Mux2xBits1 Mux2xBits1_inst30 (
    .I0(Mux2xBits1_inst27_O),
    .I1(Mux2xBits1_inst0_O),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits1_inst30_O)
);
Mux2xBits1 Mux2xBits1_inst4 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst8_out),
    .S(magma_Bits_3_eq_inst17_out),
    .O(Mux2xBits1_inst4_O)
);
Mux2xBits1 Mux2xBits1_inst5 (
    .I0(Mux2xBits1_inst4_O),
    .I1(magma_Bits_1_not_inst7_out),
    .S(magma_Bits_3_eq_inst16_out),
    .O(Mux2xBits1_inst5_O)
);
Mux2xBits1 Mux2xBits1_inst6 (
    .I0(Mux2xBits1_inst5_O),
    .I1(magma_Bits_1_not_inst6_out),
    .S(magma_Bits_3_eq_inst15_out),
    .O(Mux2xBits1_inst6_O)
);
Mux2xBits1 Mux2xBits1_inst7 (
    .I0(const_1_1_out),
    .I1(Mux2xBits1_inst6_O),
    .S(magma_Bits_1_eq_inst10_out),
    .O(Mux2xBits1_inst7_O)
);
Mux2xBits1 Mux2xBits1_inst8 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst9_out),
    .S(magma_Bits_1_eq_inst11_out),
    .O(Mux2xBits1_inst8_O)
);
Mux2xBits1 Mux2xBits1_inst9 (
    .I0(const_1_1_out),
    .I1(magma_Bits_1_not_inst10_out),
    .S(magma_Bits_1_eq_inst12_out),
    .O(Mux2xBits1_inst9_O)
);
Mux2xBits3 Mux2xBits3_inst0 (
    .I0(const_2_3_out),
    .I1(const_1_3_out),
    .S(magma_Bits_1_eq_inst1_out),
    .O(Mux2xBits3_inst0_O)
);
Mux2xBits3 Mux2xBits3_inst1 (
    .I0(const_0_3_out),
    .I1(Mux2xBits3_inst0_O),
    .S(magma_Bits_3_eq_inst0_out),
    .O(Mux2xBits3_inst1_O)
);
Mux2xBits3 Mux2xBits3_inst10 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst9_O),
    .S(magma_Bits_1_eq_inst5_out),
    .O(Mux2xBits3_inst10_O)
);
Mux2xBits3 Mux2xBits3_inst11 (
    .I0(state_reg_O),
    .I1(const_1_3_out),
    .S(magma_Bits_3_eq_inst9_out),
    .O(Mux2xBits3_inst11_O)
);
Mux2xBits3 Mux2xBits3_inst12 (
    .I0(const_1_3_out),
    .I1(Mux2xBits3_inst11_O),
    .S(magma_Bits_1_eq_inst7_out),
    .O(Mux2xBits3_inst12_O)
);
Mux2xBits3 Mux2xBits3_inst13 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst12_O),
    .S(magma_Bits_3_eq_inst8_out),
    .O(Mux2xBits3_inst13_O)
);
Mux2xBits3 Mux2xBits3_inst14 (
    .I0(Mux2xBits3_inst13_O),
    .I1(const_2_3_out),
    .S(magma_Bits_3_eq_inst11_out),
    .O(Mux2xBits3_inst14_O)
);
Mux2xBits3 Mux2xBits3_inst15 (
    .I0(const_2_3_out),
    .I1(Mux2xBits3_inst14_O),
    .S(magma_Bits_1_eq_inst8_out),
    .O(Mux2xBits3_inst15_O)
);
Mux2xBits3 Mux2xBits3_inst16 (
    .I0(Mux2xBits3_inst13_O),
    .I1(Mux2xBits3_inst15_O),
    .S(magma_Bits_3_eq_inst10_out),
    .O(Mux2xBits3_inst16_O)
);
Mux2xBits3 Mux2xBits3_inst17 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst16_O),
    .S(magma_Bit_not_inst0_out),
    .O(Mux2xBits3_inst17_O)
);
Mux2xBits3 Mux2xBits3_inst18 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst17_O),
    .S(magma_Bits_1_eq_inst6_out),
    .O(Mux2xBits3_inst18_O)
);
Mux2xBits3 Mux2xBits3_inst19 (
    .I0(state_reg_O),
    .I1(const_3_3_out),
    .S(magma_Bits_1_eq_inst9_out),
    .O(Mux2xBits3_inst19_O)
);
Mux2xBits3 Mux2xBits3_inst2 (
    .I0(const_2_3_out),
    .I1(const_1_3_out),
    .S(magma_Bits_1_eq_inst2_out),
    .O(Mux2xBits3_inst2_O)
);
Mux2xBits3 Mux2xBits3_inst20 (
    .I0(state_reg_O),
    .I1(const_6_3_out),
    .S(magma_Bits_3_eq_inst17_out),
    .O(Mux2xBits3_inst20_O)
);
Mux2xBits3 Mux2xBits3_inst21 (
    .I0(Mux2xBits3_inst20_O),
    .I1(const_4_3_out),
    .S(magma_Bits_3_eq_inst16_out),
    .O(Mux2xBits3_inst21_O)
);
Mux2xBits3 Mux2xBits3_inst22 (
    .I0(Mux2xBits3_inst21_O),
    .I1(const_1_3_out),
    .S(magma_Bits_3_eq_inst15_out),
    .O(Mux2xBits3_inst22_O)
);
Mux2xBits3 Mux2xBits3_inst23 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst22_O),
    .S(magma_Bits_1_eq_inst10_out),
    .O(Mux2xBits3_inst23_O)
);
Mux2xBits3 Mux2xBits3_inst24 (
    .I0(state_reg_O),
    .I1(const_5_3_out),
    .S(magma_Bits_1_eq_inst11_out),
    .O(Mux2xBits3_inst24_O)
);
Mux2xBits3 Mux2xBits3_inst25 (
    .I0(state_reg_O),
    .I1(const_7_3_out),
    .S(magma_Bits_1_eq_inst12_out),
    .O(Mux2xBits3_inst25_O)
);
Mux2xBits3 Mux2xBits3_inst26 (
    .I0(state_reg_O),
    .I1(const_3_3_out),
    .S(magma_Bits_1_eq_inst13_out),
    .O(Mux2xBits3_inst26_O)
);
Mux2xBits3 Mux2xBits3_inst27 (
    .I0(state_reg_O),
    .I1(const_3_3_out),
    .S(magma_Bits_1_eq_inst14_out),
    .O(Mux2xBits3_inst27_O)
);
Mux2xBits3 Mux2xBits3_inst28 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst27_O),
    .S(magma_Bits_3_eq_inst21_out),
    .O(Mux2xBits3_inst28_O)
);
Mux2xBits3 Mux2xBits3_inst29 (
    .I0(Mux2xBits3_inst28_O),
    .I1(Mux2xBits3_inst26_O),
    .S(magma_Bits_3_eq_inst20_out),
    .O(Mux2xBits3_inst29_O)
);
Mux2xBits3 Mux2xBits3_inst3 (
    .I0(Mux2xBits3_inst1_O),
    .I1(Mux2xBits3_inst2_O),
    .S(magma_Bits_3_eq_inst1_out),
    .O(Mux2xBits3_inst3_O)
);
Mux2xBits3 Mux2xBits3_inst30 (
    .I0(Mux2xBits3_inst29_O),
    .I1(Mux2xBits3_inst25_O),
    .S(magma_Bits_3_eq_inst19_out),
    .O(Mux2xBits3_inst30_O)
);
Mux2xBits3 Mux2xBits3_inst31 (
    .I0(Mux2xBits3_inst30_O),
    .I1(Mux2xBits3_inst24_O),
    .S(magma_Bits_3_eq_inst18_out),
    .O(Mux2xBits3_inst31_O)
);
Mux2xBits3 Mux2xBits3_inst32 (
    .I0(Mux2xBits3_inst31_O),
    .I1(Mux2xBits3_inst23_O),
    .S(magma_Bits_3_eq_inst14_out),
    .O(Mux2xBits3_inst32_O)
);
Mux2xBits3 Mux2xBits3_inst33 (
    .I0(Mux2xBits3_inst32_O),
    .I1(Mux2xBits3_inst19_O),
    .S(magma_Bits_3_eq_inst13_out),
    .O(Mux2xBits3_inst33_O)
);
Mux2xBits3 Mux2xBits3_inst34 (
    .I0(Mux2xBits3_inst33_O),
    .I1(Mux2xBits3_inst18_O),
    .S(magma_Bits_3_eq_inst7_out),
    .O(Mux2xBits3_inst34_O)
);
Mux2xBits3 Mux2xBits3_inst35 (
    .I0(Mux2xBits3_inst34_O),
    .I1(Mux2xBits3_inst10_O),
    .S(magma_Bits_3_eq_inst2_out),
    .O(Mux2xBits3_inst35_O)
);
Mux2xBits3 Mux2xBits3_inst4 (
    .I0(state_reg_O),
    .I1(const_1_3_out),
    .S(magma_Bits_3_eq_inst4_out),
    .O(Mux2xBits3_inst4_O)
);
Mux2xBits3 Mux2xBits3_inst5 (
    .I0(const_1_3_out),
    .I1(Mux2xBits3_inst4_O),
    .S(magma_Bits_1_eq_inst3_out),
    .O(Mux2xBits3_inst5_O)
);
Mux2xBits3 Mux2xBits3_inst6 (
    .I0(state_reg_O),
    .I1(Mux2xBits3_inst5_O),
    .S(magma_Bits_3_eq_inst3_out),
    .O(Mux2xBits3_inst6_O)
);
Mux2xBits3 Mux2xBits3_inst7 (
    .I0(Mux2xBits3_inst6_O),
    .I1(const_2_3_out),
    .S(magma_Bits_3_eq_inst6_out),
    .O(Mux2xBits3_inst7_O)
);
Mux2xBits3 Mux2xBits3_inst8 (
    .I0(const_2_3_out),
    .I1(Mux2xBits3_inst7_O),
    .S(magma_Bits_1_eq_inst4_out),
    .O(Mux2xBits3_inst8_O)
);
Mux2xBits3 Mux2xBits3_inst9 (
    .I0(Mux2xBits3_inst6_O),
    .I1(Mux2xBits3_inst8_O),
    .S(magma_Bits_3_eq_inst5_out),
    .O(Mux2xBits3_inst9_O)
);
Memory SRAM (
    .RADDR(const_13_11_out),
    .RDATA(SRAM_RDATA),
    .CLK(CLK),
    .WADDR(Mux2xBits11_inst7_O),
    .WDATA(Mux2xBits16_inst23_O),
    .WE(bit_const_1_None_out)
);
corebit_const #(
    .value(1'b1)
) bit_const_1_None (
    .out(bit_const_1_None_out)
);
coreir_const #(
    .value(1'h0),
    .width(1)
) const_0_1 (
    .out(const_0_1_out)
);
coreir_const #(
    .value(3'h0),
    .width(3)
) const_0_3 (
    .out(const_0_3_out)
);
coreir_const #(
    .value(16'h2752),
    .width(16)
) const_10066_16 (
    .out(const_10066_16_out)
);
coreir_const #(
    .value(11'h00d),
    .width(11)
) const_13_11 (
    .out(const_13_11_out)
);
coreir_const #(
    .value(16'h000d),
    .width(16)
) const_13_16 (
    .out(const_13_16_out)
);
coreir_const #(
    .value(16'h000f),
    .width(16)
) const_15_16 (
    .out(const_15_16_out)
);
coreir_const #(
    .value(16'h0010),
    .width(16)
) const_16_16 (
    .out(const_16_16_out)
);
coreir_const #(
    .value(1'h1),
    .width(1)
) const_1_1 (
    .out(const_1_1_out)
);
coreir_const #(
    .value(16'h0001),
    .width(16)
) const_1_16 (
    .out(const_1_16_out)
);
coreir_const #(
    .value(3'h1),
    .width(3)
) const_1_3 (
    .out(const_1_3_out)
);
coreir_const #(
    .value(3'h2),
    .width(3)
) const_2_3 (
    .out(const_2_3_out)
);
coreir_const #(
    .value(3'h3),
    .width(3)
) const_3_3 (
    .out(const_3_3_out)
);
coreir_const #(
    .value(3'h4),
    .width(3)
) const_4_3 (
    .out(const_4_3_out)
);
coreir_const #(
    .value(3'h5),
    .width(3)
) const_5_3 (
    .out(const_5_3_out)
);
coreir_const #(
    .value(11'h042),
    .width(11)
) const_66_11 (
    .out(const_66_11_out)
);
coreir_const #(
    .value(3'h6),
    .width(3)
) const_6_3 (
    .out(const_6_3_out)
);
coreir_const #(
    .value(3'h7),
    .width(3)
) const_7_3 (
    .out(const_7_3_out)
);
Register_unq1 initreg (
    .I(const_0_1_out),
    .O(initreg_O),
    .CLK(CLK)
);
corebit_not magma_Bit_not_inst0 (
    .in(magma_Bits_3_eq_inst12_out),
    .out(magma_Bit_not_inst0_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst0 (
    .in0(initreg_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst0_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst1 (
    .in0(const_0_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst1_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst10 (
    .in0(CommandFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst10_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst11 (
    .in0(DataFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst11_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst12 (
    .in0(DataFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst12_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst13 (
    .in0(DataFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst13_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst14 (
    .in0(DataToClient_ready_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst14_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst2 (
    .in0(const_1_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst2_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst3 (
    .in0(const_0_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst3_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst4 (
    .in0(const_1_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst4_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst5 (
    .in0(DataFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst5_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst6 (
    .in0(CommandFromClient_valid_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst6_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst7 (
    .in0(const_0_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst7_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst8 (
    .in0(const_1_1_out),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst8_out)
);
coreir_eq #(
    .width(1)
) magma_Bits_1_eq_inst9 (
    .in0(DataToClient_ready_O),
    .in1(const_1_1_out),
    .out(magma_Bits_1_eq_inst9_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst0 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst0_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst1 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst1_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst10 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst10_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst11 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst11_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst12 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst12_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst2 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst2_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst3 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst3_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst4 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst4_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst5 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst5_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst6 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst6_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst7 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst7_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst8 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst8_out)
);
coreir_not #(
    .width(1)
) magma_Bits_1_not_inst9 (
    .in(const_1_1_out),
    .out(magma_Bits_1_not_inst9_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst0 (
    .in0(state_reg_O),
    .in1(const_0_3_out),
    .out(magma_Bits_3_eq_inst0_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst1 (
    .in0(state_reg_O),
    .in1(const_1_3_out),
    .out(magma_Bits_3_eq_inst1_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst10 (
    .in0(state_reg_O),
    .in1(const_1_3_out),
    .out(magma_Bits_3_eq_inst10_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst11 (
    .in0(const_2_3_out),
    .in1(CommandFromClient_O),
    .out(magma_Bits_3_eq_inst11_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst12 (
    .in0(Mux2xBits3_inst16_O),
    .in1(state_reg_O),
    .out(magma_Bits_3_eq_inst12_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst13 (
    .in0(state_reg_O),
    .in1(const_2_3_out),
    .out(magma_Bits_3_eq_inst13_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst14 (
    .in0(state_reg_O),
    .in1(const_3_3_out),
    .out(magma_Bits_3_eq_inst14_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst15 (
    .in0(CommandFromClient_O),
    .in1(const_1_3_out),
    .out(magma_Bits_3_eq_inst15_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst16 (
    .in0(CommandFromClient_O),
    .in1(const_3_3_out),
    .out(magma_Bits_3_eq_inst16_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst17 (
    .in0(CommandFromClient_O),
    .in1(const_4_3_out),
    .out(magma_Bits_3_eq_inst17_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst18 (
    .in0(state_reg_O),
    .in1(const_4_3_out),
    .out(magma_Bits_3_eq_inst18_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst19 (
    .in0(state_reg_O),
    .in1(const_6_3_out),
    .out(magma_Bits_3_eq_inst19_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst2 (
    .in0(Mux2xBits3_inst3_O),
    .in1(const_2_3_out),
    .out(magma_Bits_3_eq_inst2_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst20 (
    .in0(state_reg_O),
    .in1(const_7_3_out),
    .out(magma_Bits_3_eq_inst20_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst21 (
    .in0(state_reg_O),
    .in1(const_5_3_out),
    .out(magma_Bits_3_eq_inst21_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst3 (
    .in0(state_reg_O),
    .in1(const_0_3_out),
    .out(magma_Bits_3_eq_inst3_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst4 (
    .in0(const_2_3_out),
    .in1(const_0_3_out),
    .out(magma_Bits_3_eq_inst4_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst5 (
    .in0(state_reg_O),
    .in1(const_1_3_out),
    .out(magma_Bits_3_eq_inst5_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst6 (
    .in0(const_2_3_out),
    .in1(const_0_3_out),
    .out(magma_Bits_3_eq_inst6_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst7 (
    .in0(Mux2xBits3_inst3_O),
    .in1(const_1_3_out),
    .out(magma_Bits_3_eq_inst7_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst8 (
    .in0(state_reg_O),
    .in1(const_0_3_out),
    .out(magma_Bits_3_eq_inst8_out)
);
coreir_eq #(
    .width(3)
) magma_Bits_3_eq_inst9 (
    .in0(const_2_3_out),
    .in1(CommandFromClient_O),
    .out(magma_Bits_3_eq_inst9_out)
);
Register_unq2 mem_addr_reg (
    .I(Mux2xBits16_inst24_O),
    .O(mem_addr_reg_O),
    .CE(Mux2xBit_inst19_O),
    .CLK(CLK)
);
Register_unq2 mem_data_reg (
    .I(DataFromClient_O),
    .O(mem_data_reg_O),
    .CE(bit_const_1_None_out),
    .CLK(CLK)
);
Register_unq2 redundancy_reg (
    .I(Mux2xBits16_inst26_O),
    .O(redundancy_reg_O),
    .CE(Mux2xBit_inst23_O),
    .CLK(CLK)
);
Register state_reg (
    .I(Mux2xBits3_inst35_O),
    .O(state_reg_O),
    .CLK(CLK)
);
assign receive_ready = DataFromClient_ready_O;
assign offer_ready = CommandFromClient_ready_O;
assign send = DataToClient_O;
assign send_valid = DataToClient_valid_O;
assign current_state = state_reg_O;
endmodule

