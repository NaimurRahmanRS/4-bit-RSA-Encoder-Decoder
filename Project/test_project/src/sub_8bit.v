module sub_8bit(
    input wire[7:0] a,
    input wire[7:0] b,
    output wire[7:0] sub
);

    wire cout;
    adder_8bit add(a, (~b), 1'b1, sub, cout);

endmodule