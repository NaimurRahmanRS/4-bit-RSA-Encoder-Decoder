//Using D Flip flops as memory elements

module d_1bit_2(
    input wire clk,
    input wire sel,
    input wire load,
    output reg Q
);

    always @(posedge clk) begin
        if (sel)
            Q <= load;
    end

endmodule