module equal(
    input [31:0]a,b,
    input en,
    output reg[31:0]result
);
    always @(*) begin
        if(en)begin
            result = (a == b) ? 1 : 0;    
        end else begin
            result = 32'd0;  
        end
    end
endmodule