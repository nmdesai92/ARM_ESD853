;Find maximum from three numbers and store result in R6

		AREA     appcode, CODE, READONLY
		EXPORT __main
		ENTRY 

__main  FUNCTION		         
		MOV R0,#5		;num1
		MOV R1,#2		;num2
		MOV R2,#7		;num3
		
		CMP R0,R1		;if(num1 > num2)
		BLE	L1
		CMP R0,R2		;if(num1 > num3)
		BLE L1
		MOV R6,R0		;num1 is max
		B	stop
		
L1		CMP R1,R2		;if(num2 > num3)
		MOVGT R6,R1		;num3 is max
		BLE	  L2
		B stop
		
L2		MOV R6,R2		;num2 is max
		
stop 	B stop ; stop program
		
		ENDFUNC
		END
