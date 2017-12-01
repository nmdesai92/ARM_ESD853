;Check the number in R0 is even/odd

		AREA     appcode, CODE, READONLY
		EXPORT __main
		ENTRY 

__main  FUNCTION	
		
		MOV R0,#4		;input number
		
		AND	R1,R0,#1	;AND input with 1
						;if R1 == 1 -> ODD
						;if R1 == 0 -> EVEN
		
stop 	B stop
		
		ENDFUNC		
		END
