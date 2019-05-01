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
	ldi r24, lo8(10)
	ldi r25, hi8(10)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
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
	# load a two bytes expression off stack
	pop r22
	pop r23
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call TestVarDecl_func

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global TestVarDecl_func
	.type TestVarDecl_func, @function
TestVarDecl_func:
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
	# Copy stack pointer to frame pointer
	in r28, __SP_L__
	in r29, __SP_H__
	# save off parameters
	# implicit this pointer
	std Y + 2, r25
	std Y + 1, r24
	std Y + 4, r23
	std Y + 3, r22
	/* done with function TestVarDecl_func prologue */



	### AssignStatement
	# eval rhs exp
	# Load constant int 11
	ldi r24, lo8(11)
	ldi r25, hi8(11)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	# load rhs exp
	pop r24
	pop r25
	# store rhs into var aa
	std Y + 6, r25
	std Y + 5, r24

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

	# load rhs exp
	pop r24
	# store rhs into var bb
	std Y + 9, r24

	### AssignStatement
	# eval rhs exp
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

	# load rhs exp
	pop r24
	# store rhs into var c
	std Y + 11, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 4
	ldi r24, lo8(4)
	ldi r25, hi8(4)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# load rhs exp
	pop r24
	# store rhs into var d
	std Y + 10, r24

	### AssignStatement
	# eval rhs exp
	# True/1 expression
	ldi r22, lo8(1)
	# push one byte expression onto stack
	push r22
	# load rhs exp
	pop r24
	# store rhs into var cc
	std Y + 12, r24

	### AssignStatement
	# eval rhs exp
	# start a add operation
	# start a add operation
	# IdExp
	# load value for variable b
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 2
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L0
	ldi r25, 0
	jmp MJ_L1
MJ_L0: 
	ldi r25, hi8(-1)
MJ_L1: 
	push r25
	push r24
	# IdExp
	# load value for variable c
	# load a one byte variable from base+offset
	ldd r24, Y + 11
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable d
	# load a one byte variable from base+offset
	ldd r24, Y + 10
	# push one byte expression onto stack
	push r24

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
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# x = x - y
	# load y
	pop r18 # lower bits of y
	pop r19 # higher bits of y
	# load x
	pop r24 # lower bits of x
	pop r25 # higher bits of x
	# Do INT sub operation
	sub r24, r18
	sbc r25, r19
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits
	# IdExp
	# load value for variable c
	# load a one byte variable from base+offset
	ldd r24, Y + 11
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable d
	# load a one byte variable from base+offset
	ldd r24, Y + 10
	# push one byte expression onto stack
	push r24

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
	# store rhs into var a
	std Y + 8, r25
	std Y + 7, r24

	### AssignStatement
	# eval rhs exp
	# Color expression Meggy.Color.GREEN
	ldi r22, 4
	# push one byte expression onto stack
	push r22

	# load rhs exp
	pop r24
	# store rhs into var ccolor
	std Y + 13, r24
	# IdExp
	# load value for variable bb
	# load a one byte variable from base+offset
	ldd r24, Y + 9
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable bb
	# load a one byte variable from base+offset
	ldd r24, Y + 9
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable ccolor
	# load a one byte variable from base+offset
	ldd r24, Y + 13
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

	#### if statement
	# start equality check
	# push Meggy.Button.Up
	ldi r24, 4
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Up
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L9 # goto false branch
MJ_L8: # if true
	ldi r24, 1
	jmp MJ_L10
MJ_L9: # false branch, r24 is already 0, do nothing
MJ_L10: 
	push r24
	# False/0 expression
	ldi r22, 0
	# push one byte expression onto stack
	push r22

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L14
	ldi r25, 0
	jmp MJ_L15
MJ_L14: 
	ldi r25, hi8(-1)
MJ_L15: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L16
	ldi r25, 0
	jmp MJ_L17
MJ_L16: 
	ldi r25, hi8(-1)
MJ_L17: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L11 # goto true branch
MJ_L12: # false branch
	ldi r24, 0
	jmp MJ_L13
MJ_L11: # true branch
	ldi r24, 1
MJ_L13: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L2

MJ_L3: # false branch
	ldi r24, 0
	jmp MJ_L4

MJ_L2: # true branch
	ldi r24, 1

MJ_L4: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L5
	jmp MJ_L6

MJ_L5: # then branch

	### AssignStatement
	# eval rhs exp

	# PushMeggy.Tone.Cs3 onto the stack.
	ldi r25, hi8(57724)
	ldi r24, lo8(57724)
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var ttone
	std Y + 16, r25
	std Y + 15, r24
	# IdExp
	# load value for variable ttone
	# load a two byte variable from base+offset
	ldd r25, Y + 16
	ldd r24, Y + 15
	# push two byte expression onto stack
	push r25
	push r24
	# IdExp
	# load value for variable aa
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
	jmp MJ_L7 # jump over the else branch

MJ_L6: # else branch
MJ_L7: 
	# IdExp
	# load value for variable aa
	# load a two byte variable from base+offset
	ldd r25, Y + 6
	ldd r24, Y + 5
	# push two byte expression onto stack
	push r25
	push r24
	/* epilogue start for TestVarDecl_func */
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
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size TestVarDecl_func, .-TestVarDecl_func

