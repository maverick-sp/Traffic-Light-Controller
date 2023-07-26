`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 19:06:15
// Design Name: 
// Module Name: Traffic_Light_Controller
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


module Traffic_Light_Controller(
    input clk, reset,
    input CARS,
  
    output EXPRESS_GREEN, EXPRESS_YELLOW, EXPRESS_RED,
    output LOCAL_GREEN, LOCAL_YELLOW, LOCAL_RED );
   
   wire T_HOLD, T_YELLOW;
   wire START_TIMER ;
   
    // Instantiate the Timer module
    Timer timer(
        .START_TIMER(START_TIMER),
        .clk(clk),
        .T_HOLD(T_HOLD),
        .T_YELLOW(T_YELLOW)
    );

    // Instantiate the Controller module
    Controller controller(
        .clk(clk),
        .reset(reset),
        .T_HOLD(T_HOLD),
        .T_YELLOW(T_YELLOW),
        .CARS(CARS),
        .START_TIMER(START_TIMER),
        .EXPRESS_GREEN(EXPRESS_GREEN),
        .EXPRESS_YELLOW(EXPRESS_YELLOW),
        .EXPRESS_RED(EXPRESS_RED),
        .LOCAL_GREEN(LOCAL_GREEN),
        .LOCAL_YELLOW(LOCAL_YELLOW),
        .LOCAL_RED(LOCAL_RED)
    );

endmodule
