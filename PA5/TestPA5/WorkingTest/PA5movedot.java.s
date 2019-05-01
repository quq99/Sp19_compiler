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
	ldi r24, lo8(3)
	ldi r25, hi8(3)
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
	call Dot_run

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main



	.text
.global Dot_run
	.type Dot_run, @function
Dot_run:
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
	/* done with function Dot_run prologue */



	### AssignStatement
	# eval rhs exp

	# PushMeggy.Tone.C3 onto the stack.
	ldi r25, hi8(61157)
	ldi r24, lo8(61157)
	# push two byte expression onto stack
	push r25
	push r24
	# load rhs exp
	pop r24
	pop r25
	# store rhs into var localvar
	std Y + 4, r25
	std Y + 3, r24

	### AssignStatement
	# eval rhs exp
	# Color expression Meggy.Color.ORANGE
	ldi r22, 2
	# push one byte expression onto stack
	push r22

	# load rhs exp
	pop r24
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var dotcolor
	std Z + 2, r24

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
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var curr_x
	std Z + 0, r24

	### AssignStatement
	# eval rhs exp
	# Load constant int 6
	ldi r24, lo8(6)
	ldi r25, hi8(6)
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
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var curr_y
	std Z + 1, r24

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
	#### if statement
	# push Meggy.Button.Up
	ldi r24, 4
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Up
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L10 # goto false branch
MJ_L9: # if true
	ldi r24, 1
	jmp MJ_L11
MJ_L10: # false branch, r24 is already 0, do nothing
MJ_L11: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L3

MJ_L4: # false branch
	ldi r24, 0
	jmp MJ_L5

MJ_L3: # true branch
	ldi r24, 1

MJ_L5: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L6
	jmp MJ_L7

MJ_L6: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable curr_x
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 0
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable curr_y
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L12
	ldi r25, 0
	jmp MJ_L13
MJ_L12: 
	ldi r25, hi8(-1)
MJ_L13: 
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Dot_movedot
	# IdExp
	# load value for variable localvar
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 50
	ldi r24, lo8(50)
	ldi r25, hi8(50)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	jmp MJ_L8 # jump over the else branch

MJ_L7: # else branch
MJ_L8: 
	#### if statement
	# push Meggy.Button.Down
	ldi r24, 8
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Down
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L23 # goto false branch
MJ_L22: # if true
	ldi r24, 1
	jmp MJ_L24
MJ_L23: # false branch, r24 is already 0, do nothing
MJ_L24: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L16

MJ_L17: # false branch
	ldi r24, 0
	jmp MJ_L18

MJ_L16: # true branch
	ldi r24, 1

MJ_L18: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L19
	jmp MJ_L20

MJ_L19: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable curr_x
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 0
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable curr_y
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L25
	ldi r25, 0
	jmp MJ_L26
MJ_L25: 
	ldi r25, hi8(-1)
MJ_L26: 
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Dot_movedot
	# IdExp
	# load value for variable localvar
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 50
	ldi r24, lo8(50)
	ldi r25, hi8(50)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	jmp MJ_L21 # jump over the else branch

MJ_L20: # else branch
MJ_L21: 
	#### if statement
	# push Meggy.Button.Left
	ldi r24, 16
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Left
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L36 # goto false branch
MJ_L35: # if true
	ldi r24, 1
	jmp MJ_L37
MJ_L36: # false branch, r24 is already 0, do nothing
MJ_L37: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L29

MJ_L30: # false branch
	ldi r24, 0
	jmp MJ_L31

MJ_L29: # true branch
	ldi r24, 1

MJ_L31: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L32
	jmp MJ_L33

MJ_L32: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable curr_x
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 0
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L38
	ldi r25, 0
	jmp MJ_L39
MJ_L38: 
	ldi r25, hi8(-1)
MJ_L39: 
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


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L40
	ldi r25, 0
	jmp MJ_L41
MJ_L40: 
	ldi r25, hi8(-1)
MJ_L41: 
	push r25
	push r24

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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable curr_y
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Dot_movedot
	# IdExp
	# load value for variable localvar
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 50
	ldi r24, lo8(50)
	ldi r25, hi8(50)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	jmp MJ_L34 # jump over the else branch

MJ_L33: # else branch
MJ_L34: 
	#### if statement
	# push Meggy.Button.Right
	ldi r24, 32
	push r24
	pop r25 # get button literal
	### MeggyCheckButton
	call _Z16CheckButtonsDownv
	lds r24, Button_Right
	# if button value is zero, push 0 else push 1
	tst r24 # Test for Zero or Minus
	breq MJ_L49 # goto false branch
MJ_L48: # if true
	ldi r24, 1
	jmp MJ_L50
MJ_L49: # false branch, r24 is already 0, do nothing
MJ_L50: 
	push r24
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L42

MJ_L43: # false branch
	ldi r24, 0
	jmp MJ_L44

MJ_L42: # true branch
	ldi r24, 1

MJ_L44: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L45
	jmp MJ_L46

MJ_L45: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable curr_x
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 0
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L51
	ldi r25, 0
	jmp MJ_L52
MJ_L51: 
	ldi r25, hi8(-1)
MJ_L52: 
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


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L53
	ldi r25, 0
	jmp MJ_L54
MJ_L53: 
	ldi r25, hi8(-1)
