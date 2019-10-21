	cpu LMM
	.module main.c
	.area data(ram, con, rel)
_STATUS::
	.word 0
	.dbfile ./hbheader.h
	.dbsym e STATUS _STATUS I
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_NAV_INT::
	.byte 8,9
	.byte 10,11
	.byte 12,13
	.byte 14,15
	.byte 16,17
	.dbsym e NAV_INT _NAV_INT A[10:10]c
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_NAV_DEC::
	.byte 0,5
	.byte 10,15
	.byte 20,25
	.byte 30,35
	.byte 40,45
	.byte 50,55
	.byte 60,'A
	.byte 'F,'K
	.byte 'P,'U
	.byte 'Z,95
	.dbsym e NAV_DEC _NAV_DEC A[20:20]c
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_adc_res::
	.byte 0
	.word 0,0,0,0,0
	.byte 0,0,0,0,0
	.dbfile ./main.c
	.dbsym e adc_res _adc_res A[16:16]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_ekran_res::
	.byte 0
	.byte 0,0,0
	.dbsym e ekran_res _ekran_res A[4:4]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_ekran_res_dummy::
	.byte 0
	.byte 0,0,0
	.dbsym e ekran_res_dummy _ekran_res_dummy A[4:4]c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_son::
	.byte 0
	.dbsym e son _son c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sol_intkisim::
	.byte 0
	.dbsym e sol_intkisim _sol_intkisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sol_decisim::
	.byte 0
	.dbsym e sol_decisim _sol_decisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sag_intkisim::
	.byte 0
	.dbsym e sag_intkisim _sag_intkisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area data(ram, con, rel)
	.dbfile ./main.c
_sag_decisim::
	.byte 0
	.dbsym e sag_decisim _sag_decisim c
	.area data(ram, con, rel)
	.dbfile ./main.c
	.area text(rom, con, rel)
	.dbfile ./main.c
	.dbfunc e Counter8_1_ISR _Counter8_1_ISR fV
_Counter8_1_ISR::
	.dbline -1
	or F,-64
	push A
	mov A,REG[0xd0]
	push A
	mov A,REG[0xd3]
	push A
	mov A,REG[0xd4]
	push A
	mov A,REG[0xd5]
	push A
	mov REG[0xd0],>__r0
	mov A,[__r0]
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[__r4]
	push A
	mov A,[__r5]
	push A
	mov A,[__r6]
	push A
	mov A,[__r7]
	push A
	mov A,[__r8]
	push A
	mov A,[__r9]
	push A
	mov A,[__r10]
	push A
	mov A,[__r11]
	push A
	mov A,[__rX]
	push A
	mov A,[__rY]
	push A
	mov A,[__rZ]
	push A
	.dbline 38
; //----------------------------------------------------------------------------
; // Radio Panel 14.May.2009
; //----------------------------------------------------------------------------
; 
; #include <m8c.h>
; #include "PSoCAPI.h"
; #include "hbheader.h"
; #include "stdlib.h"
; 
; #define SLAVE_ADDRESS 17
; 
; BYTE    txBuffer[32];  
; BYTE    rxBuffer[32]; 
; BYTE	lastport;
; BYTE 	adc_res[16] = {0}; 
; BYTE	ekran_res[4] = {0};  // [0]=NAV ACT, [1]=NAV STB
; BYTE	ekran_res_dummy[4] = {0};
; BOOL	son = FALSE;
; 
; BYTE	sol_intkisim=0, sol_decisim=0, sag_intkisim=0, sag_decisim=0;
; 
; BYTE    status;  
; BYTE *ptr;
; //char *intRet;
; char intRet[8];
; 
; WORD cnt;
; WORD acnt;
; WORD Timeout_d;
; void  I2Oku(void), I2Yaz(void);
; void Int_tostring(int val);
; 
; #pragma interrupt_handler Counter8_1_ISR, encoder_isr
; void Counter8_1_ISR(void); void encoder_isr(void);
; 
; void dly(long int mS), init_environment(void);
; 
; void Counter8_1_ISR() {Counter8_1_DisableInt(); Counter8_1_Stop(); DELAY_CLR;}
	.dbline 38
	push X
	xcall _Counter8_1_DisableInt
	.dbline 38
	xcall _Counter8_1_Stop
	pop X
	.dbline 38
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS+1]
	and A,-2
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS]
	mov REG[0xd0],>__r0
	mov [__r0],A
	mov A,[__r1]
	push A
	mov A,[__r0]
	mov REG[0xd0],>_STATUS
	mov [_STATUS],A
	pop A
	mov [_STATUS+1],A
	.dbline -2
	.dbline 38
