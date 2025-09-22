//Using D Flip flops as memory elements

module register_load(    
    input wire load,
	input wire sel,
	input wire [7:0] AC,
    output reg [7:0] N
);

    always @(*) begin
        if (load & sel)
            N <= AC;
    end

endmodule