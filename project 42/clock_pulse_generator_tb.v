`timescale 1ns/1ps

module clock_pulse_generator_tb;

    reg enable;
    wire clk_out;

    clock_pulse_generator #(
        .HALF_PERIOD(5)
    ) uut (
        .enable(enable),
        .clk_out(clk_out)
    );

    initial begin
        enable = 0;

        #10;
        enable = 1;

        #100;
        enable = 0;

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | Enable=%b | Clock=%b",
                 $time, enable, clk_out);
    end

endmodule