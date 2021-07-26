@Antonio Buentello
@Lab2
.global stringCopy
.global	stringCat
.global sumS32
.global sumS16
.global sumU32_64
.global countNegative
.global countNonNegative
.global countMatches
.global returnMax
.global returnMin

.text

@void stringCopy(char* strTo, char* strFrom);
@		   R0		  R0		   R1
stringCopy:
	MOV R2,R0
copy_loop1:
	LDRB R3,[R1], #1
	STRB R3, [R2], #1
	CMP R3, #0
	BNE copy_loop1
	
	BX LR
@void stringCat(char* strFrom, char* strTo);
@		R0			 R0			   R1
stringCat:
	MOV R2,R1
cat_loop1:
	LDRB R3,[R2], #1
	CMP R3, #0
	BNE cat_loop1
	SUB R2,R2,#1
cat_loop2:
	LDRB R3,[R0], #1
	STRB R3,[R2], #1
	CMP R3, #0
	BNE cat_loop2

	BX LR
@int32_t sumS32(int32_t x[], int32_t count);
@		R0			R0				R1
sumS32:
	MOV R2, R0
	MOV R0, #0
sumS32_loop:	
	LDR R3, [R2], #4
	ADD R0,R0,R3
	SUBS R1,R1, #1
	BNE sumS32_loop
	BX LR
@int16_t sumS16(int16_t x[], int32_t count);
@		R0			R0				R1
sumS16:
	MOV R2, R0
	MOV R0, #0
sumS16_loop:	
	LDRH R3, [R2], #2
	ADD R0,R0,R3
	SUBS R1,R1, #1
	BNE sumS16_loop
	BX LR
@uint64_t sumU32_64(uint32_t x[], uint32_t count);
@	R1:R0				R0				R1
sumU32_64:
	MOV R2,R0
	MOV R0,#0
	MOV R4,R1
	MOV R1,#0
sumU32_loop:
	LDR R3,[R2],#4
	ADDS R0,R0,R3
	ADC R1,R1,#0

	SUBS R4, R4, #1
	BNE sumU32_loop
		
	BX LR
	
@uint32_t countNegative (int16_t x[], uint32_t count);
@			R0				 R0				R1
countNegative:
	MOV R2,R0 @set R0 to be accumulator
	MOV R0,#0 @blank R0
count_loop:
	LDR R3,[R2], #2 @contents of R2 and load on R3, #2 array is 16 bit
	CMP R3,#0
	ADDLT R0,R0,#1	@if number is negative, add 1 to R0
	SUBS R1,R1,#1 @i--
	BNE count_loop
	
	BX LR
@uint32_t countNonNegative (int32_t x[], uint32_t count);
@			R0				    R0				R1
countNonNegative:
	MOV R2,R0 @set R0 to be accumulator
	MOV R0,#0 @blank R0
countnon_loop:
	LDR R3,[R2],#4
	CMP R3,#0 @compare to set flags
	ADDGT R0,R0,#1	@if number is positive, add 1 to R0
	SUBS R1,R1,#1 @i--
	BNE countnon_loop
	
	BX LR
@uint32_t countMatches(char str[], char toMatch);
@			R0			   R0			R1
countMatches:
	MOV R2,R0 @set R0 to be accumulator
	MOV R0,#0 @blank R0
	
countMat_loop:
	LDRB R3,[R2],#1
	CMP R3,R1 @compare to set flags @compare chars
	ADDEQ R0,R0,#1 @if equal add 1 to R0
	CMP R3,#0 @compare string char for null terminator
	BEQ backtoC @if equal, exit
	B countMat_loop
backtoC:

	BX LR
@int32_t returnMax(int32_t x[], uint32_t count);
@			R0		   R0			   R1
returnMax:
	MOV R2,R0 @set R0 to be accumulator
	MOV R0,#0 @blank R0
findMax:
	LDR R3,[R2],#4 
	CMP R3,R0 @compare R3 to current contents of R0
	MOVGT R0,R3 @if greater, move to R0
	SUBS R1,R1,#1 @i--
	CMP R1,#0 @compare for counter
	BEQ quitMax @exit if counter is zero
	B findMax
quitMax:
	BX LR
@int8_t returnMin(int8_t x[], uint32_t count);
@			R0		  R0			R1
returnMin:
	MOV R2,R0 @set R0 to be accumulator
	MOV R0,#0 @blank R0
findMin:
	LDRSB R3,[R2],#1
	CMP R3,R0 @compare R3 to current contents of R0
	MOVLT R0,R3 @if lesser, move to R0
	SUBS R1,R1,#1 @i--
	CMP R1,#0 @compare for counter
	BEQ quitMin @exit if counter is zero
	B findMin
quitMin:
	BX LR