L1:
	mov REG[0xD0],>__r0
	pop A
	mov [__rZ],A
	pop A
	mov [__rY],A
	pop A
	mov [__rX],A
	pop A
	mov [__r11],A
	pop A
	mov [__r10],A
	pop A
	mov [__r9],A
	pop A
	mov [__r8],A
	pop A
	mov [__r7],A
	pop A
	mov [__r6],A
	pop A
	mov [__r5],A
	pop A
	mov [__r4],A
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	mov [__r0],A
	pop A
	mov REG[213],A
	pop A
	mov REG[212],A
	pop A
	mov REG[211],A
	pop A
	mov REG[208],A
	pop A
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e encoder_isr _encoder_isr fV
_encoder_isr::
	.dbline -1
	.dbline 40
; 
; void encoder_isr(void){
	.dbline -2
	.dbline 41
; }
L2:
	.dbline 0 ; func end
	reti
	.dbend
	.dbfunc e init_environment _init_environment fV
_init_environment::
	.dbline -1
	.dbline 44
; 		
; void init_environment()
; {  	PRT1DR |= 0xA0;		//release et pinleri
	.dbline 44
	or REG[0x4],-96
	.dbline 45
; 	I2CHW_1_Start(); I2CHW_1_EnableSlave(); I2CHW_1_EnableInt();
	push X
	xcall _I2CHW_1_Start
	.dbline 45
	xcall _I2CHW_1_EnableSlave
	.dbline 45
	xcall _I2CHW_1_EnableInt
	.dbline 46
; 	I2CHW_1_InitRamRead(txBuffer,32);
	mov A,32
	push A
	mov A,>_txBuffer
	push A
	mov A,<_txBuffer
	push A
	xcall _I2CHW_1_InitRamRead
	add SP,-3
	.dbline 47
;     I2CHW_1_InitWrite(rxBuffer,32);
	mov A,32
	push A
	mov A,>_rxBuffer
	push A
	mov A,<_rxBuffer
	push A
	xcall _I2CHW_1_InitWrite
	add SP,-3
	pop X
	.dbline 48
; 	M8C_EnableGInt;	M8C_EnableIntMask (INT_MSK0, INT_MSK0_GPIO); LED7SEG_1_Start();
		or  F, 01h

	.dbline 48
	or REG[0xe0],32
	.dbline 48
	xcall _LED7SEG_1_Start
	.dbline 50
;     
;     ekran_res[0]=1; lastport=0;
	mov REG[0xd0],>_ekran_res
	mov [_ekran_res],1
	.dbline 50
	mov REG[0xd0],>_lastport
	mov [_lastport],0
	.dbline 51
;     ekran_res[1]=1;
	mov REG[0xd0],>_ekran_res
	mov [_ekran_res+1],1
	.dbline 52
;     ekran_res[2]=1;
	mov [_ekran_res+2],1
	.dbline 53
;     ekran_res[3]=1;
	mov [_ekran_res+3],1
	.dbline -2
	.dbline 54
;     }
L3:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e init_delay_counter _init_delay_counter fV
;             DC -> X-11
;            mSn -> X-7
_init_delay_counter::
	.dbline -1
	push X
	mov X,SP
	.dbline 57
