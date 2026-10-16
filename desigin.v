
`timescale 1ns / 1ps

//==================================================
// TOP-LEVEL CDMA
//==================================================
module CDMA (
    input wire Clock,
    input wire Reset,
    input wire [6:0] DataIn,
    output wire [6:0] DataOut
);

    wire [7:0] WData;

    CDMAENCOD EN (
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(DataIn),
        .DataOut(WData)
    );

    CDMADECOD DE (
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(WData),
        .DataOut(DataOut)
    );

endmodule


//==================================================
// CDMA ENCODER
//==================================================
module CDMAENCOD (
    input wire Clock,
    input wire Reset,
    input wire [6:0] DataIn,
    output reg [7:0] DataOut
);

    wire [7:0] DataInA;
    wire [7:0] WDataOut;
    wire [7:0] Z;

    wire InA, InB, InC, InD, InE, InF, InG;
    wire Out;

    assign DataInA = {1'b0, DataIn};

    processing_element PE (
        .Clock(Clock),
        .Reset(Reset),
        .DataIn(DataOut),
        .DataOut(WDataOut)
    );

    network_interface NE (
        .A(DataInA),
        .B(WDataOut),
        .InA(InA),
        .InB(InB),
        .InC(InC),
        .InD(InD),
        .InE(InE),
        .InF(InF),
        .InG(InG)
    );

    encoder EN (
        .InA(InA),
        .InB(InB),
        .InC(InC),
        .InD(InD),
        .InE(InE),
        .InF(InF),
        .InG(InG),
        .Out(Out)
    );

    assign Z[0] = DataIn[0];
    assign Z[1] = DataIn[1] ^ Out;
    assign Z[2] = DataIn[2];
    assign Z[3] = DataIn[3] ^ Out;
    assign Z[4] = DataIn[4];
    assign Z[5] = DataIn[5] ^ Out;
    assign Z[6] = DataIn[6];
    assign Z[7] = Out;

    always @(posedge Clock) begin
        if (Reset)
            DataOut <= 8'b0;
        else
            DataOut <= Z;
    end

endmodule


//==================================================
// CDMA DECODER
//==================================================
module CDMADECOD (
    input wire Clock,
    input wire Reset,
    input wire [7:0] DataIn,
    output reg [6:0] DataOut
);

    always @(posedge Clock) begin
        if (Reset) begin
            DataOut <= 7'b0;
        end
        else begin
            DataOut[0] <= DataIn[0];
            DataOut[1] <= DataIn[1] ^ DataIn[7];
            DataOut[2] <= DataIn[2];
            DataOut[3] <= DataIn[3] ^ DataIn[7];
            DataOut[4] <= DataIn[4];
            DataOut[5] <= DataIn[5] ^ DataIn[7];
            DataOut[6] <= DataIn[6];
        end
    end

endmodule


//==================================================
// PROCESSING ELEMENT
//==================================================
module processing_element (
    input wire Clock,
    input wire Reset,
    input wire [7:0] DataIn,
    output reg [7:0] DataOut
);

    always @(posedge Clock) begin
        if (Reset)
            DataOut <= 8'b0;
        else
            DataOut <= DataIn;
    end

endmodule


//==================================================
// NETWORK INTERFACE
//==================================================
module network_interface (
    input wire [7:0] A,
    input wire [7:0] B,
    output wire InA,
    output wire InB,
    output wire InC,
    output wire InD,
    output wire InE,
    output wire InF,
    output wire InG
);

    wire [0:7] AA;
    wire [0:7] BB;

    assign AA = A;
    assign BB = B;

    OCI_crossbar O1 (
        .A(AA[0:1]), .B(BB[0:1]), .Out(InA)
    );

    OCI_crossbar O2 (
        .A(AA[1:2]), .B(BB[1:2]), .Out(InB)
    );

    OCI_crossbar O3 (
        .A(AA[2:3]), .B(BB[2:3]), .Out(InC)
    );

    OCI_crossbar O4 (
        .A(AA[3:4]), .B(BB[3:4]), .Out(InD)
    );

    OCI_crossbar O5 (
        .A(AA[4:5]), .B(BB[4:5]), .Out(InE)
    );

    OCI_crossbar O6 (
        .A(AA[5:6]), .B(BB[5:6]), .Out(InF)
    );

    OCI_crossbar O7 (
        .A(AA[6:7]), .B(BB[6:7]), .Out(InG)
    );

endmodule


//==================================================
// SEVEN-INPUT MAJORITY ENCODER
//==================================================
module encoder (
    input wire InA,
    input wire InB,
    input wire InC,
    input wire InD,
    input wire InE,
    input wire InF,
    input wire InG,
    output reg Out
);

    reg [2:0] Sum;

    always @* begin
        Sum = {2'b00, InA}
            + {2'b00, InB}
            + {2'b00, InC}
            + {2'b00, InD}
            + {2'b00, InE}
            + {2'b00, InF}
            + {2'b00, InG};

        Out = (Sum >= 3'd4);
    end

endmodule


//==================================================
// OCI CROSSBAR
//==================================================
module OCI_crossbar (
    input wire [0:1] A,
    input wire [0:1] B,
    output reg Out
);

    always @* begin
        case ({A, B})
            4'b0000: Out = 1'b0;
            4'b0001: Out = 1'b1;
            4'b0010: Out = 1'b0;
            4'b0011: Out = 1'b0;
            4'b0100: Out = 1'b1;
            4'b0101: Out = 1'b0;
            4'b0110: Out = 1'b1;
            4'b0111: Out = 1'b1;
            4'b1000: Out = 1'b1;
            4'b1001: Out = 1'b1;
            4'b1010: Out = 1'b0;
            4'b1011: Out = 1'b1;
            4'b1100: Out = 1'b0;
            4'b1101: Out = 1'b0;
            4'b1110: Out = 1'b1;
            4'b1111: Out = 1'b0;
            default: Out = 1'b0;
        endcase
    end

endmodule

