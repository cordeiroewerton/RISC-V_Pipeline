module RegisterFile(input logic[7:0] wd3,
input logic[2:0] wa3, ra1, ra2,
input logic we3, clk, rst,
output logic[7:0] rd1, rd2,
output logic[7:0] S0, S1, S2, S3, S4, S5, S6, S7);

  logic [7:0] register [7:0];

  always_ff @(posedge clk) begin
    if(rst) begin
      register <= '{8{1'b0}};
    end
    else if(we3) begin
      case (wa3)
	     3'b000: register[0] <= wd3;
	     3'b001: register[1] <= wd3;
	     3'b010: register[2] <= wd3;
	     3'b011: register[3] <= wd3;
	     3'b100: register[4] <= wd3;
	     3'b101: register[5] <= wd3;
	     3'b110: register[6] <= wd3;
	     3'b111: register[7] <= wd3;
	   endcase
    end
  end

  always_comb begin
    case (ra1)
	   3'b000: rd1 = register[0];
	   3'b001: rd1 = register[1];
	   3'b010: rd1 = register[2];
	   3'b011: rd1 = register[3];
	   3'b100: rd1 = register[4];
	   3'b101: rd1 = register[5];
	   3'b110: rd1 = register[6];
	   3'b111: rd1 = register[7];
	 endcase
	 case (ra2)
	   3'b000: rd2 = register[0];
	   3'b001: rd2 = register[1];
	   3'b010: rd2 = register[2];
	   3'b011: rd2 = register[3];
	   3'b100: rd2 = register[4];
	   3'b101: rd2 = register[5];
	   3'b110: rd2 = register[6];
	   3'b111: rd2 = register[7];
	 endcase
  end
  assign S0 = register[0];
  assign S1 = register[1];
  assign S2 = register[2];
  assign S3 = register[3];
  assign S4 = register[4];
  assign S5 = register[5];
  assign S6 = register[6];
  assign S7 = register[7];

endmodule 