; 
; void init_delay_counter(long int mSn, long int DC)
; {   Counter8_1_WritePeriod(mSn); Counter8_1_WriteCompareValue(DC); Counter8_1_EnableInt();DELAY_SET; Counter8_1_Start();}
	.dbline 57
	mov REG[0xd0],>__r0
	mov A,[X-4]
	push X
	xcall _Counter8_1_WritePeriod
	pop X
	.dbline 57
	mov REG[0xd0],>__r0
	mov A,[X-8]
	push X
	xcall _Counter8_1_WriteCompareValue
	.dbline 57
	xcall _Counter8_1_EnableInt
	pop X
	.dbline 57
	mov REG[0xd0],>_STATUS
	or [_STATUS+1],1
	.dbline 57
	push X
	xcall _Counter8_1_Start
	pop X
	.dbline -2
	.dbline 57
L7:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l DC -11 L
	.dbsym l mSn -7 L
	.dbend
	.dbfunc e main _main fV
;         dummy1 -> X+0
_main::
	.dbline -1
	push X
	mov X,SP
	add SP,3
	.dbline 61
; /* ---------------------------------------------------------------------- */
; 
; void main()
; {
	.dbline 67
; // NAV LIMITS   = 108.00-117.95 (2048--6037)
; // COMM LIMITS  = 118.00-136.97 (6144--13975)
; // XPNDR LIMITS = 0000-7777		(Octal system)
; // ADF LIMITS   = 0100.0-1799.9
; 
; 	init_environment();
	xcall _init_environment
	.dbline 68
; 	LED7SEG_1_DP(1, 2); 	LED7SEG_1_DP(1, 6);
	push X
	mov X,2
	mov A,1
	xcall _LED7SEG_1_DP
	.dbline 68
	mov X,6
	mov A,1
	xcall _LED7SEG_1_DP
	pop X
	.dbline 69
;  	son=FALSE;
	mov REG[0xd0],>_son
	mov [_son],0
	xjmp L10
L9:
	.dbline 71
;  	
;  	while(1)  {
	.dbline 75
; 			//txBuffer[0]=
; 			BYTE dummy1;
; 
; 			I2Oku();	
	xcall _I2Oku
	.dbline 78
; 
; 			//sayiyaz();
; 			dummy1 = PRT3DR^lastport;	//durumu degisen pin varmi?
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	mov [__r0],A
	mov REG[0xd0],>_lastport
	mov A,[_lastport]
	mov REG[0xd0],>__r0
	xor [__r0],A
	mov A,[__r0]
	mov [X+0],A
	.dbline 80
; 
; 			if (dummy1 & BSET_0) {		//0. pinin durumu degismis
	tst [X+0],1
	jz L12
	.dbline 80
	.dbline 81
; 				lastport=PRT3DR;
	mov A,REG[0xc]
	mov REG[0xd0],>_lastport
	mov [_lastport],A
	.dbline 82
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	and A,3
	mov [X+2],A
	mov [X+1],0
	cmp [X+1],0
	jnz X3
	cmp [X+2],1
	jz L17
X3:
	cmp [X+1],0
	jnz X4
	cmp [X+2],3
	jz L27
X4:
	xjmp L14
X0:
	.dbline 82
; 				switch  (PRT3DR & 0b00000011) {	//bu encoder hangi yone donuyor?
L17:
	.dbline 89
; //						case 0: if (PRT2DR & BSET_7) {
; //									if (ekran_res[2]==20) {ekran_res[2]=1;} else {ekran_res[2]++; }}
; //								else {
; //									if (ekran_res[0]==10) {ekran_res[0]=1;} else {ekran_res[0]++; }}
; //								break;
; //						
; 						case 1: if (PRT7DR & BSET_7) {
	tst REG[0x1c],-128
	jz L18
	.dbline 89
	.dbline 90
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+2],1
	jnz L20
	.dbline 90
	.dbline 90
	mov [_ekran_res+2],20
	.dbline 90
	xjmp L15
L20:
	.dbline 90
; 									if (ekran_res[2]==1) {ekran_res[2]=20;} else {ekran_res[2]--; }}
	.dbline 90
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res+2]
	.dbline 90
	.dbline 90
	xjmp L15
L18:
	.dbline 91
; 								else {
	.dbline 92
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],1
	jnz L25
	.dbline 92
	.dbline 92
	mov [_ekran_res],10
	.dbline 92
	xjmp L15
L25:
	.dbline 92
; 									if (ekran_res[0]==1) {ekran_res[0]=10;} else {ekran_res[0]--; }}
	.dbline 92
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res]
	.dbline 92
	.dbline 92
	.dbline 93
