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
	call TestThis_testThis

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global TestThis_testThis
	.type TestThis_testThis, @function
TestThis_testThis:
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
	/* done with function TestThis_testThis prologue */


	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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

	#### function call
	# put parameter values into appropriate registers
	# load a two bytes expression off stack
	pop r20
	pop r21
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call TestThis_getVar

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
	#### if statement
	# start equality check
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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
	# Load constant int 1
	ldi r24, lo8(1)
	ldi r25, hi8(1)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var local
	std Y + 4, r25
	std Y + 3, r24
	#### if statement
	# start equality check
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
	# load value for variable local
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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
	/* epilogue start for TestThis_testThis */
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
	.size TestThis_testThis, .-TestThis_testThis


	.text
.global TestThis_getVar
	.type TestThis_getVar, @function
TestThis_getVar:
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
	std Y + 4, r23
	std Y + 3, r22
	std Y + 6, r21
	std Y + 5, r20
	/* done with function TestThis_getVar prologue */


	# start a add operation
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
	/* epilogue start for TestThis_getVar */
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
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestThis_getVar, .-TestThis_getVar


	.text
.global TestThis_testClassComparison
	.type TestThis_testClassComparison, @function
TestThis_testClassComparison:
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
	/* done with function TestThis_testClassComparison prologue */



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
	# store rhs into var d1
	std Y + 4, r25
	std Y + 3, r24

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
	# store rhs into var d2
	std Y + 6, r25
	std Y + 5, r24
	#### if statement
	# start equality check
	# IdExp
	# load value for variable d1
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable d2
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

	jmp MJ_L23 # jump over the else branch

MJ_L22: # else branch
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

MJ_L23: 

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable d2
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var d1
	std Y + 4, r25
	std Y + 3, r24
	#### if statement
	# start equality check
	# IdExp
	# load value for variable d1
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable d2
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
	breq MJ_L33 # goto true branch
MJ_L34: # false branch
	ldi r24, 0
	jmp MJ_L35
MJ_L33: # true branch
	ldi r24, 1
MJ_L35: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L27

MJ_L28: # false branch
	ldi r24, 0
	jmp MJ_L29

MJ_L27: # true branch
	ldi r24, 1

MJ_L29: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L30
	jmp MJ_L31

MJ_L30: # then branch
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

	jmp MJ_L32 # jump over the else branch

MJ_L31: # else branch
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

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

MJ_L32: 
	/* epilogue start for TestThis_testClassComparison */
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
	.size TestThis_testClassComparison, .-TestThis_testClassComparison

