module addressCounter(input logic clock, input logic reset, input logic desDone, input logic sDone,
                      input logic CNT_EN, output logic[15:0] address);

always@(posedge clock) begin
  case(reset)
    1'b1: begin
      address = 0;
      end
    1'b0: begin
      case(CNT_EN)
        1'b1: begin
          address = address + 1;
        end
        1'b0: begin
          address = address;
        end
      endcase
    end
  endcase
end

endmodule
