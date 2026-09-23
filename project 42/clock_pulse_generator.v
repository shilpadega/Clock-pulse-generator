module clock_pulse_generator #(
    parameter HALF_PERIOD = 5
)(
    input  wire enable,
    output reg  clk_out
);

    initial begin
        clk_out = 1'b0;
    end

    always begin
        if (enable) begin
            #HALF_PERIOD clk_out = ~clk_out;
        end
        else begin
            clk_out = 1'b0;
            #1;
        end
    end

endmodule