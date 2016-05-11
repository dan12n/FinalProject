module counter_latch (clk, load, out0, out1, out2, out3, out4, out5, out6, out7, out8, out9, out10, out11, out12, out13, out14, out15, out16, out17, out18, out19, out20, out21, out22, out23, out24, out25, out26, out27, out28, out29, out30, out31);

input [4:0] load;
input clk;
input enable;

output reg [4:0] out0;
output reg [4:0] out1;
output reg [4:0] out2;
output reg [4:0] out3;
output reg [4:0] out4;
output reg [4:0] out5;
output reg [4:0] out6;
output reg [4:0] out7;
output reg [4:0] out8;
output reg [4:0] out9;
output reg [4:0] out10;
output reg [4:0] out11;
output reg [4:0] out12;
output reg [4:0] out13;
output reg [4:0] out14;
output reg [4:0] out15;
output reg [4:0] out16;
output reg [4:0] out17;
output reg [4:0] out18;
output reg [4:0] out19;
output reg [4:0] out20;
output reg [4:0] out21;
output reg [4:0] out22;
output reg [4:0] out23;
output reg [4:0] out24;
output reg [4:0] out25;
output reg [4:0] out26;
output reg [4:0] out27;
output reg [4:0] out28;
output reg [4:0] out29;
output reg [4:0] out30;
output reg [4:0] out31;

reg [6:0] count;
initial count = 6'd0;

always (@ posedge clk) begin
	if (count < 6'd32) begin
		if (count == 6'd0) out0 = load;
		else if (count == 6'd1) out1 = load;
		else if (count == 6'd2) out2 = load;
		else if (count == 6'd3) out3 = load;
		else if (count == 6'd4) out4 = load;
		else if (count == 6'd5) out5 = load;
		else if (count == 6'd6) out6 = load;
		else if (count == 6'd7) out7 = load;
		else if (count == 6'd8) out8 = load;
		else if (count == 6'd9) out9 = load;
		else if (count == 6'd10) out10 = load;
		else if (count == 6'd11) out11 = load;
		else if (count == 6'd12) out12 = load;
		else if (count == 6'd13) out13 = load;
		else if (count == 6'd14) out14 = load;
		else if (count == 6'd15) out15 = load;
		else if (count == 6'd16) out16 = load;
		else if (count == 6'd17) out17 = load;
		else if (count == 6'd18) out18 = load;
		else if (count == 6'd19) out19 = load;
		else if (count == 6'd20) out20 = load;
		else if (count == 6'd21) out21 = load;
		else if (count == 6'd22) out22 = load;
		else if (count == 6'd23) out23 = load;
		else if (count == 6'd24) out24 = load;
		else if (count == 6'd25) out25 = load;
		else if (count == 6'd26) out26 = load;
		else if (count == 6'd27) out27 = load;
		else if (count == 6'd28) out28 = load;
		else if (count == 6'd29) out29 = load;
		else if (count == 6'd30) out30 = load;
		else if (count == 6'd31) out310 = load;
		count = count + 6'd1;
		end
	end
endmodule