module eq_all(
    input wire [7:0] eq,
    output wire Final
);

    assign Final = eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & eq[1] & eq[0];

endmodule