`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 19:03:31
// Design Name: 
// Module Name: Controller
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

module Controller(
        input clk,reset,
        input T_HOLD,T_YELLOW,
        input CARS,
        output START_TIMER,EXPRESS_GREEN,EXPRESS_YELLOW,EXPRESS_RED,LOCAL_GREEN,LOCAL_YELLOW,LOCAL_RED
    );
    wire A,B;
    wire w,x;
    Mux_4to1  MB(.A0(0), .A1(T_YELLOW), .A2(~T_YELLOW), .A3(1),.S1(B),.S0(A),.out(w));
    Mux_4to1   MA(.A0(T_HOLD&CARS), .A1(1), .A2(0), .A3(~T_HOLD&CARS),.S1(B),.S0(A),.out(X));
    D_FlipFlop   FB(w ,clk,reset,B);
    D_FlipFlop   FA(x,clk,reset,A);
    assign START_TIMER= (~B&~A&T_HOLD&CARS)|(B&A&(T_HOLD|~CARS))|(T_YELLOW&(A^B));
    assign EXPRESS_GREEN= ~B&~A;
    assign EXPRESS_YELLOW= ~B&A;
    assign LOCAL_GREEN= B&A;
    assign LOCAL_YELLOW= B&~A;
    assign EXPRESS_RED= LOCAL_GREEN|LOCAL_YELLOW;
    assign LOCAL_RED= EXPRESS_GREEN|EXPRESS_YELLOW;
    
    
    
    
    
    
    
    
endmodule
