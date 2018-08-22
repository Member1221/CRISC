; Set debugging for datastack
dbg SET_VSTK 0

; Call factorial function with value 3
push 3
call #fact

pop 0x0

push 0
push 0
push 0
push 0
push 0
push 0

dbg PRT_REG 0

halt

fact:
	; pop value in to status register
	pop 0xFF

	; move 0xFF to 0x1 register
	mov 0xFF 0x1

	; jump to fact_iter if status register is larger than or equal to 1
	jmpleq #fact_iter 1

		; push 1 value
		push 1

		; return
		ret

	fact_iter:
		
		; subtract 1 from register 1
		subc 1 0x1

		; push N and N-1 to stack
		pushr 0xFF
		pushr 0x1

		; recurse
		call #fact

		; pop result
		pop 0x0

		; pop N
		pop 0xFF
		
		mul 0x0 0xFF
		pushr 0xFF
		ret		
