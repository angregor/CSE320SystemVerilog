module Syncrhonizer(input logic clock, input logic reset, input logic resetButton, input logic clipNumPlay, input logic clipNumRecord, input logic play, input logic record,
  output logic ClipNumPlaySync, output logic ClipNumRecordSync, output logic PlaySync, output logic RecordSync, output logic resetButtonSync);


reg playReg;
reg recordReg;
reg resetButtonReg;
reg clipNumPlayReg;
reg clipNumRecordReg;

always@(play or record or resetButton or clipNumPlay or clipNumRecord) begin
  if(play)
    playReg = 1;
  if(record)
    recordReg = 1;
  if(resetButton)
    resetButtonReg = 1;
  if(clipNumPlay)
    clipNumPlayReg = 1;
  if(clipNumRecord)
    clipNumRecordReg = 1;
end

always@(posedge clock) begin
  PlaySync = playReg;
  playReg = 0;

  RecordSync = recordReg;
  recordReg = 0;

  resetButtonSync = resetButtonReg;
  resetButtonReg = 0;

  ClipNumPlaySync = clipNumPlayReg;
  clipNumPlayReg = 0;

  ClipNumRecordSync = clipNumRecordReg;
  clipNumRecordReg = 0;
end

endmodule
