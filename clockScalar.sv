module clockScalar(input logic clk, input logic reset, output logic scaled_clk);

parameter n = 26;
reg [n-1:0] count;

always@(posedge clk) begin
    if(reset)
        count <= 0;
    else
        count <= count + 1;
end

always@(posedge clk) begin
    scaled_clk = count[0];
    if(reset) begin
        scaled_clk = 1;
        end

end

endmodule
