;Circular Queue in Assembly

		AREA Arm_ASM,CODE,READONLY
		ENTRY
		
		MOV R0, #10				;Queue Size
		MOV R1, #0				; Queue rear
			
		MOV R3, #0x40000000		;Queue start Adddress in Memory : rear
		MOV R4, #0x40000000		;Queue front
		
loop	SUB R7,R3,R4 			;rear - front
		CMP R7,#40				;
		BL  enqueue				;call enqueue
		BLT loop				;continue if (rear - front) < size
		
		BL dequeue				; dequeue

stop 	B stop

enqueue
		ADD R5, #2
		STR R5, [R3]
		ADD R3, #0X04
		BX	LR
		
dequeue
		LDR R6, [R4]
		ADD R4, #0x04
		
		BX  LR

		
		END