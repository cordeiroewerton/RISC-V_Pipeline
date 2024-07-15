module freq_div(input logic clk_in, output logic clk_out = 0);
  
  parameter div = 50000000/2;
  int clk_temp=0;

  always@(posedge clk_in) begin
    if(clk_temp == div) begin
	   clk_out = ~clk_out;
		clk_temp = 0;
	 end
	 else begin
	   clk_temp = clk_temp + 1;
	 end

  end
endmodule