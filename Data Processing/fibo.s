	;Fibonacci Series upto nth term
	
		AREA Arm_ASM,CODE,READONLY
		ENTRY
		
		MOV R3, #0x40000000
		
		MOV R0,#5		;upto nth term, R0 = 5
		MOV R1,#0		; 0
		MOV R2,#1		; 1
		
loop	STR R4, [R3]	; series starts from 0x40000000
		ADD R3, R3, #4	; next term
		ADD R4,R1,R2	; n(i) = n(i-1) + n(i-2)
		MOV R1,R2		; n(i-2) = n(i-1)
		MOV R2,R4		; n(i-1) = n(i)
		CMP R0,#0
		SUB R0,R0,#1
		BNE loop		;continue
stop 	B stop
	
		END
