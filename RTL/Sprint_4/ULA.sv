module ULA(input logic [7:0] SrcA, SrcB, input logic [2:0] ULAControl, output logic Z, output logic [7:0] ULAResult);
  always_comb begin
    case (ULAControl)
		3'b000: ULAResult = SrcA + SrcB;
		3'b001: ULAResult = SrcA - SrcB;
		3'b010: ULAResult = SrcA & SrcB;
		3'b011: ULAResult = SrcA | SrcB;
		3'b101: begin 
			if(SrcA<SrcB) ULAResult = 1;
			else ULAResult = 0;
		end
		default: ULAResult = 0;
    endcase
	 if (ULAResult == 0) Z = 1;
	 else Z = 0;
  end
endmodule 