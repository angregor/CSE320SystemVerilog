module LEDinterface(input logic clock, input logic reset, input logic clipPlayNum, input logic play,
                    input logic recordNum, input logic record, output logic[6:0] cathode, output logic A0, output logic A7);

parameter clip1 = 1'b0;
parameter clip2 = 1'b1;

always@(posedge clk or posedge reset) begin
  case(reset)
    1'b0: begin
        if(record) begin
          A0 = 1'b1;
          A7 = 1'b0;
          case(recordNum)
            clip1: begin
              cathode = 7'b1001111;
            end
            clip2: begin
              cathode = 7'b0010010;
            end
          endcase
        end
        else if(play) begin
          A0 = 1'b1;
          A7 = 1'b0;
          case(clipPlayNum)
            clip1: begin
              cathode = 7'b1001111;
            end
            clip2: begin
              cathode = 7'b0010010;
            end
          endcase
        end
      endcase
    end
    1'b1: begin
      A0 = 1'b0;
      A7 = 1'b0;
      cathode = 7'b1111111;
    end
  endcase
end

endmodule
