module look_ahead(
    input wire [7:0] ans,
    input wire [7:0] eq,
    output wire Final
);

	assign Final = ans[7] +
				   (ans[6] & eq[7]) +
				   (ans[5] & eq[7] & eq[6]) +
				   (ans[4] & eq[7] & eq[6] & eq[5]) +
				   (ans[3] & eq[7] & eq[6] & eq[5] & eq[4]) +
                   (ans[2] & eq[7] & eq[6] & eq[5] & eq[4] & eq[3]) +
                   (ans[1] & eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2]) +
                   (ans[0] & eq[7] & eq[6] & eq[5] & eq[4] & eq[3] & eq[2] & eq[1]);

endmodule

