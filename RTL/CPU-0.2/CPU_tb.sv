module CPU_tb();

    logic clk, rst;

    CPU_02 u0(.clk(clk), .rst(rst));

    initial begin
        rst = 1;
        clk = 1;
        #1
        rst = 0;
        #100 $finish;
    end

    always begin
        #1 clk = ~clk;
    end

endmodule
