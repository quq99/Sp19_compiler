    .file  "main.java"
__SREG__ = 0x3f
__SP_H__ = 0x3e
__SP_L__ = 0x3d
__tmp_reg__ = 0
__zero_reg__ = 1
    .global __do_copy_data
    .global __do_clear_bss
    .text
.global main
    .type   main, @function
main:
    push r29
    push r28
    in r28,__SP_L__
    in r29,__SP_H__
/* prologue: function */
    call _Z18MeggyJrSimpleSetupv 
    /* Need to call this so that the meggy library gets set up */



	# NewExp
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MixedTest_mixedTestOne
	# NewExp
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call TestTimes_test

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global MixedTest_mixedTestOne
	.type MixedTest_mixedTestOne, @function
MixedTest_mixedTestOne:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function MixedTest_mixedTestOne prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var a
	std Y + 6, r25
	std Y + 5, r24

	### AssignStatement
	# eval rhs exp
	# NewExp
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var _This_1s_a_1dentifi3r
	std Y + 4, r25
	std Y + 3, r24

	### start of while loop
MJ_L0: # while loop condition
	# start equality check
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# right operand of ==
	pop r18
	pop r19
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L3 # goto true branch
MJ_L4: # false branch
	ldi r24, 0
	jmp MJ_L5
MJ_L3: # true branch
	ldi r24, 1
MJ_L5: 
	push r24 # push the result on stack
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L1 # if true, go to body
	jmp MJ_L2 # if false, go to next block
MJ_L1: # while loop body
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.YELLOW
	ldi r22, 3
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.RED
	ldi r22, 1
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.ORANGE
	ldi r22, 2
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 3
	ldi r24, lo8(3)
	ldi r25, hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.WHITE
	ldi r22, 7
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 7
	ldi r24, lo8(7)
	ldi r25, hi8(7)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 4
	ldi r24, lo8(4)
	ldi r25, hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.WHITE
	ldi r22, 7
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# Load constant int 80
	ldi r24, lo8(80)
	ldi r25, hi8(80)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 3
	ldi r24, lo8(3)
	ldi r25, hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 6
	ldi r24, lo8(6)
	ldi r25, hi8(6)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.RED
	ldi r22, 1
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
	# push one byte expression onto stack
	push r22


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_setColorByLine
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_sing
	# IdExp
	# load value for variable _This_1s_a_1dentifi3r
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 3
	ldi r24, lo8(3)
	ldi r25, hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r16
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call MeggyHelper_comparePixel

	### AssignStatement
	# eval rhs exp
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var a
	std Y + 6, r25
	std Y + 5, r24
	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop
	/* epilogue start for MixedTest_mixedTestOne */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size MixedTest_mixedTestOne, .-MixedTest_mixedTestOne


	.text
.global MeggyHelper_setColorByLine
	.type MeggyHelper_setColorByLine, @function
MeggyHelper_setColorByLine:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 4, r23
	std Y + 3, r22
	std Y + 5, r20
	/* done with function MeggyHelper_setColorByLine prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var i
	std Y + 7, r25
	std Y + 6, r24

	### start of while loop
MJ_L6: # while loop condition
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 7
	ldd r24, Y + 6
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L9
MJ_L10: # load false
	ldi r24, 0
	jmp MJ_L11
MJ_L9: # load true
	ldi r24, 1
MJ_L11: 
	push r24 # push the result of less than
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L7 # if true, go to body
	jmp MJ_L8 # if false, go to next block
MJ_L7: # while loop body
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 7
	ldd r24, Y + 6
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable l
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable c
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev


	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 7
	ldd r24, Y + 6
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var i
	std Y + 7, r25
	std Y + 6, r24
	jmp MJ_L6 # go back to condition
MJ_L8: 
	### end of while loop
	/* epilogue start for MeggyHelper_setColorByLine */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size MeggyHelper_setColorByLine, .-MeggyHelper_setColorByLine


	.text
.global MeggyHelper_sing
	.type MeggyHelper_sing, @function
MeggyHelper_sing:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function MeggyHelper_sing prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var i
	std Y + 4, r25
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 120
	ldi r24, lo8(120)
	ldi r25, hi8(120)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var duration
	std Y + 6, r25
	std Y + 5, r24

	### start of while loop
MJ_L12: # while loop condition
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 10
	ldi r24, lo8(10)
	ldi r25, hi8(10)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L15
MJ_L16: # load false
	ldi r24, 0
	jmp MJ_L17
MJ_L15: # load true
	ldi r24, 1
MJ_L17: 
	push r24 # push the result of less than
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L13 # if true, go to body
	jmp MJ_L14 # if false, go to next block
