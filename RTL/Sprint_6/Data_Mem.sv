module Data_Mem (
    input logic [7:0] A,      // Endereço de entrada - 8 bits
    input logic [7:0] WD,     // Dados de entrada (escrita) - 8 bits
    output logic [7:0] RD,    // Dados de saída (leitura) - 8 bits
    input logic WE,           // Enable de escrita - 1 bit
    input logic rst,          // Reset da memória - 1 bit
    input logic clk           // Clock de escrita - 1 bit
);

    // Declaração da memória como um array bidimensional
    logic [7:0] mem [0:255];

    // Leitura combinacional
    assign RD = mem[A];

    // Escrita sequencial
    always_ff @(posedge clk) begin
        if (rst) begin
            // Reset: Limpa a memória
            integer i;
            for (i = 0; i < 256; i = i + 1) begin
                mem[i] <= 8'b0;
            end
        end 
        else begin 
            if (WE) begin
                // Escrita: Atualiza a posição especificada
                mem[A] <= WD;
            end
            else begin
                mem[A] <= mem[A];
            end
        end
    end

endmodule