; 								break;
	xjmp L15
L27:
	.dbline 101
; 						
; //						case 2: if (PRT2DR & BSET_7) {
; //									if (ekran_res[2]==1) {ekran_res[2]=20;} else {ekran_res[2]--; }}
; //								else {
; //									if (ekran_res[0]==1) {ekran_res[0]=10;} else {ekran_res[0]--; }}
; //								break;
; 						
; 						case 3: if (PRT7DR & BSET_7) {
	tst REG[0x1c],-128
	jz L28
	.dbline 101
	.dbline 102
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+2],20
	jnz L30
	.dbline 102
	.dbline 102
	mov [_ekran_res+2],1
	.dbline 102
	xjmp L15
L30:
	.dbline 102
; 									if (ekran_res[2]==20) {ekran_res[2]=1;} else {ekran_res[2]++; }}
	.dbline 102
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res+2]
	.dbline 102
	.dbline 102
	xjmp L15
L28:
	.dbline 103
; 								else {
	.dbline 104
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res],10
	jnz L35
	.dbline 104
	.dbline 104
	mov [_ekran_res],1
	.dbline 104
	xjmp L15
L35:
	.dbline 104
; 									if (ekran_res[0]==10) {ekran_res[0]=1;} else {ekran_res[0]++; }}
	.dbline 104
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res]
	.dbline 104
	.dbline 104
	.dbline 105
; 								break;
L14:
L15:
	.dbline 107
; 						
; 						}}
L12:
	.dbline 108
; 			if (dummy1 & BSET_2) {		//2. pinin durumu degismis
	tst [X+0],4
	jz L37
	.dbline 108
	.dbline 109
; 				lastport=PRT3DR;
	mov A,REG[0xc]
	mov REG[0xd0],>_lastport
	mov [_lastport],A
	.dbline 110
; 				switch  (PRT3DR & 0b00001100) {	//bu encoder hangi yone donuyor?
	mov A,REG[0xc]
	mov REG[0xd0],>__r0
	and A,12
	mov [X+2],A
	mov [X+1],0
	mov A,[X+2]
	sub A,4
	mov [__rY],A
	mov A,[X+1]
	xor A,-128
	sbb A,(0 ^ 0x80)
	jc L39
	or A,[__rY]
	jz L42
X5:
L68:
	cmp [X+1],0
	jnz X6
	cmp [X+2],12
	jz L55
X6:
	xjmp L39
X1:
	.dbline 110
L42:
	.dbline 117
; //						case 0: if (PRT2DR & BSET_6) {
; //									if (ekran_res[3]==20) {ekran_res[3]=1;} else {ekran_res[3]++; }}
; //								else {
; //									if (ekran_res[1]==10) {ekran_res[1]=1;} else {ekran_res[1]++; }}
; //								break;
; //						
; 						case 4: if (PRT7DR & BSET_0) {
	tst REG[0x1c],1
	jz L43
	.dbline 117
	.dbline 118
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+3],1
	jnz L45
	.dbline 118
	.dbline 118
	mov [_ekran_res+3],20
	.dbline 118
	xjmp L40
L45:
	.dbline 118
; 									if (ekran_res[3]==1) {ekran_res[3]=20;} else {ekran_res[3]--; }}
	.dbline 118
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res+3]
	.dbline 118
	.dbline 118
	xjmp L40
L43:
	.dbline 119
; 								else {
	.dbline 120
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+1],1
	jnz L50
	.dbline 120
	.dbline 120
	mov [_ekran_res+1],10
	.dbline 120
	xjmp L40
L50:
	.dbline 120
; 									if (ekran_res[1]==1) {ekran_res[1]=10;} else {ekran_res[1]--; }}
	.dbline 120
	mov REG[0xd0],>_ekran_res
	dec [_ekran_res+1]
	.dbline 120
	.dbline 120
	.dbline 121
