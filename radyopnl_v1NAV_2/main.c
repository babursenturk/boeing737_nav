//----------------------------------------------------------------------------
// Radio Panel 14.May.2009
//----------------------------------------------------------------------------

#include <m8c.h>
#include "PSoCAPI.h"
#include "hbheader.h"
#include "stdlib.h"

#define SLAVE_ADDRESS 17

BYTE    txBuffer[32];  
BYTE    rxBuffer[32]; 
BYTE	lastport;
BYTE 	adc_res[16] = {0}; 
BYTE	ekran_res[4] = {0};  // [0]=NAV ACT, [1]=NAV STB
BYTE	ekran_res_dummy[4] = {0};
BOOL	son = FALSE;

BYTE	sol_intkisim=0, sol_decisim=0, sag_intkisim=0, sag_decisim=0;

BYTE    status;  
BYTE *ptr;
//char *intRet;
char intRet[8];

WORD cnt;
WORD acnt;
WORD Timeout_d;
void  I2Oku(void), I2Yaz(void);
void Int_tostring(int val);

#pragma interrupt_handler Counter8_1_ISR, encoder_isr
void Counter8_1_ISR(void); void encoder_isr(void);

void dly(long int mS), init_environment(void);

void Counter8_1_ISR() {Counter8_1_DisableInt(); Counter8_1_Stop(); DELAY_CLR;}

void encoder_isr(void){
}
		
void init_environment()
{  	PRT1DR |= 0xA0;		//release et pinleri
	I2CHW_1_Start(); I2CHW_1_EnableSlave(); I2CHW_1_EnableInt();
	I2CHW_1_InitRamRead(txBuffer,32);
    I2CHW_1_InitWrite(rxBuffer,32);
	M8C_EnableGInt;	M8C_EnableIntMask (INT_MSK0, INT_MSK0_GPIO); LED7SEG_1_Start();
    
    ekran_res[0]=1; lastport=0;
    ekran_res[1]=1;
    ekran_res[2]=1;
    ekran_res[3]=1;
    }

void init_delay_counter(long int mSn, long int DC)
{   Counter8_1_WritePeriod(mSn); Counter8_1_WriteCompareValue(DC); Counter8_1_EnableInt();DELAY_SET; Counter8_1_Start();}
/* ---------------------------------------------------------------------- */

