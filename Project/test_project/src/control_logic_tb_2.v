module ControlLogic_tb2();
    reg strt_clk, clk, reset;
    reg e, d, De, En, init;
    reg H1, H4, H6, H8, H9, H12, H13, H14, H15;
    //wire D3, D2, D1, D0;
	wire [15:0] current_state;
	wire load, mul, dec, gcd, cmp, mod, pow, out, sel, inc;
    // Instantiate the ControlLogic module
    ControlLogic uut(
        .clk(clk),
        .reset(reset),
        .e(e), .d(d), .De(De), .En(En), .init(init),
        .H1(H1), .H4(H4), .H6(H6), .H8(H8), .H9(H9),
        .H12(H12), .H13(H13), .H14(H14), .H15(H15),
        //.D3(D3), .D2(D2), .D1(D1), .D0(D0),
		.current_state(current_state),
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
        reset = 1; e = 0; d = 0; De = 0; En = 0; init = 0;
        H1 = 0; H4 = 0; H6 = 0; H8 = 0; H9 = 0; H12 = 0; H13 = 0; H14 = 0; H15 = 0;	
		strt_clk = 0;
		#10 strt_clk = 1;
        #10 reset = 0; init = 0; // s0
		#10 init = 1;
        #10 init = 0;   // s2
		#10	H1 = 1; 
        #10 H1 = 0;             // s3
		#10                     // s4  
        #10 H4 = 0;             // s5
		#10 H4 = 1;             // s6
		#10	H4 = 0;
        #10 H6 = 1;             // s7
		#10 H6 = 0;	e = 1;		// s8
        #10 H8 = 1;             // s9
        #10 H9 = 1; H8 = 0;     // s10
        #10 d = 0; H9 = 0;      // s11
		#10 H8 = 1;
		#10 H9 = 1; H8 = 0;
		#10 d = 1; H9 = 0;
        #10 En = 1;             // s12
        #10 H12 = 1; En = 0;    // s13
        #10 H13 = 1; De = 1; H12 = 0;    // s14
        #10 H14 = 1; De = 0; H13 = 0;   // s15
        #10 H15 = 1; H14 = 0;           // s0
		#10 H15 = 0;

        #50 $finish;            // End simulation
    end

    // Monitor outputs
    initial begin
        //$monitor("Time=%0t | D3=%b, D2=%b, D1=%b, D0=%b", $time, D3, D2, D1, D0);
    end
endmodule
