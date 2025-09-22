module adder_look_ahead(
    input wire [7:0] p,
    input wire [7:0] g,
    input wire cin,
    output wire [7:0] cout,
    output wire c8
);

    assign cout[0] = cin;
    assign cout[1] = g[0] + (p[0] & cin);
    assign cout[2] = g[1] + (p[1] & g[0]) + (p[1] & p[0] & cin);
    assign cout[3] = g[2] + (p[2] & g[1]) + (p[2] & p[1] & g[0]) + (p[2] & p[1] & p[0] & cin);
    assign cout[4] = g[3] + (p[3] & g[2]) + (p[3] & p[2] & g[1]) + (p[3] & p[2] & p[1] & g[0]) + (p[3] & p[2] & p[1] & p[0] & cin);
	assign cout[5] = g[4] + (p[4] & g[3]) + (p[4] & p[3] & g[2]) + (p[4] & p[3] & p[2] & g[1]) + (p[4] & p[3] & p[2] & p[1] & g[0]) + (p[4] & p[3] & p[2] & p[1] & p[0] & cin);
	assign cout[6] = g[5] + (p[5] & g[4]) + (p[5] & p[4] & g[3]) + (p[5] & p[4] & p[3] & g[2]) + (p[5] & p[4] & p[3] & p[2] & g[1]) + (p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) + (p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & cin);
	assign cout[7] = g[6] + (p[6] & g[5]) + (p[6] & p[5] & g[4]) + (p[6] & p[5] & p[4] & g[3]) + (p[6] & p[5] & p[4] & p[3] & g[2]) + (p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) + (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) + (p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & cin);
	assign c8 = g[7] + (p[7] & g[6]) + (p[7] & p[6] & g[5]) + (p[7] & p[6] & p[5] & g[4]) + (p[7] & p[6] & p[5] & p[4] & g[3]) + (p[7] & p[6] & p[5] & p[4] & p[3] & g[2]) + (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & g[1]) + (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & g[0]) + (p[7] & p[6] & p[5] & p[4] & p[3] & p[2] & p[1] & p[0] & cin);
	
endmodule