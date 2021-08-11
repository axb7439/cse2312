@Antonio Buentello
@Lab3

.global sumF32
.global	prodF64
.global dotpF64
.global maxF32
.global absSumF64
.global sqrtSumF64
.global getDirection
.global getAddNo
.global getCity

.text

@float sumF32(float x[], uint32_t count);
sumF32:
	MOV R2,#0
	VMOV S0,R2
fsum_loop:
	CMP R1, #0
	BEQ fsum_end
	VLDR.F32 S1,[R0]
	VADD.F32 S0,S0,S1
	SUB R1,R1, #1
	ADD R0,R0,#4
	B fsum_loop
	
fsum_end:
	BX LR

@double prodF64(double x[], uint32_t count);
@		D0			R0			  R1
prodF64:
	MOV R2,#0 @ set R0 to 0
	VMOV D0,R2,R2 	  @set high and low order bits to 0
	VLDR.F64 D0,[R0]  @ load R0 onto D0
	ADD R0,R0,#8	  @move forward 64-bits
	SUB R1,R1,#1	  @decrement counter
	
fprod_loop:
	CMP R1, #0        @test counter for 0
	BEQ fprod_end	  @if counter is zero, exit
	VLDR.F64 D1,[R0]  @load R0 onto D1
	VMUL.F64 D0,D0,D1 @multiply
	ADD R0,R0,#8	  @move forward 64-bits
	SUB R1,R1,#1	  @decrement counter
	B fprod_loop	  @loop
	
fprod_end:
	BX LR

@double dotpF64(double x[], double y[], uint32_t count);
@		D0		    R0		    R1			  R2
dotpF64:
	MOV R3,#0 @ set R0 to 0
	VMOV D3,R3,R3 	  @set high and low order bits to 0 on D3  
	VMOV D0,R3,R3	  @s
	
	
dprod_loop:
	CMP R2, #0        @test counter for 0
	BEQ dprod_end	  @if counter is zero, exit
	VLDR.F64 D1,[R0]  @load R0 onto D1
	VLDR.F64 D2,[R1]  @load R1 onto D2
	VMUL.F64 D3,D2,D1 @multiply
	VADD.F64 D0,D0,D3 @add vector multiply to D0
	ADD R0,R0,#8	  @move forward 64-bits
	ADD R1,R1,#8	  @move forward 64-bits
	SUB R2,R2,#1	  @decrement counter
	B dprod_loop	  @loop

dprod_end:
	BX LR
	
@float maxF32(float x[], uint32_t count);
@	 	S0		 R0			    R1
maxF32:
	MOV R2,#0
	VMOV S0,R2
max_loop:
	SUB R1,R1,#1
	CMP R1, #0			@test counter for 0
	BEQ max_end			@ if 0, exit
	VLDR.F32 S1,[R0]	@ load R0 value to S1
	VCMP.F32 S0,S1		@ compare S0 and S1
	VMOVGT S0,S1		@if S1 is greater than S0, move S1 to S0
	VMOVLT S0,S0		@if S1 is less than S0, move S0 to S0
	ADD R0,R0,#4
	b max_loop
max_end:
	BX LR
@double absSumF64 (double x[], uint32_t count);
@		D0			   R0			  R1
absSumF64:
	MOV R2,#0
	VMOV D0,R2,R2
absSum_loop:
	CMP R1, #0			@compare	
	BEQ absSum_end		
	VLDR.F64 D1,[R0]
	VADD.F64 D0,D0,D1	@sum
	SUB R1,R1, #1		@decrement counter
	ADD R0,R0,#8		@move forward
	B absSum_loop
absSum_end:
	VABS.F64 D3,D0		@put D0's absolute value in D3
	VMOV.F64 D0,D3		@move value back to D0
	BX LR

@double sqrtSumF64(double x[], uint32_t count);
@		D0			   R0			  R1
sqrtSumF64:
	MOV R2,#0
	VMOV D0,R2,R2
sqrtSum_loop:
	CMP R1, #0			@compare	
	BEQ sqrtSum_end		
	VLDR.F64 D1,[R0]
	VADD.F64 D0,D0,D1	@sum
	SUB R1,R1, #1		@decrement counter
	ADD R0,R0,#8		@move forward
	B sqrtSum_loop
sqrtSum_end:
	VSQRT.F64 D3,D0		@put D0's square root value in D3
	VMOV.F64 D0,D3		@move value back to D0
	BX LR
	
@char getDirection (BUSINESS business[], uint32_t index);
getDirection:
	MOV R3, #120
	MUL R2,R1,R3
	ADD R0,R0,#44
	ADD R0,R0,R2
	LDR R0,[R0]
	BX LR
@uint32_t getAddNo (BUSINESS business[], uint32_t index);
getAddNo:
	MOV R3, #120
	MUL R2,R1,R3
	ADD R0,R0,#40
	ADD R0,R0,R2
	LDR R0,[R0]
	BX LR

@char * getCity(BUSINESS business[], uint32_t index);
getCity:
	MOV R3, #120
	MUL R2,R1,R3
	ADD R0,R0,#78
	ADD R0,R0,R2
	BX LR
