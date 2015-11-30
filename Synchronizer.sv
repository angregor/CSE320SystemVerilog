module Syncrhonizer(input logic clock, input logic reset, input logic resetButton, input logic clipNum, input logic playOrRecord, input logic ActionButton,
  output logic ActionSync, output logic ClipNumSync, output logic PlayOrRecordSync, output logic resetButtonSync);

always@(resetButton or clipNum or playOrRecord or ActionButton) begin
  always@(posedge clock) begin
    if(resetButton) begin
      resetButtonSync = resetButton;
    end
    if(playOrRecord) begin
      PlayOrRecordSync = playOrRecord;
    end
    if(clipNum) begin
      ClipNumSync = clipNum;
    end
    if(ActionButton) begin
      ActionSync = ActionButton;
    end
  end
end

endmodule
