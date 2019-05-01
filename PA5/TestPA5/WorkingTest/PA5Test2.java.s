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

	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	# push Meggy.Button.Up
	ldi r24, 4
	push r24

	# PushMeggy.Tone.C3 onto the stack.
	ldi r25, hi8(61157)
	ldi r24, lo8(61157)
	# push two byte expression onto stack
	push r25
	push r24
	# NewExp
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 0
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 3
	ldi r24, lo8(3)
	ldi r25, hi8(3)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 4
	ldi r24, lo8(4)
	ldi r25, hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	#### function call
	# put parameter values into appropriate registers
	# load a two bytes expression off stack
	pop r0
	pop r1
	# load a two bytes expression off stack
	pop r2
	pop r3
	# load a two bytes expression off stack
	pop r4
	pop r5
	# load a two bytes expression off stack
	pop r6
	pop r7
	# load a two bytes expression off stack
	pop r8
	pop r9
	# load a two bytes expression off stack
	pop r10
	pop r11
	# load a two bytes expression off stack
	pop r12
	pop r13
	# load a two bytes expression off stack
	pop r14
	pop r15
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
	call TestLongVarDeclareList_testLongVarDeclareList
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
	call TestNestedWhileLoop_testNestedWhileLoop
	# NewExp
	ldi r24, lo8(4)
	ldi r25, hi8(4)
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
	call TestVarDeclareInClass_testVarDeclareInClass

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global TestLongVarDeclareList_testLongVarDeclareList
	.type TestLongVarDeclareList_testLongVarDeclareList, @function
TestLongVarDeclareList_testLongVarDeclareList:
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
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
	push r30
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
	std Y + 8, r15
	std Y + 7, r14
	std Y + 10, r13
	std Y + 9, r12
	std Y + 12, r11
	std Y + 11, r10
	std Y + 14, r9
	std Y + 13, r8
	std Y + 16, r7
	std Y + 15, r6
	std Y + 18, r5
	std Y + 17, r4
	std Y + 20, r3
	std Y + 19, r2
	std Y + 22, r1
	std Y + 21, r0
	/* done with function TestLongVarDeclareList_testLongVarDeclareList prologue */


	# start a add operation
	# start a add operation
	# start a add operation
	# start a add operation
	# start a add operation
	# IdExp
	# load value for variable i
	# load a two byte variable from base+offset
	ldd r25, Y + 12
	ldd r24, Y + 11
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable ii
	# load a two byte variable from base+offset
	ldd r25, Y + 14
	ldd r24, Y + 13
	# push two byte expression onto stack
	push r25
	push r24
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
	# IdExp
	# load value for variable iii
	# load a two byte variable from base+offset
	ldd r25, Y + 16
	ldd r24, Y + 15
	# push two byte expression onto stack
	push r25
	push r24
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
	# IdExp
	# load value for variable iiii
	# load a two byte variable from base+offset
	ldd r25, Y + 18
	ldd r24, Y + 17
	# push two byte expression onto stack
	push r25
	push r24
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
	# IdExp
	# load value for variable iiiii
	# load a two byte variable from base+offset
	ldd r25, Y + 20
	ldd r24, Y + 19
	# push two byte expression onto stack
	push r25
	push r24
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
	# IdExp
	# load value for variable iiiiii
	# load a two byte variable from base+offset
	ldd r25, Y + 22
	ldd r24, Y + 21
	# push two byte expression onto stack
	push r25
	push r24
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
	/* epilogue start for TestLongVarDeclareList_testLongVarDeclareList */
	# handle return value
	# load a two byte expression off stack
	pop r24
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
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
	.size TestLongVarDeclareList_testLongVarDeclareList, .-TestLongVarDeclareList_testLongVarDeclareList


	.text
.global TestNestedWhileLoop_testNestedWhileLoop
	.type TestNestedWhileLoop_testNestedWhileLoop, @function
TestNestedWhileLoop_testNestedWhileLoop:
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
	/* done with function TestNestedWhileLoop_testNestedWhileLoop prologue */



	### start of while loop
MJ_L0: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L1 # if true, go to body
	jmp MJ_L2 # if false, go to next block
MJ_L1: # while loop body

	### start of while loop
MJ_L3: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L4 # if true, go to body
	jmp MJ_L5 # if false, go to next block
MJ_L4: # while loop body

	### start of while loop
MJ_L6: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L7 # if true, go to body
	jmp MJ_L8 # if false, go to next block
MJ_L7: # while loop body

	### start of while loop
MJ_L9: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L10 # if true, go to body
	jmp MJ_L11 # if false, go to next block
MJ_L10: # while loop body

	### start of while loop
MJ_L12: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L13 # if true, go to body
	jmp MJ_L14 # if false, go to next block
MJ_L13: # while loop body

	### start of while loop
MJ_L15: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L16 # if true, go to body
	jmp MJ_L17 # if false, go to next block
MJ_L16: # while loop body

	### start of while loop
MJ_L18: # while loop condition
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# examine condition
	# load a one byte expression off stack
	pop r24
	ldi r25, 1
	cp r24, r25
	breq MJ_L19 # if true, go to body
	jmp MJ_L20 # if false, go to next block
MJ_L19: # while loop body
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

	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	### Meggy.setPixel(x,y,color) call
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6DrawPxhhh
	call _Z12DisplaySlatev

	jmp MJ_L18 # go back to condition
MJ_L20: 
	### end of while loop
	jmp MJ_L15 # go back to condition
MJ_L17: 
	### end of while loop
	jmp MJ_L12 # go back to condition
MJ_L14: 
	### end of while loop
	jmp MJ_L9 # go back to condition
MJ_L11: 
	### end of while loop
	jmp MJ_L6 # go back to condition
MJ_L8: 
	### end of while loop
	jmp MJ_L3 # go back to condition
MJ_L5: 
	### end of while loop
	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop
	/* epilogue start for TestNestedWhileLoop_testNestedWhileLoop */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestNestedWhileLoop_testNestedWhileLoop, .-TestNestedWhileLoop_testNestedWhileLoop


	.text
.global TestVarDeclareInClass_testVarDeclareInClass
	.type TestVarDeclareInClass_testVarDeclareInClass, @function
TestVarDeclareInClass_testVarDeclareInClass:
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
	/* done with function TestVarDeclareInClass_testVarDeclareInClass prologue */



	### AssignStatement
	# eval rhs exp
	# start a add operation
	# start a add operation
	# IdExp
	# load value for variable a
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a two byte variable from base+offset
	ldd r25, Z + 1
	ldd r24, Z + 0
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable b
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a two byte variable from base+offset
	ldd r25, Z + 3
	ldd r24, Z + 2
	# push two byte expression onto stack
	push r25
	push r24
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
	# IdExp
	# load value for variable a
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a two byte variable from base+offset
	ldd r25, Z + 1
	ldd r24, Z + 0
	# push two byte expression onto stack
	push r25
	push r24
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
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var a
	std Z + 1, r25
	std Z + 0, r24
	/* epilogue start for TestVarDeclareInClass_testVarDeclareInClass */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestVarDeclareInClass_testVarDeclareInClass, .-TestVarDeclareInClass_testVarDeclareInClass

