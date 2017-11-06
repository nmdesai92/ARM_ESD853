
		AREA     appcode, CODE, READONLY
		EXPORT __main
		ENTRY 

__main  FUNCTION	
		
		MOV R0,#4			;R0 = a
		MOV R1,#9			;R1 = b
		
gcd		CMP R0,R1			;while(a != b)
		SUBGT R0,R0,R1		;if(a > b)	a = a - b 
		SUBLT R1,R1,R0		;if(a < b)	b = b - a
		BNE	gcd 
		
stop 	B stop
		
		ENDFUNC		
		END