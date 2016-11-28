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

wire 				data_ready;
wire[31:0] 		hex_data;
wire[31:0]		txd_data;
wire 				txd_busy;
wire 				txd_start;


IR_RECEIVE IrDAreceiver
(
	.iCLK(iCLK_50),    
	.iRST_n(Reset), 
	.iIRDA(oIRDA_TXD), 					
	.oDATA_READY(data_ready),
	.oDATA(hex_data)        
);

IR_TRANSMITTER IrDAtransmitter
(
	.iCLK(iCLK_50),         		//clk 50MHz
	.iRST_n(Reset),       			//reset				
	.iDATA(txd_data),         		//data input
	.iTXD_READY(txd_start),	  		//start bit
	.oTXD_BUSY(txd_busy),	  		//transmitter sending
	.oIRDA_TXD(oIRDA_TXD)    		//transmitter coded signal
);

always @(posedge iCLK)
        if(wWriteEnable)
            if (wAddress == IrDA_WRITE_ADDRESS) txd_data <= wWriteData;  else
            if (wAddress == IrDA_CONTROL_ADDRESS) txd_start <= wWriteData[0];

always @(*)
        if(wReadEnable)
            if(wAddress == IrDA_READ_ADDRESS)
               wReadData = hex_data;
				else if(wAddress == IrDA_CONTROL_ADDRESS)
					wReadData = {30'b0,txd_busy,data_ready};
            else    
					wReadData = 32'hzzzzzzzz;
        else 
				wReadData = 32'hzzzzzzzz;

endmodule
