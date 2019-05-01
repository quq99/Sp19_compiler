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
	call TestClassCompare_compare
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
	call TestThis_func

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global TestClassCompare_compare
	.type TestClassCompare_compare, @function
TestClassCompare_compare:
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
	/* done with function TestClassCompare_compare prologue */



	### AssignStatement
	# eval rhs exp
	# NewExp
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var a
	std Y + 4, r25
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# NewExp
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var b
	std Y + 6, r25
	std Y + 5, r24
	#### if statement
	# start equality check
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable b
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L6 # goto true branch
MJ_L7: # false branch
	ldi r24, 0
	jmp MJ_L8
MJ_L6: # true branch
	ldi r24, 1
MJ_L8: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L0

MJ_L1: # false branch
	ldi r24, 0
	jmp MJ_L2

MJ_L0: # true branch
	ldi r24, 1

MJ_L2: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L3
	jmp MJ_L4

MJ_L3: # then branch
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

	# Color expression Meggy.Color.RED
	ldi r22, 1
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

	jmp MJ_L5 # jump over the else branch

MJ_L4: # else branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
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

MJ_L5: 

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var b
	std Y + 6, r25
	std Y + 5, r24
	#### if statement
	# start equality check
	# IdExp
	# load value for variable a
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable b
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L15 # goto true branch
MJ_L16: # false branch
	ldi r24, 0
	jmp MJ_L17
MJ_L15: # true branch
	ldi r24, 1
MJ_L17: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L9

MJ_L10: # false branch
	ldi r24, 0
	jmp MJ_L11

MJ_L9: # true branch
	ldi r24, 1

MJ_L11: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L12
	jmp MJ_L13

MJ_L12: # then branch
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

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
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

	jmp MJ_L14 # jump over the else branch

MJ_L13: # else branch
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

	# Color expression Meggy.Color.RED
	ldi r22, 1
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

MJ_L14: 
	/* epilogue start for TestClassCompare_compare */
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
	.size TestClassCompare_compare, .-TestClassCompare_compare


	.text
.global TestThis_func
	.type TestThis_func, @function
TestThis_func:
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
	/* done with function TestThis_func prologue */



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
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var a
	std Z + 1, r25
	std Z + 0, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var b
	std Z + 3, r25
	std Z + 2, r24
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30

	#### function call
	# put parameter values into appropriate registers
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call TestThis_test
	/* epilogue start for TestThis_func */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestThis_func, .-TestThis_func


	.text
.global TestThis_test
	.type TestThis_test, @function
TestThis_test:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
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
	/* done with function TestThis_test prologue */


	#### if statement
	#### short-circuited && operation
	# &&: left operand
	# start equality check
	# IdExp
	# load value for variable t
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
	call TestThis_getA
	# handle return value
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
	brne MJ_L28 # if the left expr is false

MJ_L27: # if left expr is true
	# &&: right operand
	# start equality check
	# IdExp
	# load value for variable t
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
	call TestThis_getB
	# handle return value
	# push two byte expression onto stack
	push r25
	push r24

	# Load constant int 2
	ldi r24, lo8(2)
	ldi r25, hi8(2)
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
	breq MJ_L30 # goto true branch
MJ_L31: # false branch
	ldi r24, 0
	jmp MJ_L32
MJ_L30: # true branch
	ldi r24, 1
MJ_L32: 
	push r24 # push the result on stack
	jmp MJ_L29

MJ_L28: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L29: 
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

	# Color expression Meggy.Color.GREEN
	ldi r22, 4
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

	jmp MJ_L23 # jump over the else branch

MJ_L22: # else branch
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

	# Color expression Meggy.Color.RED
	ldi r22, 1
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

MJ_L23: 
	/* epilogue start for TestThis_test */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestThis_test, .-TestThis_test


	.text
.global TestThis_getA
	.type TestThis_getA, @function
TestThis_getA:
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
	/* done with function TestThis_getA prologue */


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
	/* epilogue start for TestThis_getA */
	# handle return value
	# load a two byte expression off stack
	pop r24
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestThis_getA, .-TestThis_getA


	.text
.global TestThis_getB
	.type TestThis_getB, @function
TestThis_getB:
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
	/* done with function TestThis_getB prologue */


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
	/* epilogue start for TestThis_getB */
	# handle return value
	# load a two byte expression off stack
	pop r24
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestThis_getB, .-TestThis_getB

