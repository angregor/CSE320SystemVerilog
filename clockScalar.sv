module clockScalar(input logic clk, input logic reset, output logic scaled_clk);

parameter n = 17;
reg [n-1:0] count;

always@(posedge clk) begin
    if(reset)
        count <= 0;
    else
        count <= count + 1;
end

always@(posedge clk) begin
    if(reset) begin
        scaled_clk = 0;
    end
    else begin
        scaled_clk = count[0];
    end
end

endmodule
