module IrDA_Interface(
    input         iCLK_50,
    input         iCLK,
    input         Reset,
    output        oIRDA_TXD,    //    IrDA Transmitter
    input         iIRDA_RXD,    //    IrDA Receiver
    //  Barramento de IO
    input         wReadEnable, wWriteEnable,
    input  [3:0]  wByteEnable,
    input  [31:0] wAddress, wWriteData,
    output [31:0] wReadData
);




endmodule