; 								break;
	xjmp L40
L55:
	.dbline 129
; 						
; //						case 8: if (PRT2DR & BSET_6) {
; //									if (ekran_res[3]==1) {ekran_res[3]=20;} else {ekran_res[3]--; }}
; //								else {
; //									if (ekran_res[1]==1) {ekran_res[1]=10;} else {ekran_res[1]--; }}
; //								break;
; 						
; 						case 12: if (PRT7DR & BSET_0) {
	tst REG[0x1c],1
	jz L56
	.dbline 129
	.dbline 130
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+3],20
	jnz L58
	.dbline 130
	.dbline 130
	mov [_ekran_res+3],1
	.dbline 130
	xjmp L40
L58:
	.dbline 130
; 									if (ekran_res[3]==20) {ekran_res[3]=1;} else {ekran_res[3]++; }}
	.dbline 130
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res+3]
	.dbline 130
	.dbline 130
	xjmp L40
L56:
	.dbline 131
; 								else {
	.dbline 132
	mov REG[0xd0],>_ekran_res
	cmp [_ekran_res+1],10
	jnz L63
	.dbline 132
	.dbline 132
	mov [_ekran_res+1],1
	.dbline 132
	xjmp L40
L63:
	.dbline 132
; 									if (ekran_res[1]==10) {ekran_res[1]=1;} else {ekran_res[1]++; }}
	.dbline 132
	mov REG[0xd0],>_ekran_res
	inc [_ekran_res+1]
	.dbline 132
	.dbline 132
	.dbline 133
; 								break;
L39:
L40:
	.dbline 135
; 						
; 						}}
L37:
	.dbline 137
; 
; 			if (PRT4DR & BSET_1) {
	tst REG[0x10],2
	jz L69
	.dbline 137
	.dbline 138
	mov REG[0xd0],>_son
	cmp [_son],0
	jz L71
	.dbline 138
	.dbline 138
	xjmp L70
L71:
	.dbline 138
; 				if (son) {	}	else {
	.dbline 139
; 					ekran_res_dummy[0] = ekran_res[0]; 
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res]
	mov REG[0xd0],>_ekran_res_dummy
	mov [_ekran_res_dummy],A
	.dbline 141
; 					//ekran_res_dummy[1] = ekran_res[1]; 
; 					ekran_res_dummy[2] = ekran_res[2]; 
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+2]
	mov REG[0xd0],>_ekran_res_dummy
	mov [_ekran_res_dummy+2],A
	.dbline 143
; 					//ekran_res_dummy[3] = ekran_res[3]; 
; 					ekran_res[0] = ekran_res[1];
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+1]
	mov [_ekran_res],A
	.dbline 144
; 					ekran_res[1] = ekran_res_dummy[0];
	mov REG[0xd0],>_ekran_res_dummy
	mov A,[_ekran_res_dummy]
	mov REG[0xd0],>_ekran_res
	mov [_ekran_res+1],A
	.dbline 145
; 					ekran_res[2] = ekran_res[3];
	mov A,[_ekran_res+3]
	mov [_ekran_res+2],A
	.dbline 146
; 					ekran_res[3] = ekran_res_dummy[2];
	mov REG[0xd0],>_ekran_res_dummy
	mov A,[_ekran_res_dummy+2]
	mov REG[0xd0],>_ekran_res
	mov [_ekran_res+3],A
	.dbline 147
; 					son = TRUE;
	mov REG[0xd0],>_son
	mov [_son],1
	.dbline 148
; 				}}	
	.dbline 148
	xjmp L70
L69:
	.dbline 149
; 			else { son = FALSE; }
	.dbline 149
	mov REG[0xd0],>_son
	mov [_son],0
	.dbline 149
L70:
	.dbline 152
; 			
; //COMM için gelcek sayilar 118.00-136.97
; 			txBuffer[0]=ekran_res[0];	//sol asil hane
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res]
	mov REG[0xd0],>_txBuffer
	mov [_txBuffer],A
	.dbline 153
