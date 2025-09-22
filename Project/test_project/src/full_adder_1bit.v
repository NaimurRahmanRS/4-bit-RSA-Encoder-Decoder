module full_adder_1bit(
    input wire a,
    input wire b,
    input wire cin,
    output wire g,
    output wire p,
    output wire sum
);
    wire cout;
    half_adder h1(a, b, p, g);
    half_adder h2(p, cin, sum, cout);

endmodule