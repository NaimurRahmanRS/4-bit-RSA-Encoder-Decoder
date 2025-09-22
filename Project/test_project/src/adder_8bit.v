module adder_8bit(
    input wire [7:0] a,
    input wire [7:0] b,
    input wire cin,
    output wire [7:0] sum,
    output wire cout
);

    wire [7:0] p, g, c;
    full_adder_1bit fa7(a[7], b[7], c[7], g[7], p[7], sum[7]);
	full_adder_1bit fa6(a[6], b[6], c[6], g[6], p[6], sum[6]);
	full_adder_1bit fa5(a[5], b[5], c[5], g[5], p[5], sum[5]);
	full_adder_1bit fa4(a[4], b[4], c[4], g[4], p[4], sum[4]);
	full_adder_1bit fa3(a[3], b[3], c[3], g[3], p[3], sum[3]);
    full_adder_1bit fa2(a[2], b[2], c[2], g[2], p[2], sum[2]);
    full_adder_1bit fa1(a[1], b[1], c[1], g[1], p[1], sum[1]);
    full_adder_1bit fa0(a[0], b[0], c[0], g[0], p[0], sum[0]);

    adder_look_ahead l(p, g, cin, c, cout);

endmodule