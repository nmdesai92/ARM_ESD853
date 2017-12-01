;calculate e^x in assembly
;using series e^x = 1 + 2^x/2! + 3^x/3! + ...

 	 AREA     arm_seembly, CODE, READONLY
     EXPORT __main
	 ENTRY 


__main  FUNCTION	
exp	SN s0	;exp in s0
n	SN s1	;up to n terms
sum SN s2	; cumulative sum
temp SN s3
i sN    s4	;iterations


	VMOV.F32 exp,#3	;
	VMOV.F32 n,#10	
	VMOV.F32 temp,#1	
	VMOV.F32 n,#1
	VMOV.F32 sum,#1
	
	
series
	VCMP.F32 n,i					;check for i <= n	
	VMRS.F32 APSR_nzcv,fpscr		;copy flags from fpscr to apsr before testing eq
	BEQ stop						
	VMUL.F32 temp,temp,exp			; temp = temp*exp
	VDIV.F32 temp,temp,i			; temp = temp/i
	VADD.F32 sum,sum,temp			; sum = sum+temp
	VADD.F32 i,i,#1					;i++
	B series
    
stop B stop ; stop program
     ENDFUNC
     END
