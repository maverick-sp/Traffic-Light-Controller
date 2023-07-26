`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 19:02:03
// Design Name: 
// Module Name: Decoder2to4
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

module Decoder2to4(
    input bit_0,
    input bit_1,
    output [3:0] output_bits
);

assign output_bits[0] = ~bit_0 & ~bit_1;
assign output_bits[1] = ~bit_0 & bit_1;
assign output_bits[2] = bit_0 & ~bit_1;
assign output_bits[3] = bit_0 & bit_1;

endmodule
