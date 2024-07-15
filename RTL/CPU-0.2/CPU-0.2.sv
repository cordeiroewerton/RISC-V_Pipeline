module CPU_02(input logic clk, rst); //Definir as entradas

	logic [31:0] w_Inst;
	logic [7:0] w_PC, w_PCp4, w_rd2, w_SrcB, w_rd1SrcA, w_ULAResult, w_Wd3, w_Imm, w_RData, w_ImmPC, w_PCn;
	logic [2:0] w_ULAControl;
	logic [1:0] w_ImmSrc;
	logic w_ULASrc, w_RegWrite, w_MemWrite, w_ResultSrc, w_PCSrc, w_Zero, w_Branch; 
	logic [7:0] reg_aux [7:0]; 

	PC pc0(.PCin(w_PCn), .PC(w_PC), .clk(clk), .rst(rst));
	Instr_Mem IM0(.A(w_PC), .RD(w_Inst));
	Control_Unit CU0(.Op(w_Inst[6:0]), .Funct3(w_Inst[14:12]), .Funct7(w_Inst[31:25]), .ResultSrc(w_ResultSrc), .MemWrite(w_MemWrite), .ULAControl(w_ULAControl), .ULASrc(w_ULASrc), .ImmSrc(w_ImmSrc), .regWrite(w_RegWrite), .Branch(w_Branch));
	RegisterFile RF0(.clk(clk), .rst(rst), .ra1(w_Inst[19:15]), .ra2(w_Inst[24:20]), .wa3(w_Inst[11:7]), .wd3(w_Wd3), .we3(w_RegWrite), .rd1(w_rd1SrcA), .rd2(w_rd2),
	.S0(reg_aux[0]), .S1(reg_aux[1]), .S2(reg_aux[2]), .S3(reg_aux[3]), .S4(reg_aux[4]), .S5(reg_aux[5]), .S6(reg_aux[6]), .S7(reg_aux[7]));
	ULA ula0(.ULAControl(w_ULAControl), .SrcA(w_rd1SrcA), .SrcB(w_SrcB), .ULAResult(w_ULAResult), .Z(w_Zero));
	Data_Mem DM0(.clk(clk), .rst(rst), .A(w_ULAResult), .WE(w_MemWrite), .RD(w_RData), .WD(w_rd2));
	
	assign w_Wd3 = w_ResultSrc ? w_RData : w_ULAResult;
	assign w_PCSrc = w_Branch & w_Zero;
	assign w_SrcB = w_ULASrc ? w_Imm : w_rd2;
	assign w_PCp4 = w_PC + 4;
	assign w_PCn = w_PCSrc ? w_ImmPC : w_PCp4;
	always_comb begin
		case(w_ImmSrc)
			2'b00: w_Imm = w_Inst[31:20];
			2'b01: w_Imm = {w_Inst[31:25], w_Inst[11:7]};
			2'b10: w_Imm = {w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0};
			default: w_Imm = 0;
		endcase
	end
	assign w_ImmPC = w_PC + w_Imm;

endmodule
