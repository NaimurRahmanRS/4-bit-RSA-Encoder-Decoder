module ControlLogic_tb();
    reg clk, reset, strt_clk;
    reg e, d, De, En, init;
    reg H1, H4, H6, H8, H9, H12, H13, H14, H15;
	reg [3:0] A;
    reg [3:0] B;
	reg [7:0] i;
	
    wire [7:0] Ac,N,pq,ac,g;
	wire [3:0] p,q;
	wire [15:0] current_state;
	wire H1_wire,H4_wire,H6_wire,e_wire;
	
	ALU uut_alu(    
	.clk(clk), .reset(reset), .strt_clk(strt_clk),
    .e(e), .d(d), .De(De), .En(En), .init(init),
    .H1(H1), .H4(H4), .H6(H6), .H8(H8), .H9(H9), .H12(H12), .H13(H13), .H14(H14), .H15(H15),
	.A(A),
	.B(B),
	.Ac(Ac),
	.N(N),
	.pq(pq),
	.ac(ac),
	.g(g),
	.i(i),
	.p(p),
	.q(q),
	.current_state(current_state),
	.H1_wire(H1_wire),
	.H4_wire(H4_wire),
	.H6_wire(H6_wire),
	.e_wire(e_wire),
	.load(load), .mul(mul), .dec(dec), .gcd(gcd), .cmp(cmp), .mod(mod), .pow(pow), .out(out), .sel(sel), .inc(inc)
	);
    // Clock generation: Only positive edge matters
	always @(posedge strt_clk)
		begin
			while(strt_clk)
			begin
				#5 clk <=0;
				#5 clk <=1;
			end
		end

    // Test sequence
    initial begin
        // Initialize inputs
        reset = 1; e = 0; d = 0; De = 0; En = 0; init = 0; i = 8'b00000010;
        H1 = 0; 
		H4 = 0; H6 = 0; H8 = 0; H9 = 0; H12 = 0; H13 = 0; H14 = 0; H15 = 0;	
		strt_clk = 0;
		#10 strt_clk = 1;
        #10 reset = 0; init = 0; // s0
		#10 init = 1;
        #10 init = 0;   		// s2
		$monitor("Time = %0d | A = %b, B = %b, P = %b", $time, A, B, Ac);
        A = 4'b0011; B = 4'b0101;  // 3 * 5 = 15
		#10	H1 = H1_wire; 
        #10 H1 = 0;             // s3
		#10                     // s4  
        #10 H4 = 0;             // s5
		#10 H4 = H4_wire;       // s6
		#10						  
        #10 H6 = 1;             // s7
		#10 H6 = 0;	e = e_wire;		// s8
		#10
        #10 H8 = 1;             // s9
        #10 H9 = 1; H8 = 0;     // s10
        #10 d = 0; H9 = 0;      // s11
        #10 En = 1;             // s12
        #10 H12 = 1; En = 0;    // s13
        #10 H13 = 1; De = 1;    // s14
        #10 H14 = 1; De = 0;    // s15
        #10 H15 = 1;            // s0

        #50 $finish;            // End simulation
    end

    // Monitor outputs
    initial begin
        //$monitor("Time=%0t | D3=%b, D2=%b, D1=%b, D0=%b", $time, D3, D2, D1, D0);
    end
endmodule