; 			txBuffer[2]=ekran_res[1];	//sag asil hane
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+1]
	mov REG[0xd0],>_txBuffer
	mov [_txBuffer+2],A
	.dbline 154
; 			txBuffer[1]=ekran_res[2];	//sol decimal hane
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+2]
	mov REG[0xd0],>_txBuffer
	mov [_txBuffer+1],A
	.dbline 155
; 			txBuffer[3]=ekran_res[3];	//sag decimal hane
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+3]
	mov REG[0xd0],>_txBuffer
	mov [_txBuffer+3],A
	.dbline 158
; 			
; 						
; 			sol_intkisim=NAV_INT[ekran_res[0]-1];
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NAV_INT-1
	adc [__r0],>_NAV_INT-1
	mov A,[__r0]
	mov REG[0xd4],A
	mvi A,[__r1]
	mov REG[0xd0],>_sol_intkisim
	mov [_sol_intkisim],A
	.dbline 159
; 			sol_decisim=NAV_DEC[ekran_res[2]-1];
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+2]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NAV_DEC-1
	adc [__r0],>_NAV_DEC-1
	mov A,[__r0]
	mov REG[0xd4],A
	mvi A,[__r1]
	mov REG[0xd0],>_sol_decisim
	mov [_sol_decisim],A
	.dbline 160
; 			sag_intkisim=NAV_INT[ekran_res[1]-1];
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+1]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NAV_INT-1
	adc [__r0],>_NAV_INT-1
	mov A,[__r0]
	mov REG[0xd4],A
	mvi A,[__r1]
	mov REG[0xd0],>_sag_intkisim
	mov [_sag_intkisim],A
	.dbline 161
; 			sag_decisim=NAV_DEC[ekran_res[3]-1];
	mov REG[0xd0],>_ekran_res
	mov A,[_ekran_res+3]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov [__r0],0
	add [__r1],<_NAV_DEC-1
	adc [__r0],>_NAV_DEC-1
	mov A,[__r0]
	mov REG[0xd4],A
	mvi A,[__r1]
	mov REG[0xd0],>_sag_decisim
	mov [_sag_decisim],A
	.dbline 164
	mov REG[0xd0],>_sol_intkisim
	cmp [_sol_intkisim],10
	jnc L94
