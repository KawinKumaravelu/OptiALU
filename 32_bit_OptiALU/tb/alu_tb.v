module alu_tb();
    reg [31:0]a,b;
    reg [3:0]opcode;
    reg cin,bin,en;
    wire [31:0]sum,diff,result;
    wire cout,bout;

    alu dut(.a(a),.b(b),.cin(cin),.cout(cout),.bin(bin),.bout(bout),.result(result),.opcode(opcode),.sum(sum),.diff(diff),.en(en));
    integer j;
    initial begin
        $monitor("TIME=%0t | a=%b b=%b cin=%b opcode=%d -> result=%b cout=%b bout=%b",
                  $time, a, b, cin, opcode, result, cout, bout);

        en = 1'b0; 
        #10;
        en = 1'b1; 
        cin = 1'b0; 
        bin = 1'b0;

        // Test cases
        a = 32'd10; 
        b = 32'd5;

        for(j=0 ; j<16 ; j=j+1)begin
            opcode = j;
            #10;
        end
        
        // Test cases
        a = 32'd10000; 
        b = 32'd123;

        for(j=0 ; j<16 ; j=j+1)begin
            opcode = j;
            #10;
        end
        $finish;
    end
endmodule  