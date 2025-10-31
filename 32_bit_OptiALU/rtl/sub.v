module sub( 
    input  [31:0] a, b,   
    input         en,     
    input         bin,    
    output reg [31:0] result,
    output        bout     
);
    wire [31:0] g, p;         
    wire [32:0] b_chain;      

    assign b_chain[0] = bin;          
    assign g = (~a) & b;              // Borrow generate
    assign p = (~a) | b;              // Borrow propagate ✅

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin : borrow_block
            assign b_chain[i+1] = g[i] | (p[i] & b_chain[i]);
        end
    endgenerate

    always @(*) begin
        if (en)
            result = a ^ b ^ b_chain[31:0]; // Final difference ✅
        else
            result = 32'd0;
    end

    assign bout = b_chain[32];
endmodule
