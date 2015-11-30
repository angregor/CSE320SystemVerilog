`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 11/29/2015 09:29:46 PM
// Design Name: 
// Module Name: Bram
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


module Bram(
    input logic clock,
    input logic enable,
    input logic writeEnable,
    input logic [16:0] address,
    input logic [15:0] dataIn,
    output logic [15:0] dataOut
    );
    parameter WORD_LENGTH = 16;

    logic [WORD_LENGTH-1:0] mem [125000:0];
    always@(posedge clock) begin
        if(enable && writeEnable)
            mem[address] <= dataIn;
    end
    
    always@(posedgeclock) begin
        if(enable && ~writeEnable)
            dataOut <= mem[address];
    end
endmodule
