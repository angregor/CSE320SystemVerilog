`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/15/2015 02:34:07 PM
// Design Name: 
// Module Name: Serializer
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

module Serializer #(
parameter WORD_LENGTH = 16,
parameter SYSTEM_FREQUENCY = 100000000,
parameter SAMPLING_FREQUENCY = 1000000)
(
	input clock_i, // 100 MHz system clock
	input enable_i,
	//output signals
	output done_o, //Indicates that Data is sent
	input Data_i //Input 16-bit word

	// PWM
	output pwm_audio_o //Output audio data
);
	
	integer counter = WORD_LENGTH - 1;

	always @(posedge clock_i) begin
		if (done_o) begin
			done_o <= 0;
		end
		if (enable) begin

			if (counter == 0) begin
				done_o <= 1;
			end
			pwm_audio_o <= Data_i[counter];
			if (counter == 0) begin
				counter <= WORD_LENGTH-1;
			end
			else begin
				counter <= counter - 1;	
			end
		end
	end

	always @(posedge enable)
		counter <= WORD_LENGTH - 1;

endmodule