MJ_L13: # while loop body

	# PushMeggy.Tone.C3 onto the stack.
	ldi r25, hi8(61157)
	ldi r24, lo8(61157)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.Cs3 onto the stack.
	ldi r25, hi8(57724)
	ldi r24, lo8(57724)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.D3 onto the stack.
	ldi r25, hi8(54485)
	ldi r24, lo8(54485)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.Ds3 onto the stack.
	ldi r25, hi8(51427)
	ldi r24, lo8(51427)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.E3 onto the stack.
	ldi r25, hi8(48541)
	ldi r24, lo8(48541)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.F3 onto the stack.
	ldi r25, hi8(45816)
	ldi r24, lo8(45816)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.Fs3 onto the stack.
	ldi r25, hi8(43243)
	ldi r24, lo8(43243)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.G3 onto the stack.
	ldi r25, hi8(40816)
	ldi r24, lo8(40816)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.Gs3 onto the stack.
	ldi r25, hi8(38526)
	ldi r24, lo8(38526)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.A3 onto the stack.
	ldi r25, hi8(36363)
	ldi r24, lo8(36363)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.As3 onto the stack.
	ldi r25, hi8(34323)
	ldi r24, lo8(34323)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	# PushMeggy.Tone.B3 onto the stack.
	ldi r25, hi8(32397)
	ldi r24, lo8(32397)
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable duration
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24

	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj

	### AssignStatement
	# eval rhs exp
	# start a add operation
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# left operand of +
	pop r18
	pop r19
	# right operand of +
	pop r24
	pop r25
	# Do add operation
	add r24, r18
	adc r25, r19
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var i
	std Y + 4, r25
	std Y + 3, r24
	jmp MJ_L12 # go back to condition
MJ_L14: 
	### end of while loop
	/* epilogue start for MeggyHelper_sing */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size MeggyHelper_sing, .-MeggyHelper_sing


	.text
.global MeggyHelper_comparePixel
	.type MeggyHelper_comparePixel, @function
MeggyHelper_comparePixel:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 3, r22
	std Y + 4, r20
	std Y + 5, r18
	std Y + 6, r16
	/* done with function MeggyHelper_comparePixel prologue */


	#### if statement
	# start equality check
	# IdExp
	# load value for variable x0
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable y0
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6ReadPxhh
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable x1
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable y1
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24
	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6ReadPxhh
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L27
	ldi r25, 0
	jmp MJ_L28
MJ_L27: 
	ldi r25, hi8(-1)
MJ_L28: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L29
	ldi r25, 0
	jmp MJ_L30
MJ_L29: 
	ldi r25, hi8(-1)
MJ_L30: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L24 # goto true branch
MJ_L25: # false branch
	ldi r24, 0
	jmp MJ_L26
MJ_L24: # true branch
	ldi r24, 1
MJ_L26: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L18

MJ_L19: # false branch
	ldi r24, 0
	jmp MJ_L20

MJ_L18: # true branch
	ldi r24, 1

MJ_L20: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L21
	jmp MJ_L22

MJ_L21: # then branch

	### AssignStatement
	# eval rhs exp
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# load rhs exp
	pop r24
	# store rhs into var res
	std Y + 7, r24
	jmp MJ_L23 # jump over the else branch

MJ_L22: # else branch

	### AssignStatement
	# eval rhs exp
	# False/0 expression
	ldi r22, 0
	# push one byte expression onto stack
	push r22
	# load rhs exp
	pop r24
	# store rhs into var res
	std Y + 7, r24
MJ_L23: 
	# IdExp
	# load value for variable res
	# load a one byte variable from base+offset
	ldd r24, Y + 7
	# push one byte expression onto stack
	push r24
	/* epilogue start for MeggyHelper_comparePixel */
	# handle return value
	# load a one byte expression off stack
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size MeggyHelper_comparePixel, .-MeggyHelper_comparePixel


	.text
.global TestTimes_test
	.type TestTimes_test, @function
TestTimes_test:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
	push r30
	push r30
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	/* done with function TestTimes_test prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	# MulExp, only works for byte
	# load a one byte expression off stack
	pop r18
	# load a one byte expression off stack
	pop r22
	# move low byte src into dest reg
	mov r24, r18
	# move low byte src into dest reg
	mov r26, r22
	# Do mul operation of two input bytes
	muls r24, r26
	# push two byte expression onto stack
	push r1
	push r0
	# clear r0 and r1
	eor r0,r0
	eor r1,r1
	# load rhs exp
	pop r24
	pop r25
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var a
	std Z + 1, r25
	std Z + 0, r24
	/* epilogue start for TestTimes_test */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestTimes_test, .-TestTimes_test

