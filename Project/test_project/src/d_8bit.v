module d_8bit(
    //input wire clk,
    input wire sel,
    input wire [7:0] load,
    input wire [7:0] D,
    output wire [7:0] Q
);

	d_1bit d7(sel, load[7], D[7], Q[7]);
	d_1bit d6(sel, load[6], D[6], Q[6]);
	d_1bit d5(sel, load[5], D[5], Q[5]);
	d_1bit d4(sel, load[4], D[4], Q[4]);
    d_1bit d3(sel, load[3], D[3], Q[3]);
    d_1bit d2(sel, load[2], D[2], Q[2]);
    d_1bit d1(sel, load[1], D[1], Q[1]);
    d_1bit d0(sel, load[0], D[0], Q[0]);

endmodule