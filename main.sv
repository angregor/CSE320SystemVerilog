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


module main(
    input logic clock,
    input logic reset,
    input logic reset,
    input logic clipPlayNum,
    input logic clipRecordNum,
    input logic play,
    input logic record,
    input logic audioIn,
    output logic audioOut,
    output logic[6:0] cathode, 
    output logic A0, 
    output logic A7)
    );
    clockScalar(.clk(clock), .reset(reset), scaled_clk(scaled_clk);

    bram memory1(
      .clka(scaled_clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [16 : 0] addra
      .dina(dina),    // input wire [15 : 0] dina
      .douta(douta)  // output wire [15 : 0] douta
    );
    bram memory2(
      .clka(scaled_clk),    // input wire clka
      .ena(ena),      // input wire ena
      .wea(wea),      // input wire [0 : 0] wea
      .addra(addra),  // input wire [16 : 0] addra
      .dina(dina),    // input wire [15 : 0] dina
      .douta(douta)  // output wire [15 : 0] douta
    );
endmodule
