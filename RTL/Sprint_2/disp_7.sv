module decod(input logic [3:0] in1, output logic[6:0] out1);

    always@(in1) begin
    case(in1)
        0: begin
        out1 = ~7'b0111111;// [0, 1, 1, 1, 1, 1, 1];
        end
        1: begin
        out1 = ~7'b0000110;// [0, 0, 0, 0, 1, 1, 0];
        end
        2: begin
        out1 = ~7'b1011011;// [1, 0, 1, 1, 0, 1, 1];
        end
        3: begin
        out1 = ~7'b1001111;// [1, 0, 0, 1, 1, 1, 1];
        end
        4: begin
        out1 = ~7'b1100110;// [1, 1, 0, 0, 1, 1, 0];
        end
        5: begin
        out1 = ~7'b1101101;// [1, 1, 0, 1, 1, 0, 1];
        end
        6: begin
        out1 = ~7'b1111101;// [1, 1, 1, 1, 1, 0, 1];
        end
        7: begin
        out1 = ~7'b0000111;// [1, 0, 0, 0, 1, 1, 1];
        end
        8: begin
        out1 = ~7'b1111111;// [1, 1, 1, 1, 1, 1, 1];
        end
        9: begin
        out1 = ~7'b1101111;// [1, 1, 0, 1, 1, 1, 1];
        end
        10: begin
        out1 = ~7'b1110111;// [1, 1, 1, 0, 1, 1, 1];
        end
        11: begin
        out1 = ~7'b1111100;// [1, 1, 1, 1, 1, 0, 0];
        end
        12: begin
        out1 = ~7'b0111001;// [0, 1, 1, 1, 0, 0, 1];
        end
        13: begin
        out1 = ~7'b1011110;// [1, 0, 1, 1, 1, 1, 0];
        end
        14: begin
        out1 = ~7'b1111001;// [1, 1, 1, 1, 0, 0, 1];
        end
        15: begin
        out1 = ~7'b1110001;// [1, 1, 1, 0, 0, 0, 1];
        end
        default: begin
        out1 = ~7'b0000000;// [0, 0, 0, 0, 0, 0, 0];
        end


    endcase
    end
    
endmodule 