void main()
{
// NAV LIMITS   = 108.00-117.95 (2048--6037)
// COMM LIMITS  = 118.00-136.97 (6144--13975)
// XPNDR LIMITS = 0000-7777		(Octal system)
// ADF LIMITS   = 0100.0-1799.9

	init_environment();
	LED7SEG_1_DP(1, 2); 	LED7SEG_1_DP(1, 6);
 	son=FALSE;
 	
 	while(1)  {
			//txBuffer[0]=
			BYTE dummy1;

			I2Oku();	

			//sayiyaz();
			dummy1 = PRT3DR^lastport;	//durumu degisen pin varmi?

			if (dummy1 & BSET_0) {		//0. pinin durumu degismis
				lastport=PRT3DR;
				switch  (PRT3DR & 0b00000011) {	//bu encoder hangi yone donuyor?
//						case 0: if (PRT2DR & BSET_7) {
//									if (ekran_res[2]==20) {ekran_res[2]=1;} else {ekran_res[2]++; }}
//								else {
//									if (ekran_res[0]==10) {ekran_res[0]=1;} else {ekran_res[0]++; }}
//								break;
//						
						case 1: if (PRT7DR & BSET_7) {
									if (ekran_res[2]==1) {ekran_res[2]=20;} else {ekran_res[2]--; }}
								else {
									if (ekran_res[0]==1) {ekran_res[0]=10;} else {ekran_res[0]--; }}
								break;
						
//						case 2: if (PRT2DR & BSET_7) {
//									if (ekran_res[2]==1) {ekran_res[2]=20;} else {ekran_res[2]--; }}
//								else {
//									if (ekran_res[0]==1) {ekran_res[0]=10;} else {ekran_res[0]--; }}
//								break;
						
						case 3: if (PRT7DR & BSET_7) {
									if (ekran_res[2]==20) {ekran_res[2]=1;} else {ekran_res[2]++; }}
								else {
									if (ekran_res[0]==10) {ekran_res[0]=1;} else {ekran_res[0]++; }}
								break;
						
						}}
			if (dummy1 & BSET_2) {		//2. pinin durumu degismis
				lastport=PRT3DR;
				switch  (PRT3DR & 0b00001100) {	//bu encoder hangi yone donuyor?
//						case 0: if (PRT2DR & BSET_6) {
//									if (ekran_res[3]==20) {ekran_res[3]=1;} else {ekran_res[3]++; }}
//								else {
//									if (ekran_res[1]==10) {ekran_res[1]=1;} else {ekran_res[1]++; }}
//								break;
//						
						case 4: if (PRT7DR & BSET_0) {
									if (ekran_res[3]==1) {ekran_res[3]=20;} else {ekran_res[3]--; }}
								else {
									if (ekran_res[1]==1) {ekran_res[1]=10;} else {ekran_res[1]--; }}
								break;
						
//						case 8: if (PRT2DR & BSET_6) {
//									if (ekran_res[3]==1) {ekran_res[3]=20;} else {ekran_res[3]--; }}
//								else {
//									if (ekran_res[1]==1) {ekran_res[1]=10;} else {ekran_res[1]--; }}
//								break;
						
						case 12: if (PRT7DR & BSET_0) {
									if (ekran_res[3]==20) {ekran_res[3]=1;} else {ekran_res[3]++; }}
								else {
									if (ekran_res[1]==10) {ekran_res[1]=1;} else {ekran_res[1]++; }}
								break;
						
						}}

			if (PRT4DR & BSET_1) {
				if (son) {	}	else {
					ekran_res_dummy[0] = ekran_res[0]; 
					//ekran_res_dummy[1] = ekran_res[1]; 
					ekran_res_dummy[2] = ekran_res[2]; 
					//ekran_res_dummy[3] = ekran_res[3]; 
					ekran_res[0] = ekran_res[1];
					ekran_res[1] = ekran_res_dummy[0];
					ekran_res[2] = ekran_res[3];
					ekran_res[3] = ekran_res_dummy[2];
					son = TRUE;
				}}	
			else { son = FALSE; }
			
//COMM için gelcek sayilar 118.00-136.97
			txBuffer[0]=ekran_res[0];	//sol asil hane
			txBuffer[2]=ekran_res[1];	//sag asil hane
			txBuffer[1]=ekran_res[2];	//sol decimal hane
			txBuffer[3]=ekran_res[3];	//sag decimal hane
			
						
			sol_intkisim=NAV_INT[ekran_res[0]-1];
			sol_decisim=NAV_DEC[ekran_res[2]-1];
			sag_intkisim=NAV_INT[ekran_res[1]-1];
			sag_decisim=NAV_DEC[ekran_res[3]-1];
			
			//LED7SEG_1_DispInt(sol_intkisim, 1, 2); 
			if (sol_intkisim<10) {LED7SEG_1_PutPattern(63,1); LED7SEG_1_DispInt(sol_intkisim, 2, 1); } else {LED7SEG_1_DispInt(sol_intkisim, 1, 2);}
			if (sol_decisim<10) {LED7SEG_1_PutPattern(63,3); LED7SEG_1_DispInt(sol_decisim, 4, 1); } else {LED7SEG_1_DispInt(sol_decisim, 3, 2);}

			//LED7SEG_1_DispInt(sag_intkisim, 5, 2); 
			if (sag_intkisim<10) {LED7SEG_1_PutPattern(63,5); LED7SEG_1_DispInt(sag_intkisim, 6, 1); } else {LED7SEG_1_DispInt(sag_intkisim, 5, 2);}
			if (sag_decisim<10) {LED7SEG_1_PutPattern(63,7); LED7SEG_1_DispInt(sag_decisim, 8, 1); } else {LED7SEG_1_DispInt(sag_decisim, 7, 2);}
						
			I2Yaz();

	
}//while kapa	
}//main kapa

void dly(long int mS){init_delay_counter(mS,mS/2); while (DELAY_INVOKE);{}}

void I2Yaz()
{
		status = I2CHW_1_bReadI2CStatus();
		if( status & I2CHW_RD_COMPLETE )
		{
			I2CHW_1_ClrRdStatus();
			I2CHW_1_InitRamRead(txBuffer,32);}}

void I2Oku()
{
        status = I2CHW_1_bReadI2CStatus();  
        if( status & I2CHW_WR_COMPLETE )  
        {
	        I2CHW_1_ClrWrStatus();  
	        I2CHW_1_InitWrite(rxBuffer,32);}}
