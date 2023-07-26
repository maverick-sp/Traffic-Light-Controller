`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 19:00:27
// Design Name: 
// Module Name: D_FlipFlop
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

module D_FlipFlop(input D, input clk, input reset, output reg Q);

always @(posedge clk, posedge reset)
begin
    if (reset)
        Q <= 1'b0;
    else
        Q <= D;
end

endmodule
