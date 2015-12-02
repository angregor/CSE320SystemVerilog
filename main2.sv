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
            output logic audioOut, output logic[6:0] cathode, output logic A0, output logic A7));
    
    logic clip_num_play, clip_num_record, clock, reset, reset_sync, scaled_clk, 
    
    clockScalar proj_scalar(.clk(clock), .reset(reset_sync)), scaled_clk(scaled_clk);
    
    Syncrhonizer prog_sync(.clock(scaled_clk), .reset(reset), .resetButton(reset_button), .clipNumPlay(clip_num_play), .clipNumRecord(clip_num_record), .play(play), .record(record),
                            ClipNumPlaySync(clip_num_play_sync), .ClipNumRecordSync(clip_num_record_sync), .PlaySync(play_sync), .RecordSync(record_sync), .resetButtonSync(reset_sync);
                            
    Controller( .clock(scaled_clk), .reset(reset_sync), .clipPlayNum(clip_play_num), .clipRecordNum(clip_num_record), .playButton(play_button), .recordButton(reset_button), .secondMarker(second_marker),
                .enableDes(enable_des), .enableS(enable_s), .enableTimer(enable_timer), .startAddress(start_address), .Mem1_EN(mem1_enable), .Mem2_EN(mem1_enable), .Mem1_WEN(mem1_w_enable), .Mem2_WEN(mem2_w_enable));
                
    microphone( .clock(scaled_clk), .LRSel(LR_sel), .Data(data_from_mic));
    
    bram memory1( .clka(scaled_clk), .ena(clip_num_play_sync), .wea(clip_num_record_sync), .addra(address_counter), .dina(deser_data), .douta(data_mem1_out));
    
    bram memory2( .clka(scaled_clk), .ena(clip_num_play_sync), .wea(clip_num_record_sync), .addra(address_counter), .dina(deser_data), .douta(data_mem2_out));
    
    deserializer proj_des( .clock(scaled_clk), .enable(enable_s), .dataIn(data_from_mic), .dataOut(deser_data), done(des_done), .LRSEL(LR_sel));
    
    LEDinterface led_interface( .clock(scaled_clk), .reset(reset_sync), .clipNum(???), .recordOrPlay(???),
                  .cathode(cathode), output logic .A0(A0), .A7(A7);

endmodule
