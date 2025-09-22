module comp_1bit(
    input wire a,
    input wire b,
    output wire gt,
    output wire lt,
    output wire eq
);

    assign gt = a & (~b);
    assign lt = (~a) & b;
    assign eq = ~(a ^ b);

endmodule

