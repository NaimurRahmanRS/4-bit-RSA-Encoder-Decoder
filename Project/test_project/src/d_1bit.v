//Using D Flip flops as memory elements

module d_1bit(
    //input wire clk,
    input wire sel,
    input wire load,
    input wire D,
    output reg Q
);

    always @(*) begin
        if (sel)
            Q <= load;
        else
            Q <= D;
    end

endmodule