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
	# NewExp
	ldi r24, lo8(0)
	ldi r25, hi8(0)
	# allocating object of size 0 on heap
	call malloc
	# push object address
	# push two byte expression onto stack
	push r25
	push r24
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

	# Load constant int 7
	ldi r24, lo8(7)
	ldi r25, hi8(7)
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
	call class_Cloud_rain
	# Load constant int 500
	ldi r24, lo8(500)
	ldi r25, hi8(500)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits

	### Meggy.delay() call
	# load delay parameter
	# load a two byte expression off stack
	pop r24
	pop r25
	call _Z8delay_msj
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

	# Color expression Meggy.Color.ORANGE
	ldi r22, 2
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

	jmp MJ_L0 # go back to condition
MJ_L2: 
	### end of while loop

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


	.text
.global Cloud_rain
	.type Cloud_rain, @function
Cloud_rain:
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
	/* done with function Cloud_rain prologue */


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
	call class_Cloud_inBounds
	# handle return value
	# push one byte expression onto stack
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
	# Color expression Meggy.Color.BLUE
	ldi r22, 5
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
	# start a add operation
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L15
	ldi r25, 0
	jmp MJ_L16
MJ_L15: 
	ldi r25, hi8(-1)
MJ_L16: 
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
	brlt MJ_L17
	ldi r25, 0
	jmp MJ_L18
MJ_L17: 
	ldi r25, hi8(-1)
MJ_L18: 
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
	call class_Cloud_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

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
	# load value for variable x
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable y
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L19
	ldi r25, 0
	jmp MJ_L20
MJ_L19: 
	ldi r25, hi8(-1)
MJ_L20: 
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
	brlt MJ_L21
	ldi r25, 0
	jmp MJ_L22
MJ_L21: 
	ldi r25, hi8(-1)
MJ_L22: 
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

	jmp MJ_L14 # jump over the else branch

MJ_L13: # else branch
MJ_L14: 
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

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L23
	ldi r25, 0
	jmp MJ_L24
MJ_L23: 
	ldi r25, hi8(-1)
MJ_L24: 
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
	brlt MJ_L25
	ldi r25, 0
	jmp MJ_L26
MJ_L25: 
	ldi r25, hi8(-1)
MJ_L26: 
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
	call class_Cloud_rain
	jmp MJ_L8 # jump over the else branch

MJ_L7: # else branch
MJ_L8: 
	/* epilogue start for Cloud_rain */
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
	.size Cloud_rain, .-Cloud_rain


	.text
.global Cloud_inBounds
	.type Cloud_inBounds, @function
Cloud_inBounds:
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
	/* done with function Cloud_inBounds prologue */


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
	brlt MJ_L27
	ldi r25, 0
	jmp MJ_L28
MJ_L27: 
	ldi r25, hi8(-1)
MJ_L28: 
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
	brlt MJ_L29
	ldi r25, 0
	jmp MJ_L30
MJ_L29: 
	ldi r25, hi8(-1)
MJ_L30: 
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
	brlt MJ_L31
MJ_L32: # load false
	ldi r24, 0
	jmp MJ_L33
MJ_L31: # load true
	ldi r24, 1
MJ_L33: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L35 # if the left expr is false

MJ_L34: # if left expr is true
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
	brlt MJ_L37
	ldi r25, 0
	jmp MJ_L38
MJ_L37: 
	ldi r25, hi8(-1)
MJ_L38: 
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
	brlt MJ_L39
	ldi r25, 0
	jmp MJ_L40
MJ_L39: 
	ldi r25, hi8(-1)
MJ_L40: 
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
	brlt MJ_L41
MJ_L42: # load false
	ldi r24, 0
	jmp MJ_L43
MJ_L41: # load true
	ldi r24, 1
MJ_L43: 
	push r24 # push the result of less than
	jmp MJ_L36

MJ_L35: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L36: 
	/* epilogue start for Cloud_inBounds */
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
	.size Cloud_inBounds, .-Cloud_inBounds

