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

wire data_ready;
wire[31:0] hex_data;

IR_RECEIVE u1(
.iCLK(iCLK_50),    
.iRST_n(Reset), 
.iIRDA(iIRDA_RXD), 					
.oDATA_READY(data_ready),
.oDATA(hex_data)        
);

always @(*)
        if(wReadEnable)
            if(wAddress == IrDA_READ_ADDRESS)
               wReadData = hex_data;
				else if(wAddress == IrDA_CONTROL_ADDRESS)
					wReadData = {31'b0,data_ready};
            else    
					wReadData = 32'hzzzzzzzz;
        else 
				wReadData = 32'hzzzzzzzz;

endmodule
