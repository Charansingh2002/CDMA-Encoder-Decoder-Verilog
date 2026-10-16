`timescale 1ns / 1ps
module CDMA_TEST;
reg Clock;
    reg Reset;
    reg [6:0] DataIn;
    wire [6:0] DataOut;
CDMA uut (
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(DataIn),
        .DataOut(DataOut)
    );
    always #20 Clock = ~Clock;
initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0, CDMA_TEST);
        $display("CDMA TESTBENCH STARTED");
$monitor(
            "t=%0t ns Reset=%b DataIn=%07b (%0d) DataOut=%07b (%0d)",
            $time, Reset, DataIn, DataIn, DataOut, DataOut
        );
Clock = 1'b0;
        Reset = 1'b1;
        DataIn = 7'd0;
// Hold reset for three falling edges
        repeat (3) @(negedge Clock);
        Reset = 1'b0;
DataIn = 7'd98;
        @(negedge Clock);
DataIn = 7'd77;
        @(negedge Clock);
DataIn = 7'd43;
        @(negedge Clock);
DataIn = 7'd57;
        @(negedge Clock);
        DataIn = 7'd86;
// Allow time for the final outputs
        repeat (4) @(negedge Clock);
$display("CDMA TESTBENCH FINISHED");
        $finish;
    end
endmodule
