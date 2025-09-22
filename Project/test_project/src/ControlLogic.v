module ControlLogic(
    input clk,
    input reset,
    input e, d, De, En, init,
    input H1, H4, H6, H8, H9, H12, H13, H14, H15,
	output reg [15:0] current_state,
	output reg load, mul, dec, gcd, cmp, mod, pow, out, sel, inc
);
    wire [15:0] next_state;  

    Decoder decoder_inst(
        .current_state(current_state),
        .e(e), .d(d), .De(De), .En(En), .init(init),
        .H1(H1), .H4(H4), .H6(H6), .H8(H8), .H9(H9),
        .H12(H12), .H13(H13), .H14(H14), .H15(H15),
        .next_state(next_state),
		.load(load), .mul(mul), .dec(dec), .gcd(gcd), .cmp(cmp), .mod(mod), .pow(pow), .out(out), .sel(sel), .inc(inc)
    );

    // State register update on positive clock edge
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            current_state <= 16'b0000000000000001; // Start at S0
        end else begin
            current_state <= next_state; 
        end
    end

endmodule
