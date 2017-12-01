;calculate e^x in assembly
 	 AREA     arm_seembly, CODE, READONLY
     EXPORT __main
	 ENTRY 


__main  FUNCTION	
x SN 1
result SN 3	;result
temp SN 2	;temporary var
n SN 4		;no of iterations
count SN 5
one SN 6

	VMOV.F32 x,#3	;
	VMOV.F32 n,#10	;up to 10 terms
	VMOV.F32 one,#1
	VMOV.F32 temp,#1	
	VMOV.F32 count,#1
	VMOV.F32 result,#1
	
	
loop
	VCMP.F32 n,count		;loop till n reaches two accounting
	VMRS.F32 APSR_nzcv,fpscr;copy flags from fpscr to apsr before testing eq
	BEQ stop
	VMUL.F32 temp,temp,x	
	VDIV.F32 temp,temp,count
	VADD.F32 result,result,temp
	VADD.F32 count,count,one
	B loop
    
stop B stop ; stop program
     ENDFUNC
     END
