`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.07.2023 19:04:27
// Design Name: 
// Module Name: Timer
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

module Timer(
    input START_TIMER,    // Input to start the timer
    input clk,            // Clock input
    output reg T_HOLD,    // Output to indicate when the timer is in the hold state
    output reg T_YELLOW   // Output to indicate when the timer is in the yellow state
);

// Internal state variables
reg [1:0] state;   // 2-bit state variable to represent different states of the timer
reg [9:0] counter; // 10-bit counter to track time intervals (10 clk cycles = 200ns)

// Constants to define the states
parameter HOLD_STATE = 2'b00;   // Hold state
parameter YELLOW_STATE = 2'b01; // Yellow state

// Time intervals in clock cycles
parameter T_HOLD_INTERVAL = 10;   // Time to hold (200ns)
parameter T_YELLOW_INTERVAL = 10; // Time for yellow (10 clock cycles)

// Initial state
initial begin
    state = HOLD_STATE;
    counter = 0;
    T_HOLD = 0;
    T_YELLOW = 0;
end

// State machine logic
always @(posedge clk) begin
    // Increment the counter on every clock cycle
    counter <= counter + 1;

    case (state)
        HOLD_STATE: begin
            if (counter >= T_HOLD_INTERVAL) begin
                state = YELLOW_STATE;
                counter <= 0;
                T_HOLD = 1;
                T_YELLOW = 0;
            end
        end

        YELLOW_STATE: begin
            if (START_TIMER) begin
                if (counter >= T_YELLOW_INTERVAL) begin
                    state = HOLD_STATE;
                    counter <= 0;
                    T_HOLD = 0;
                    T_YELLOW = 1;
                end
            end
        end
    endcase
end

endmodule
