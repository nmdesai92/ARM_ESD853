;calculate e^x in assembly
;using series e^x = 1 + 2^x/2! + 3^x/3! + ...
	 PRESERVE8
     THUMB
 	 AREA     arm_seembly, CODE, READONLY
     EXPORT __main
	 ENTRY 

N EQU 10		;n iterations
__main  FUNCTION	
exp	SN s0	;exp in s0
n	SN s1	;up to n terms
sum SN s2	; cumulative sum ,answer is in s2
temp SN s3
i SN s4	;iterations


	VMOV.F32 exp,#3	
	VMOV.F32 n,#10	
	VMOV.F32 temp,#1	
	VMOV.F32 n,#1
	VMOV.F32 sum,#1
	VMOV.F32 s5,#1
	
series
	CMP R3,#N
	BEQ stop						
	VMUL.F32 temp,temp,exp			; temp = temp*exp
	VDIV.F32 temp,temp,i			; temp = temp/i
	VADD.F32 sum,sum,temp			; sum = sum+temp
	ADD R3,R3,#1					;i++
	VADD.F32 i,i,S5 ;i++
	B series
    
stop B stop ; stop program
     ENDFUNC
     END
