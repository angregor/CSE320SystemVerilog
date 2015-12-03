//{{ Section below this comment is automatically maintained
//   and may be overwritten
//{module {Edge_Detector}}
module Edge_Detector (
	input clk,
	input play,
	input record,
	input clipNumPlay,
	input clipNumRecord,
	input reset,
	output playSync,
	output recordSync,
	output clipPlaySync,
	output clipRecordSync,
	output resetSync);
//}} End of automatically maintained section

// -- Enter your statements here -- //
reg playreg, play_1, play_2;
reg recordreg, record_1, record_2;
reg clipPlayreg, clipP_1, clipP_2;
reg clipRecreg, clipR_1, clipR_2;
reg resetreg, reset_1, reset_2;

always@(posedge clk)
begin
	playreg <= play;
	play_1 <= playreg;
	play_2 <= play_1;

	recordreg <= record;
	record_1 <= recordreg;
	record_2 <= record_1;

	clipPlayreg <= clipNumPlay;
	clipP_1 <= clipPlayreg;
	clipP_2 <= clipP_1;

	clipRecreg <= clipNumRecord;
	clipR_1 <= clipRecreg;
	clipR_2 <= clipR_1;

	resetreg <= reset;
	reset_1 <= resetreg;
	reset_2 <= reset_1;
end

assign playSync = play_1 & ~play_2;
assign recordSync = record_1 & ~record_2;
assign clipPlaySync = clipP_1 & ~clipP_2;
assign clipRecordSync = clipR_1 & ~clipR_2;
assign resetSync = reset_1 & ~reset_2;


endmodule
