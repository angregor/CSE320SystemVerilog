`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:
// Engineer:
//
// Create Date: 11/30/2015 06:33:38 PM
// Design Name:
// Module Name: main
// Project Name:
// Target Devices:
// Tool Versions:
// Description:
//
// Dependencies:
//
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
//
//////////////////////////////////////////////////////////////////////////////////

module main(input logic clock, input logic reset, input logic clipPlayNum, input logic clipRecordNum, input logic play, input logic record, input logic audioIn,
            output logic audioOut, output logic[6:0] cathode, output logic A0, output logic A7, output logic LR_sel));

    logic scaled_clock;
    logic reset_sync;
    logic clipPlayNumSync;
    logic clipRecordNumSync;
    logic playSync;
    logic recordSync;

    logic second_marker;
    logic enable_timer;

    logic s_done;
    logic des_done;

    logic[16:0] start_address;
    logic[16:0] addressMem1;
    logic[16:0] addressMem2;

    logic enable_des;
    logic enable_s;
    logic mem1_enable;
    logic mem2_enable;
    logic mem1_w_enable;
    logic mem2_w_enable;

    clockScalar myScalar(.clk(clock), .reset(reset_sync)), scaled_clock(scaled_clock);

    Syncrhonizer mySync(.clock(scaled_clock), .reset(reset_sync), .resetButton(recordSync), .clipNumPlay(clip_num_play), .clipNumRecord(clipRecordNumSync), .play(play), .record(record),
                            ClipNumPlaySync(clipPlayNumSync), .ClipNumRecordSync(clipRecordNumSync), .PlaySync(playSync), .RecordSync(recordSync), .resetButtonSync(reset_sync);

    Controller myController( .clock(scaled_clock), .reset(reset_sync), .clipPlayNum(clipPlayNumSync),
                              .clipRecordNum(clipRecordNumSync), .playButton(playSync), .recordButton(recordSync),
                              .secondMarker(second_marker), .enableDes(enable_des), .enableS(enable_s),
                              .enableTimer(enable_timer), .startAddress(start_address), .Mem1_EN(mem1_enable),
                              .Mem2_EN(mem2_enable), .Mem1_WEN(mem1_w_enable), .Mem2_WEN(mem2_w_enable));

    Timer myTimer(.clock(scaled_clock), .reset(reset_sync), .isEnabled(enable_timer), .secondMarker(second_marker));

    addressCounter myCounter1(.clock(scaled_clock), .reset(reset_sync), .desDone(des_done), .sDone(s_done),
                              .startCountPlay(playSync), .startCountRecord(recordSync), .startAddress(start_address), address(addressMem1));

    addressCounter myCounter2(.clock(scaled_clock), .reset(reset_sync), .desDone(des_done), .sDone(s_done),
                              .startCountPlay(playSync), .startCountRecord(recordSync), .startAddress(start_address), address(addressMem2));

    bram memory1( .clka(scaled_clock), .ena(mem1_enable), .wea(mem1_w_enable), .addra(addressMem1), .dina(deser_data), .douta(data_mem1_out));

    bram memory2( .clka(scaled_clock), .ena(mem2_enable), .wea(mem2_w_enable), .addra(addressMem2), .dina(deser_data), .douta(data_mem2_out));

    deserializer proj_des( .clock(scaled_clock), .enable(enable_des), .dataIn(audioIn), .dataOut(deser_data), done(des_done), .LRSEL(LR_sel));

    Serializer mySer(.clock_i(scaled_clock), .enable_i(enable_s), .done_o(s_done), data_i())

    LEDinterface led_interface( .clock(scaled_clock), .reset(reset_sync), .clipPlayNum(clipPlayNumSync), .play(playSync), .recordNum(clipRecordNumSync), .record(recordSync),
                  .cathode(cathode), output logic .A0(A0), .A7(A7);

endmodule
