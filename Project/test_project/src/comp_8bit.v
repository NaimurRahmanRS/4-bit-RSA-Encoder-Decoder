module comp_8bit(
    input wire [7:0] a,
    input wire [7:0] b,
    output wire gt,
    output wire lt,
    output wire eq
);

    wire [7:0] gtbuff, ltbuff, eqbuff;

    comp_1bit c7(a[7], b[7], gtbuff[7], ltbuff[7], eqbuff[7]);
	comp_1bit c6(a[6], b[6], gtbuff[6], ltbuff[6], eqbuff[6]);
	comp_1bit c5(a[5], b[5], gtbuff[5], ltbuff[5], eqbuff[5]);
	comp_1bit c4(a[4], b[4], gtbuff[4], ltbuff[4], eqbuff[4]);
	comp_1bit c3(a[3], b[3], gtbuff[3], ltbuff[3], eqbuff[3]);
    comp_1bit c2(a[2], b[2], gtbuff[2], ltbuff[2], eqbuff[2]);
    comp_1bit c1(a[1], b[1], gtbuff[1], ltbuff[1], eqbuff[1]);
    comp_1bit c0(a[0], b[0], gtbuff[0], ltbuff[0], eqbuff[0]);

    look_ahead lgt(gtbuff, eqbuff, gt);
    look_ahead llt(ltbuff, eqbuff, lt);
    eq_all e(eqbuff, eq);

endmodule