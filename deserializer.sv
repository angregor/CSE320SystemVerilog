`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2015 09:36:38 PM
// Design Name: 
// Module Name: deserializer
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


module deserializer(
    input logic clock,
    input logic enable,
    input logic dataIn,
    output logic [15:0] dataOut,
    output logic done,
    output logic LRSEL
    );
    
    parameter WORD_LENGTH = 16;
    parameter SYSTEM_FREQUENCY = 100000000;
    parameter SAMPLING_FREQUENCY = 1000000;
    reg [WORD_LENGTH-1:0] counter; 
    
    always@(posedge clock) begin
    LRSEL = 0;// left for the posedge of clock
    if(enable)
        dataOut[counter] <= dataIn;
        counter <= counter + 1;
    end
    
    always@(negedge clock) begin
        if(enable)
            if(counter == WORD_LENGTH -1)
                done <= 1;
            else
                done <= 0;
    end
endmodule
