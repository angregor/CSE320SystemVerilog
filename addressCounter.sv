module addressCounter(input logic clock, input logic reset, input logic desDone, input logic sDone,
                      output logic[15:0] address);

always@(posedge clock) begin
  case(reset)
    1'b1: begin
      address = 0;
      end
    1'b0: begin
      if(sDone or desDone) begin
        address = address + 1;
      end
      else begin
        address = address;
      end
    end
  endcase
end

endmodule
