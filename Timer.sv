module Timer(input logic clock, input logic reset, input logic isEnabled, output logic secondMarker);

logic currentCount = 0;

always@(posedge clock) begin
  case(reset)
    1'b0: begin
      case(isEnabled)
        1'b0: begin
          currentCount = currentCount
          secondMarker = 1'b0;
        end
        1'b1: begin
          case(currentCount)
            21'b111101000010010000000: begin
              secondMarker = 1'b1;
            end
            default: begin
              secondMarker = 1'b0;
              currentCount = currentCount + 1;
            end
          endcase
        end
      endcase
    end
    1'b1: begin
      secondMarker = 1'b0;
      currentCount = 0;
    end
  endcase
end

endmodule
