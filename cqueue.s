;Circular Queue in Assembly
;This will Enqueue to fill whole queue, then dequeue 2 elements and then enqueue 2 elements
		
		AREA Arm_ASM,CODE,READONLY
		ENTRY
		EXPORT __main
SIZE EQU 40				;40 BYTES
START EQU 0				; start = front = rear
	
__main FUNCTION
		MOV R0,#SIZE				;Queue Size
		MOV R1, #START			; Queue rear
			
		MOV R3, #0x40000000		;Queue start Adddress in Memory
		MOV R4, #START		;Queue front


loop	CMP R0,#0			;check queue legth
		BLGT  enqueue				;call enqueue
		BGT loop				;continue if queue is not empty
		
		BL dequeue				; dequeue
		BL dequeue				;dequeue
		BL enqueue				;enqueue
		BL enqueue
		
stop 	B stop

enqueue
		CMP R0,#0			; checck if queue is full
		BXEQ LR			;cannot enqueue
		ADD R5, #2			;Take a value in R5
		STR R5,[R3,R1]		;Store in Memory
		;ADD R3, #0X04		;Increment memory
		ADD R1,#4		;increment rear
		SUBGT R0,R0,#4		;decrement queue size
		BX	LR		
		
dequeue
		CMP R0,#SIZE		;if queue is empty
		BXEQ LR 				;cannot dequeue
		LDR R6, [R3,R4]		;take from memory
		ADD R4, #0x04		;increment front
		CMP R0,#0			
		MOVEQ R1,#START	;If queue is full, start from start
			
		ADD R0,#4			;Increment queue size
		
		BX  LR
		ENDFUNC
		END
