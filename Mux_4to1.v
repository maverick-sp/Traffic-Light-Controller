`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 18:59:33
// Design Name: 
// Module Name: Mux_4to1
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

module Mux_4to1(
   input A0, A1, A2, A3,
   input S1, S0,
   output reg out
);

// Selector is 2-bit, so we need a 2-to-4 decoder
wire d0, d1, d2, d3;
assign {d3, d2, d1, d0} = (S1 == 1'b0 && S0 == 1'b0) ? 4'b0001 :
                           (S1 == 1'b0 && S0 == 1'b1) ? 4'b0010 :
                           (S1 == 1'b1 && S0 == 1'b0) ? 4'b0100 :
                           (S1 == 1'b1 && S0 == 1'b1) ? 4'b1000 :
                                                        4'b0000; // Default when S1 and S0 are undefined

// Output is selected using AND gates
always @(*)
begin
    out = d0 & A0 | d1 & A1 | d2 & A2 | d3 & A3;
end

endmodule
