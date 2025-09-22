//2x1 Mux, selecting between two 4bit buses

module bus_mux(
    input wire [7:0] i0,
    input wire [7:0] i1,
    input wire sel,
    output wire [7:0] out
);

    assign out = sel ? i1 : i0;

endmodule