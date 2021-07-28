
`timescale 1 ns / 1 ps

  module ISPPipeline_accel_mul_mul_11ns_12ns_23_4_1_DSP48_0(clk, rst, ce, a, b, p);
input clk;
input rst;
input ce;
input [11 - 1 : 0] a;
input [12 - 1 : 0] b;
output signed [23 - 1 : 0] p;

reg signed [23 - 1 : 0] p_reg; 

reg [11 - 1 : 0] a_reg; 
reg [12 - 1 : 0] b_reg; 

reg signed [23 - 1 : 0] p_reg_tmp; 

always @ (posedge clk) begin
    if (ce) begin
        a_reg <= a;
        b_reg <= b;
        p_reg_tmp <= $signed({1'b0, a_reg}) * $signed({1'b0, b_reg});
        p_reg <= p_reg_tmp;
    end
end

assign p = p_reg;

endmodule
`timescale 1 ns / 1 ps
module ISPPipeline_accel_mul_mul_11ns_12ns_23_4_1(
    clk,
    reset,
    ce,
    din0,
    din1,
    dout);

parameter ID = 32'd1;
parameter NUM_STAGE = 32'd1;
parameter din0_WIDTH = 32'd1;
parameter din1_WIDTH = 32'd1;
parameter dout_WIDTH = 32'd1;
input clk;
input reset;
input ce;
input[din0_WIDTH - 1:0] din0;
input[din1_WIDTH - 1:0] din1;
output[dout_WIDTH - 1:0] dout;



ISPPipeline_accel_mul_mul_11ns_12ns_23_4_1_DSP48_0 ISPPipeline_accel_mul_mul_11ns_12ns_23_4_1_DSP48_0_U(
    .clk( clk ),
    .rst( reset ),
    .ce( ce ),
    .a( din0 ),
    .b( din1 ),
    .p( dout ));

endmodule