X7:
	.dbline 164
	.dbline 164
	push X
	mov X,1
	mov A,63
	xcall _LED7SEG_1_PutPattern
	.dbline 164
	mov A,1
	push A
	mov A,2
	push A
	mov REG[0xd0],>_sol_intkisim
	mov A,[_sol_intkisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 164
	xjmp L95
L94:
	.dbline 164
; 			
; 			//LED7SEG_1_DispInt(sol_intkisim, 1, 2); 
; 			if (sol_intkisim<10) {LED7SEG_1_PutPattern(63,1); LED7SEG_1_DispInt(sol_intkisim, 2, 1); } else {LED7SEG_1_DispInt(sol_intkisim, 1, 2);}
	.dbline 164
	push X
	mov A,2
	push A
	mov A,1
	push A
	mov REG[0xd0],>_sol_intkisim
	mov A,[_sol_intkisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 164
L95:
	.dbline 165
	mov REG[0xd0],>_sol_decisim
	cmp [_sol_decisim],10
	jnc L96
X8:
	.dbline 165
	.dbline 165
	push X
	mov X,3
	mov A,63
	xcall _LED7SEG_1_PutPattern
	.dbline 165
	mov A,1
	push A
	mov A,4
	push A
	mov REG[0xd0],>_sol_decisim
	mov A,[_sol_decisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 165
	xjmp L97
L96:
	.dbline 165
; 			if (sol_decisim<10) {LED7SEG_1_PutPattern(63,3); LED7SEG_1_DispInt(sol_decisim, 4, 1); } else {LED7SEG_1_DispInt(sol_decisim, 3, 2);}
	.dbline 165
	push X
	mov A,2
	push A
	mov A,3
	push A
	mov REG[0xd0],>_sol_decisim
	mov A,[_sol_decisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 165
L97:
	.dbline 168
	mov REG[0xd0],>_sag_intkisim
	cmp [_sag_intkisim],10
	jnc L98
X9:
	.dbline 168
	.dbline 168
	push X
	mov X,5
	mov A,63
	xcall _LED7SEG_1_PutPattern
	.dbline 168
	mov A,1
	push A
	mov A,6
	push A
	mov REG[0xd0],>_sag_intkisim
	mov A,[_sag_intkisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 168
	xjmp L99
L98:
	.dbline 168
; 
; 			//LED7SEG_1_DispInt(sag_intkisim, 5, 2); 
; 			if (sag_intkisim<10) {LED7SEG_1_PutPattern(63,5); LED7SEG_1_DispInt(sag_intkisim, 6, 1); } else {LED7SEG_1_DispInt(sag_intkisim, 5, 2);}
	.dbline 168
	push X
	mov A,2
	push A
	mov A,5
	push A
	mov REG[0xd0],>_sag_intkisim
	mov A,[_sag_intkisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 168
L99:
	.dbline 169
	mov REG[0xd0],>_sag_decisim
	cmp [_sag_decisim],10
	jnc L100
X10:
	.dbline 169
	.dbline 169
	push X
	mov X,7
	mov A,63
	xcall _LED7SEG_1_PutPattern
	.dbline 169
	mov A,1
	push A
	mov A,8
	push A
	mov REG[0xd0],>_sag_decisim
	mov A,[_sag_decisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 169
	xjmp L101
L100:
	.dbline 169
; 			if (sag_decisim<10) {LED7SEG_1_PutPattern(63,7); LED7SEG_1_DispInt(sag_decisim, 8, 1); } else {LED7SEG_1_DispInt(sag_decisim, 7, 2);}
	.dbline 169
	push X
	mov A,2
	push A
	mov A,7
	push A
	mov REG[0xd0],>_sag_decisim
	mov A,[_sag_decisim]
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov A,0
	push A
	mov A,[__r1]
	push A
	xcall _LED7SEG_1_DispInt
	add SP,-4
	pop X
	.dbline 169
L101:
	.dbline 171
	xcall _I2Yaz
	.dbline 174
L10:
	.dbline 71
	xjmp L9
X2:
	.dbline -2
	.dbline 175
; 						
; 			I2Yaz();
; 
; 	
; }//while kapa	
; }//main kapa
L8:
	add SP,-3
	pop X
	.dbline 0 ; func end
	jmp .
	.dbsym l dummy1 0 c
	.dbend
	.dbfunc e dly _dly fV
;             mS -> X-7
_dly::
	.dbline -1
	push X
	mov X,SP
	.dbline 177
	.dbline 177
	mov REG[0xd0],>__r0
	mov A,0
	push A
	push A
	push A
	mov A,2
	push A
	mov A,[X-7]
	push A
	mov A,[X-6]
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	xcall __divmod_32X32_32
	pop A
	mov [__r3],A
	pop A
	mov [__r2],A
	pop A
	mov [__r1],A
	pop A
	add SP,-4
	push A
	mov A,[__r1]
	push A
	mov A,[__r2]
	push A
	mov A,[__r3]
	push A
	mov A,[X-7]
	push A
	mov A,[X-6]
	push A
	mov A,[X-5]
	push A
	mov A,[X-4]
	push A
	xcall _init_delay_counter
	add SP,-8
L103:
	.dbline 177
L104:
	.dbline 177
; 
; void dly(long int mS){init_delay_counter(mS,mS/2); while (DELAY_INVOKE);{}}
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS+1]
	and A,1
	mov REG[0xd0],>__r0
	mov [__r1],A
	mov REG[0xd0],>_STATUS
	mov A,[_STATUS]
	and A,0
	mov REG[0xd0],>__r0
	cmp A,0
	jnz L103
	cmp [__r1],0
	jnz L103
X11:
	.dbline 177
	.dbline 177
	.dbline -2
	.dbline 177
L102:
	pop X
	.dbline 0 ; func end
	ret
	.dbsym l mS -7 L
	.dbend
	.dbfunc e I2Yaz _I2Yaz fV
_I2Yaz::
	.dbline -1
	.dbline 180
	.dbline 181
	push X
	xcall _I2CHW_1_bReadI2CStatus
	pop X
	mov REG[0xd0],>_status
	mov [_status],A
	.dbline 182
	tst [_status],4
	jz L107
	.dbline 183
	.dbline 184
	push X
	xcall _I2CHW_1_ClrRdStatus
	.dbline 185
	mov A,32
	push A
	mov A,>_txBuffer
	push A
	mov A,<_txBuffer
	push A
	xcall _I2CHW_1_InitRamRead
	add SP,-3
	pop X
	.dbline 185
L107:
	.dbline -2
	.dbline 185
; 
; void I2Yaz()
; {
; 		status = I2CHW_1_bReadI2CStatus();
; 		if( status & I2CHW_RD_COMPLETE )
; 		{
; 			I2CHW_1_ClrRdStatus();
; 			I2CHW_1_InitRamRead(txBuffer,32);}}
L106:
	.dbline 0 ; func end
	ret
	.dbend
	.dbfunc e I2Oku _I2Oku fV
_I2Oku::
	.dbline -1
	.dbline 188
	.dbline 189
	push X
	xcall _I2CHW_1_bReadI2CStatus
	pop X
	mov REG[0xd0],>_status
	mov [_status],A
	.dbline 190
	tst [_status],64
	jz L110
	.dbline 191
	.dbline 192
	push X
	xcall _I2CHW_1_ClrWrStatus
	.dbline 193
	mov A,32
	push A
	mov A,>_rxBuffer
	push A
	mov A,<_rxBuffer
	push A
	xcall _I2CHW_1_InitWrite
	add SP,-3
	pop X
	.dbline 193
L110:
	.dbline -2
	.dbline 193
; 
; void I2Oku()
; {
;         status = I2CHW_1_bReadI2CStatus();  
;         if( status & I2CHW_WR_COMPLETE )  
;         {
; 	        I2CHW_1_ClrWrStatus();  
; 	        I2CHW_1_InitWrite(rxBuffer,32);}}
L109:
	.dbline 0 ; func end
	ret
	.dbend
	.area data(ram, con, rel)
	.dbfile ./main.c
_Timeout_d::
	.byte 0,0
	.dbsym e Timeout_d _Timeout_d i
	.area data(ram, con, rel)
	.dbfile ./main.c
_acnt::
	.byte 0,0
	.dbsym e acnt _acnt i
	.area data(ram, con, rel)
	.dbfile ./main.c
_cnt::
	.byte 0,0
	.dbsym e cnt _cnt i
	.area data(ram, con, rel)
	.dbfile ./main.c
_intRet::
	.byte 0,0,0,0,0,0,0,0
	.dbsym e intRet _intRet A[8:8]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_ptr::
	.byte 0,0
	.dbsym e ptr _ptr pc
	.area data(ram, con, rel)
	.dbfile ./main.c
_lastport::
	.byte 0
	.dbsym e lastport _lastport c
	.area data(ram, con, rel)
	.dbfile ./main.c
_rxBuffer::
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.byte 0,0
	.dbsym e rxBuffer _rxBuffer A[32:32]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_txBuffer::
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.word 0,0,0,0,0
	.byte 0,0
	.dbsym e txBuffer _txBuffer A[32:32]c
	.area data(ram, con, rel)
	.dbfile ./main.c
_mevcut::
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.byte 0,0,0,0
	.dbfile ./hbheader.h
	.dbsym e mevcut _mevcut A[64:32]I
	.area data(ram, con, rel)
	.dbfile ./hbheader.h
_status::
	.byte 0
	.dbfile ./main.c
	.dbsym e status _status c
	.area data(ram, con, rel)
	.dbfile ./main.c
_dummy::
	.word 0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0
	.byte 0,0,0,0
	.dbfile ./hbheader.h
	.dbsym e dummy _dummy A[64:32]I
