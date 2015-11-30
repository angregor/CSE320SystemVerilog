module Controller(input logic clock, input logic reset,
                  input logic clipPlayNum, input logic clipRecordNum, input logic playButton, input logic recordButton input logic ResetB,
                  input logic secondMarker, output logic enableDes, output logic enableS,
                  output logic enableTimer, output logic[16:0] startAddress);

parameter standbyState = 2'b00;
parameter recordState = 2'b01;
parameter playState = 2'b10;

logic[1:0] state;
logic[1:0] next_state;

always@(*) begin
  case(state)
    standbyState: begin
      if(playButton)
        next_state = playState;
      else if(recordButton)
        next_State = recordState;
    end
    recordState: begin
      case(secondMarker)
        1'b0: begin
          next_state = recordState;
        end
        1'b1: begin
          next_state = standbyState;
        end
      endcase
    end
    playState: begin
      case(secondMarker)
        1'b0: begin
          next_state = playState;
          end
        1'b1: begin
          next_state = standbyState;
        end
      endcase
    end
  endcase
end

always@(posedge clock) begin
    if(reset)
        state <= standbyState;
    else
        state <= next_state;
end

always@(*) begin
  case(state)
    standbyState: begin

    end
    recordState: begin

    end
    playState: begin

    end
  endcase
end

endmodule
