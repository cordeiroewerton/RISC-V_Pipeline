module MUX_21(input logic [7:0] A, B, input logic sel, output logic [7:0] Y);

    always_comb begin
        if(sel == 1)
            Y = B;
        else
            Y = A;
    end
endmodule