module Cont_M10(input logic clk, rst, output logic [3:0] cont);

    always@(posedge clk)begin
    if(rst == 0) begin
        cont = 0;
    end
    else
        if(cont < 9) begin
        cont = cont + 1;
        end
        else begin
        cont = 0;
        end
    end
endmodule