MJ_L54: 
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# IdExp
	# load value for variable curr_y
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Dot_movedot
	# IdExp
	# load value for variable localvar
	# load a two byte variable from base+offset
	ldd r25, Y + 4
	ldd r24, Y + 3
	# push two byte expression onto stack
	push r25
	push r24
	# Load constant int 50
	ldi r24, lo8(50)
	ldi r25, hi8(50)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	### Meggy.toneStart(tone, time_ms) call
	# load a two byte expression off stack
	pop r22
	pop r23
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z10Tone_Startjj
	jmp MJ_L47 # jump over the else branch

MJ_L46: # else branch
MJ_L47: 
	# Load constant int 100
	ldi r24, lo8(100)
	ldi r25, hi8(100)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop
	/* epilogue start for Dot_run */
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
	.size Dot_run, .-Dot_run


	.text
.global Dot_movedot
	.type Dot_movedot, @function
Dot_movedot:
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
	std Y + 3, r22
	std Y + 4, r20
	/* done with function Dot_movedot prologue */


	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call Dot_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L55

MJ_L56: # false branch
	ldi r24, 0
	jmp MJ_L57

MJ_L55: # true branch
	ldi r24, 1

MJ_L57: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L58
	jmp MJ_L59

MJ_L58: # then branch
	# IdExp
	# load value for variable curr_x
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 0
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable curr_y
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 1
	# push one byte expression onto stack
	push r24
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

	# IdExp
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable dotcolor
	# loading the implicit "this"
	ldd    r31, Y + 2
	ldd    r30, Y + 1
	# load a one byte variable from base+offset
	ldd r24, Z + 2
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
	# IdExp
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var curr_x
	std Z + 0, r24

	### AssignStatement
	# eval rhs exp
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# load rhs exp
	pop r24
	# loading the implicit "this"
	ldd r31, Y + 2
	ldd r30, Y + 1
	# store rhs into var curr_y
	std Z + 1, r24
	jmp MJ_L60 # jump over the else branch

MJ_L59: # else branch
MJ_L60: 
	/* epilogue start for Dot_movedot */
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
	.size Dot_movedot, .-Dot_movedot


	.text
.global Dot_inBounds
	.type Dot_inBounds, @function
Dot_inBounds:
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
	std Y + 3, r22
	std Y + 4, r20
	/* done with function Dot_inBounds prologue */


	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
	#### short-circuited && operation
	# &&: left operand
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L61
	ldi r25, 0
	jmp MJ_L62
MJ_L61: 
	ldi r25, hi8(-1)
MJ_L62: 
	push r25
	push r24
	# IdExp
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L63
	ldi r25, 0
	jmp MJ_L64
MJ_L63: 
	ldi r25, hi8(-1)
MJ_L64: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L65
MJ_L66: # load false
	ldi r24, 0
	jmp MJ_L67
MJ_L65: # load true
	ldi r24, 1
MJ_L67: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L69 # if the left expr is false

MJ_L68: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L71
	ldi r25, 0
	jmp MJ_L72
MJ_L71: 
	ldi r25, hi8(-1)
MJ_L72: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L73
	ldi r25, 0
	jmp MJ_L74
MJ_L73: 
	ldi r25, hi8(-1)
MJ_L74: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L75
MJ_L76: # load false
	ldi r24, 0
	jmp MJ_L77
MJ_L75: # load true
	ldi r24, 1
MJ_L77: 
	push r24 # push the result of less than
	jmp MJ_L70

MJ_L69: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L70: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L79 # if the left expr is false

MJ_L78: # if left expr is true
	# &&: right operand
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

	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L81
	ldi r25, 0
	jmp MJ_L82
MJ_L81: 
	ldi r25, hi8(-1)
MJ_L82: 
	push r25
	push r24
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L83
	ldi r25, 0
	jmp MJ_L84
MJ_L83: 
	ldi r25, hi8(-1)
MJ_L84: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L85
MJ_L86: # load false
	ldi r24, 0
	jmp MJ_L87
MJ_L85: # load true
	ldi r24, 1
MJ_L87: 
	push r24 # push the result of less than
	jmp MJ_L80

MJ_L79: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L80: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L89 # if the left expr is false

MJ_L88: # if left expr is true
	# &&: right operand
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L91
	ldi r25, 0
	jmp MJ_L92
MJ_L91: 
	ldi r25, hi8(-1)
MJ_L92: 
	push r25
	push r24
	# Load constant int 8
	ldi r24, lo8(8)
	ldi r25, hi8(8)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L93
	ldi r25, 0
	jmp MJ_L94
MJ_L93: 
	ldi r25, hi8(-1)
MJ_L94: 
	push r25
	push r24
	# less than expression
	# load a two byte expression off stack
	pop r18
	pop r19
	# load a two byte expression off stack
	pop r24
	pop r25
	cp r24, r18
	cpc r25, r19
	brlt MJ_L95
MJ_L96: # load false
	ldi r24, 0
	jmp MJ_L97
MJ_L95: # load true
	ldi r24, 1
MJ_L97: 
	push r24 # push the result of less than
	jmp MJ_L90

MJ_L89: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L90: 
	/* epilogue start for Dot_inBounds */
	# handle return value
	# load a one byte expression off stack
	pop r25
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Dot_inBounds, .-Dot_inBounds

