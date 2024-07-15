module CPU_tb();

    logic clk, rst;

    CPU_01 u0(.clk(clk), .rst(rst));

    initial begin
        rst = 1;
        clk = 0;
        #2
        rst = 0;
        #100 $finish;
    end

    always begin
        #1 clk = ~clk;
    end

endmodule