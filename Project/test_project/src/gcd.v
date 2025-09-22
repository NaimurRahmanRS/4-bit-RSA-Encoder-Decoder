module gcd(
    input wire [7:0] A,
    input wire [7:0] B,
    //input wire clk,
    input wire rst,
    output wire [7:0] out,
	output reg H6 // Declare H6 as reg
);

    wire [7:0] a, b, da, db;
    wire gt, lt, eq;
    wire [7:0] a_minus_b, b_minus_a;
	
    d_8bit dA(rst, A, da, a);
    d_8bit dB(rst, B, db, b);

    comp_8bit c(a, b, gt, lt, eq);
    sub_8bit sab(a, b, a_minus_b);
    sub_8bit sba(b, a, b_minus_a);

    bus_mux ba(a, a_minus_b, gt, da);
    bus_mux bb(b, b_minus_a, lt, db);

    bus_mux bans(8'b0, a, eq, out);
	
	    // Always block for controlling H6
    always @(*) begin
        if (rst) begin
            H6 = 1;
        end else begin
            H6 = 0;
        end
    end
	
endmodule