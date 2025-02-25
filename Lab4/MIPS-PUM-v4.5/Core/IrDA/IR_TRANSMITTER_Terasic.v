// ============================================================================
// Copyright (c) 2012 by Terasic Technologies Inc.
// ============================================================================
//
// Permission:
//
//   Terasic grants permission to use and modify this code for use
//   in synthesis for all Terasic Development Boards and Altera Development 
//   Kits made by Terasic.  Other use of this code, including the selling 
//   ,duplication, or modification of any portion is strictly prohibited.
//
// Disclaimer:
//
//   This VHDL/Verilog or C/C++ source code is intended as a design reference
//   which illustrates how these types of functions can be implemented.
//   It is the user's responsibility to verify their design for
//   consistency and functionality through the use of formal
//   verification methods.  Terasic provides no warranty regarding the use 
//   or functionality of this code.
//
// ============================================================================
//           
//                     Terasic Technologies(China)Inc
//                     
//                     Wuhan, China
//                     
//
//                     web: http://www.terasic.com.cn/
//                     email: support@terasic.com
//
// ============================================================================
//
// Major Functions:	IRDA receiver
//
//                  it can realize a IRDA receiver,show the user code(16 bit) on HEX4-HEX7
//                  and key value on HEX0-HEX3  7-SEGS.the user code is fixed for some 
//                  remote control and the key value is not the same for different key
// ============================================================================
//
// Revision History :
// ============================================================================
//   Ver  :| Author            :| Mod. Date   :| Changes Made:
//   V1.0 :| Peli  Li          :| 2010/03/22  :| Initial Revision
//   V1.1 :| Allen Wang        :| 06/06/2010  :| Change IRDA with IR
//   v1.2 :| johnny            :| 06/18/2010  :| delete the iREAD port
// ============================================================================

module IR_TRANSMITTER(
					iCLK,         //clk 50MHz
					iRST_n,       //reset				
					iDATA,         //data input
					iTXD_READY,	  //start bit
					oTXD_BUSY,	  //transmitter sending
					oIRDA_TXD    //transmitter coded signal
					);


//=======================================================
//  PARAMETER declarations
//=======================================================
parameter IDLE               = 2'b00;    //always high voltage level
parameter GUIDANCE           = 2'b01;    //9ms low voltage and 4.5 ms high voltage
parameter DATASEND           = 2'b10;    //0.6ms low voltage start and with 0.52ms high voltage is 0,with 1.66ms high voltage is 1, 32bit in sum.
parameter END					  = 2'b11;	  //

/*
parameter GUIDE_LOW			  = 450000;	  // 9ms low voltage
parameter GUIDE_HIGH			  = 225000;	  // 4.5ms high voltage

parameter DATA_GAP			  = 30000;	  // 0.6ms gap between signals and end signal				
parameter DATA_HIGH			  = 83000;	  // 1.66ms high voltage
parameter DATA_LOW			  = 26000;	  // 0.52ms high voltage

parameter END_HIGH			  = 30000;	  // 0.6ms high voltage

parameter HIGH_DUR			  = 1000;	  // duracao de txd_signal HIGH

/-------------------Valores para visualizacao em forma de onda------------------------------------------*/

parameter GUIDE_LOW			  = 450;	  // 9us low voltage
parameter GUIDE_HIGH			  = 225;	  // 4.5us high voltage

parameter DATA_GAP			  = 30;	  // 0.6us gap between signals and end signal				
parameter DATA_HIGH			  = 83;	  // 1.66us high voltage
parameter DATA_LOW			  = 26;	  // 0.52us high voltage

parameter END_HIGH			  = 50;	  // 0.52us high voltage

parameter SEND_TIME			  = 1; 	  // tempo total de envio do txd_signal 20us em high 20us em low
parameter HIGH_DUR			  = 1;	  // duracao de txd_signal HIGH

//=======================================================
//  PORT declarations
//=======================================================
input 		iCLK;         //clk 50MHz
input			iRST_n;       //reset				
input[31:0] iDATA;        //data input
input 		iTXD_READY;	  //start bit
output 		oTXD_BUSY;	  //transmitter sending
output 		oIRDA_TXD;    //transmitter coded signal


//=======================================================
//  Signal Declarations
//=======================================================
reg    [17:0] idle_count;           //state_count counter works under guide state
reg           idle_count_flag;      //state_count conter flag
reg			  idle_txd; 
reg    [17:0] guide_count;           //state_count counter works under guide state
reg           guide_count_flag;      //state_count conter flag
reg			  guide_txd;
reg    [17:0] data_count;            //data_count counter works under data_read state
reg           data_count_flag;       //data_count conter flag
reg			  data_txd;
reg    [17:0] end_count;            //data_count counter works under data_read state
reg           end_count_flag;       //data_count conter flag
reg			  end_txd;

reg 	  [4:0] trans_high_count;		//contagem para pulso de transmissao
reg			  send_high; 				

reg     [5:0] bitcount;              //sample bit pointer
reg     [1:0] state;                 //state reg
reg    [31:0] data;                  //data buf
reg 			  txd_signal;
reg           txd_busy;             //data ready flag


//=======================================================
//  Structural coding
//=======================================================	
assign oTXD_BUSY = txd_busy;
assign oIRDA_TXD = txd_signal;


/*------------------------------------------------STATE IDLE-------------------------------------------------------------*/
always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		idle_count <= 0;
	else if (idle_count_flag)    
		idle_count <= idle_count + 1'b1;
	else  
		idle_count <= 0;	        	      		 	

