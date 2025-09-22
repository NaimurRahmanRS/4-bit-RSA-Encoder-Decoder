module d_8bit_2(
    input wire clk,
    input wire sel,
    input wire [7:0] load,
    output wire [7:0] Q
);

	d_1bit_2 d7(clk, sel, load[7], Q[7]);
	d_1bit_2 d6(clk, sel, load[6], Q[6]);
	d_1bit_2 d5(clk, sel, load[5], Q[5]);
	d_1bit_2 d4(clk, sel, load[4], Q[4]);
    d_1bit_2 d3(clk, sel, load[3], Q[3]);
    d_1bit_2 d2(clk, sel, load[2], Q[2]);
    d_1bit_2 d1(clk, sel, load[1], Q[1]);
    d_1bit_2 d0(clk, sel, load[0], Q[0]);

endmodule