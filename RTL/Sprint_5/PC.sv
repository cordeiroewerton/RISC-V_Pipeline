module PC(input logic rst, clk, input logic [7:0] PCin, output logic[7:0] PC);

	always_ff@(posedge clk) begin
		PC <= rst ? 0 : PCin;
	end

endmodule 
