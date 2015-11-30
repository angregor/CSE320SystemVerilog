module addressCounter(input logic clock, input logic reset, input logic desDone, input logic sDone,
                      input logic startCount, input logic[16:0] startAddress, output logic[16:0] address);

always@(posedge clock) begin
  case(reset)
    1'b1: begin
      address = 0;
    end
    1'b0: begin
      case(startCount)
        1'b0: begin
          if(sDone || desDone) begin
            address = address + 1;
          end
          else begin
            address = address;
          end
        1'b1: begin
          address = startAddress;
        end
    end
  endcase
end

endmodule
