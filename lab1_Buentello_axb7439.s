.global add64
.global	sub64
.global minU32
.global minS8
.global isLessThanU16
.global isLessThanS16
.global shiftLeftU8
.global shiftU16
.global shiftS8
.global isEqualU16
.global isEqualS8

.text

@ uint64_t add64(uint32_t x, uint32_t y); // returns x + y
@	R1:R0				   
add64:
	ADDS R0, R0, R1
	MOV R1, #0
	ADC R1, R1, #0 
	BX LR
@uint64_t sub64(uint64_t x, uint64_t y); // returns x - y
@	   R1:R0	   R1:R0	   R3:R2
sub64:
	SUBS R0, R0, R2 @subtract right registers and set flags
	SBC R1, R1, R3 @subtract left registers with carry
	BX LR
@uint32_t minU32(uint32_t x, uint32_t y); // returns the minimum of x, y
@		R0			R0			R1
minU32:
	CMP R0,R1
	MOVCS R0,R1 @if R1 is greater move R1 to R0
	MOVCC R0,R0 @if R0 is less than move R0 to R0
	BX LR
@int8_t minS8(int8_t x, int8_t y); // returns the minimum of x, y
@	 R0			  R0	   R1
minS8:
	CMP R0,R1
	MOVGT R0,R1 @if R1 is greater move R1 to R0
	MOVLE R0,R0 @if R0 is less than move R0 to R0
	BX LR
@bool isLessThanU16(uint16_t x, uint16_t y); // returns 1 if x < y, 0 else	
@		R0				R0			R1
isLessThanU16:
	CMP R0,R1
	MOVCC R0,#1
	MOVCS R0,#0
	BX LR	

@bool isLessThanS16(int16_t x, int16_t y); // returns 1 if x < y, 0 else
@		R0				R0		  R1
isLessThanS16:
	CMP R0,R1
	MOVLT R0,#1
	MOVGT R0,#0
	BX LR	
@uint8_t shiftLeftU8 (uint8_t x, uint8_t p); // returns x << p = x * 2^p for p = 0 .. 8
@			R0			R0			R1
shiftLeftU8:
	MOV R0,R0, LSL R1
	BX LR
@uint16_t shiftU16(uint16_t x, int16_t p); // return x * 2^p for p = -16 .. 16
@			 R0		   R0		   R1
shiftU16:
	CMP R1, #0
	BMI goright16
	BPL goleft16
goright16:
	NEG R1,R1
	MOVS R0,R0,ASR R1
	BX LR
goleft16:
	MOVS R0,R0, LSL R1 
	BX LR
	
shiftS8:
	CMP R1, #0
	BMI goright8
	BPL goleft8
goright8:
	NEG R1,R1
	MOVS R0,R0,ASR R1
	BX LR
goleft8:
	MOVS R0,R0, LSL R1 
	BX LR

@bool isEqualU16(uint16_t x, uint16_t y); // returns 1 if x = y, 0 if x != y
@		   R0		 R0		    R1	
isEqualU16:
	CMP R0,R1
	BEQ equal16
	BNE nequal16
equal16:
	MOV R0,#1
	BX LR
nequal16:
	MOV R0,#0
	BX LR
	
@bool isEqualS8(int8_t x, int8_t y); // returns 1 if x = y, 0 if x != y	
@		  R0		R0		 R1
isEqualS8:
	CMP R0,R1
	MOVEQ R0,#1
	MOVNE R0,#0

	BX LR