always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		begin
			idle_count_flag <= 1'b0;
			idle_txd <= 1'b0;
		end
	else if ((state == IDLE) && txd_busy)	//caso iTXD_START ja tenha acionado txd_busy 
		begin
			idle_count_flag <= 1'b1;
			idle_txd <= 1'b1;
		end
	else                           
		begin
			idle_count_flag <= 1'b0;
			idle_txd <= 1'b0;
		end	
			 
/*--------------------------------------------------------------------------------------------------------------------------*/


/*------------------------------------------------STATE GUIDANCE-------------------------------------------------------------*/
always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		guide_count <= 0;
	else if (guide_count_flag)    
		guide_count <= guide_count + 1'b1;
	else  
		guide_count <= 0;	              		 	

always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		begin
			guide_count_flag <= 1'b0;			
			guide_txd <= 1'b0; 
		end
	else if ((state == GUIDANCE))
		begin
			guide_count_flag <= 1'b1;			//iniciaremos contagem de 4.5ms em high
			guide_txd <= 1'b1; 
		end
	else  
		begin
			guide_count_flag <= 1'b0;			
			guide_txd <= 1'b0; 
		end

/*--------------------------------------------------------------------------------------------------------------------------*/

			 

/*------------------------------------------------STATE DATASEND-------------------------------------------------------------*/		 

//data reg pointer counter 
always @(posedge iCLK or negedge iRST_n)
   if (!iRST_n)
		begin
			bitcount <= 6'b0;
			data_count <= 0;
			data_txd <= 1'b0;
		end
		
	else if (state == DATASEND)
		begin
			data_count <= data_count + 1'b1;
		
			if(!data_txd)	//caso estejamos em um gap
				begin
					if(data_count > DATA_GAP)
						begin
							data_txd <= 1'b1;			//jogamos para high transmissao de bit 
							data_count <= 0;
						end
				end
			
			else if(data_txd) //caso estejamos enviando um bit
				begin
					if(data[bitcount])					//caso seja bit high
						begin
							if(data_count > DATA_HIGH)	//esperamos por timer do high
								begin
									data_txd <= 1'b0;
									bitcount <= bitcount + 1'b1;
									data_count <= 0;
								end 
						end
					else if(!data[bitcount])									//caso seja um bit low 
						begin
							if(data_count > DATA_LOW)	//esperamos por timer do low
								begin
									data_txd <= 1'b0;
									bitcount <= bitcount + 1'b1;
									data_count <= 0;
								end 
						end
				end
		end
	else
	   begin
			bitcount <= 6'b0;
			data_count <= 0;
			data_txd <= 1'b0;
		end
		
	
/*--------------------------------------------CONTROLE TXD SIGNAL--------------------------------------------------------------*/
/*
always @(posedge iCLK or negedge iRST_n)
	if(!iRST_n)
		trans_high_count <= 0;
	else if (send_high)
		begin
			trans_high_count <= trans_high_count + 1;
		
			if(trans_high_count <= HIGH_DUR)
				txd_signal <= 1;
			else if(trans_high_count <= SEND_TIME)
				txd_signal <= 0;
			else
				trans_high_count <= 0;
		end
	else
		begin
			trans_high_count <= 0;
			txd_signal <= 0;
		end
*/
		
always @(posedge iCLK or negedge iRST_n)
	if (!iRST_n) 
		txd_signal <= 1'b1;	
	else
		case (state)
			IDLE     : if (idle_txd)
							  txd_signal = 1'b0;
			GUIDANCE : if (guide_txd)
							  txd_signal = 1'b1;
			DATASEND : if (data_txd)
							  txd_signal = 1'b1;
						  else if(!data_txd)
							  txd_signal = 1'b0;
			END		: if(end_txd)
							  txd_signal = 1'b1;
			default  : state <= IDLE; //default
		endcase
		
/*-----------------------------------------------------------------------------------------------------------------------------*/

/*------------------------------------------------STATE END-------------------------------------------------------------*/
always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		end_count <= 0;
	else if (end_count_flag)    
		end_count <= end_count + 1'b1;
	else  
		end_count <= 0;	        	      		 	

always @(posedge iCLK or negedge iRST_n)	
	if (!iRST_n)
		begin
			end_count_flag <= 1'b0;
			end_txd <= 1'b0;
		end
	else if ((state == END))	
		begin
			end_count_flag <= 1'b1;
			end_txd <= 1'b1;
		end
	else                           
		begin
			end_count_flag <= 1'b0;
			end_txd <= 1'b0;
		end	
			 
/*--------------------------------------------------------------------------------------------------------------------------*/


//state change between IDLE,GUIDE,DATA_READ according to irda edge or counter
always @(posedge iCLK or negedge iRST_n) 
	  if (!iRST_n)
			begin
				state <= IDLE;
				data <= 32'b0;
				txd_busy <= 1'b0;
			end
	  else
			begin
				
				if(iTXD_READY && !txd_busy)
					begin
						data <= iDATA;  
						txd_busy <= 1'b1;
					end
				
				case (state)
					IDLE     : if (idle_count > GUIDE_LOW) /*Estado muda ao receber sinal iTXD_START contando pulso de 9ms*/
									  state <= GUIDANCE; 
					GUIDANCE : if (guide_count > GUIDE_HIGH)/*Estado conta 4.5ms após 9ms do stado idle*/
									  state <= DATASEND;
					DATASEND : if (bitcount == 32 && data_txd)/*Caso tenhamos terminado contagem esperamos mais um gap*/
										begin
											txd_busy <= 1'b0;
											state <= END;
										end
					END		: if(end_count > END_HIGH)
										state <= IDLE;
				  default  : state <= IDLE; //default
				endcase
			end

endmodule
