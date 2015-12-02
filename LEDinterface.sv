module LEDinterface(input logic clock, input logic reset, input logic clipPlayNum, input logic play,
                    input logic recordNum, input logic record, output logic[6:0] cathode, output logic A0,output logic A1,
                    output logic A2,output logic A3, output logic A4,output logic A5, output logic A6, output logic A7);

parameter clip1 = 1'b0;
parameter clip2 = 1'b1;

logic[3:0] counter = 0;

always@(posedge clock) begin
  if(counter == 7) begin
    counter = 0;
  end
  else begin
    counter = counter + 1;
  end
end

always@(*) begin
  case(counter)
    3'b000: begin
      A0 = 1'b0;
      A1 = 1'b1;
      A2 = 1'b1;
      A3 = 1'b1;
      A4 = 1'b1;
      A5 = 1'b1;
      A6 = 1'b1;
      A7 = 1'b1;
      cathode = 7'b1001111;
    end
    3'b001: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1111111;
    end
    3'b010: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1111111;
    end
    3'b011: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1111111;
    end
    3'b100: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1111111;
    end
    3'b101: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1111111;
    end
    3'b110: begin
    A0 = 1'b1;
    A1 = 1'b1;
    A2 = 1'b1;
    A3 = 1'b1;
    A4 = 1'b1;
    A5 = 1'b1;
    A6 = 1'b1;
    A7 = 1'b1;
    cathode = 7'b1001111;
    end
  endcase
end
/*
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
*/

endmodule
