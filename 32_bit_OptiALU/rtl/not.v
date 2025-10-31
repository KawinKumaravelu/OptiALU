module not_gate(
    input [31:0]a,
    input en,
    output reg[31:0]result
);
    always @(*) begin
        if(en)begin
            result = ~a;    
        end else begin
            result = 32'd0;  
        end
    end
endmodule