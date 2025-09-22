module ALU(    
	input clk, reset, strt_clk,
    input e, d, De, En, init,
    input H1, H4, H6, H8, H9, H12, H13, H14, H15,
	input [3:0] A,
    input [3:0] B, 
	input [7:0] i,
	
    output [7:0] Ac,N,pq,ac,g,
	output [3:0] p,q,
	output [15:0] current_state,
	output H1_wire,H4_wire,H6_wire,e_wire,	
	output load, mul, dec, gcd, cmp, mod, pow, out, sel, inc
);
	//wire H1_wire;
	//wire load, mul, dec, gcd, cmp, mod, pow, out, sel, inc;	
	wire borrow_A,borrow_B,a_eq_b; 
    ControlLogic uut(
        .clk(clk),
        .reset(reset),
        .e(e), .d(d), .De(De), .En(En), .init(init),
        .H1(H1), .H4(H4), .H6(H6), .H8(H8), .H9(H9),
        .H12(H12), .H13(H13), .H14(H14), .H15(H15),
		.current_state(current_state),
		.load(load), .mul(mul), .dec(dec), .gcd(gcd), .cmp(cmp), .mod(mod), .pow(pow), .out(out), .sel(sel), .inc(inc)
    );
	
    multiplier_4bit uut_mul (
		.Enable(mul),
        .A(A),
        .B(B),
        .P(Ac),
		.H1(H1_wire)
    ); 
	
	register_load dA(
		.load(load), 
		.sel(~sel), 
		.AC(Ac),  
		.N(N)
	);
	
	sub_4bit_1bit saa(
		.DEC(dec),
        .a(A),
        .b(1'b1),
        .diff(p),
        .borrow(borrow_A)
	);
	
	sub_4bit_1bit sbb(
		.DEC(dec),
        .a(B),
        .b(1'b1),
        .diff(q),
        .borrow(borrow_B)
	);
	
	multiplier_4bit uut_mul_2 (
		.Enable(mul),
        .A(p),
        .B(q),
        .P(pq),
		.H1(H4_wire)
    );
	
	register_load dB(
		.load(load), 
		.sel(sel), 
		.AC(pq),  
		.N(ac)
	);
	
	gcd g1(
	.A(ac),
	.B(i),
	.rst(gcd),
	.out(g),
	.H6(H6_wire)
	);
	
	comparator_8bit_equal_basic cmp_uut (
        .a(g),
        .b(1'b1),
		.cmp(cmp),
        .a_eq_b(a_eq_b),
		.e(e_wire)
    );
	
	
endmodule
