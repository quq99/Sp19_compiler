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
	call class_Solver_run

/* epilogue start */
    endLabel:
    jmp endLabel
    ret
    .size   main, .-main


	.text
.global Solver_initMaze1
	.type Solver_initMaze1, @function
Solver_initMaze1:
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
	/* done with function Solver_initMaze1 prologue */


	/* epilogue start for Solver_initMaze1 */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_initMaze1, .-Solver_initMaze1


	.text
.global Solver_initMaze2
	.type Solver_initMaze2, @function
Solver_initMaze2:
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
	/* done with function Solver_initMaze2 prologue */


	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeRow
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeRow
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeCol
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeCol
	/* epilogue start for Solver_initMaze2 */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_initMaze2, .-Solver_initMaze2


	.text
.global Solver_initMazeCool
	.type Solver_initMazeCool, @function
Solver_initMazeCool:
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
	/* done with function Solver_initMazeCool prologue */


	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeRow
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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


	#### function call
	# put parameter values into appropriate registers
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
	call class_Solver_mazeRow
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeCol
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeCol
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
	# push two byte expression onto stack
	push r25 # higher bits
	push r24 # lower bits


	# Casting int to byte by popping
	# 2 bytes off stack and only pushing low order bits
	# back on.  Low order bits are on top of stack.
	pop r24 # pop lower bits
	pop r25 # pop higher bits
	push r24 # push lower bits back 

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeRow
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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
	pop r18
	# load a one byte expression off stack
	pop r20
	# load a one byte expression off stack
	pop r22
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_mazeCol
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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

	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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


	#### function call
	# put parameter values into appropriate registers
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
	call class_Solver_mazeRow
	# Load constant int 5
	ldi r24, lo8(5)
	ldi r25, hi8(5)
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

	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
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

	/* epilogue start for Solver_initMazeCool */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_initMazeCool, .-Solver_initMazeCool


	.text
.global Solver_run
	.type Solver_run, @function
Solver_run:
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
	/* done with function Solver_run prologue */


	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30

	#### function call
	# put parameter values into appropriate registers
	# receiver will be passed as first param
	# load a two byte expression off stack
	pop r24
	pop r25
	call class_Solver_initMazeCool
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
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
	call class_Solver_move
	/* epilogue start for Solver_run */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_run, .-Solver_run


	.text
.global Solver_inBounds
	.type Solver_inBounds, @function
Solver_inBounds:
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
	/* done with function Solver_inBounds prologue */


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
	brlt MJ_L0
	ldi r25, 0
	jmp MJ_L1
MJ_L0: 
	ldi r25, hi8(-1)
MJ_L1: 
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
	brlt MJ_L2
	ldi r25, 0
	jmp MJ_L3
MJ_L2: 
	ldi r25, hi8(-1)
MJ_L3: 
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
	brlt MJ_L4
MJ_L5: # load false
	ldi r24, 0
	jmp MJ_L6
MJ_L4: # load true
	ldi r24, 1
MJ_L6: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L8 # if the left expr is false

MJ_L7: # if left expr is true
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
	brlt MJ_L10
	ldi r25, 0
	jmp MJ_L11
MJ_L10: 
	ldi r25, hi8(-1)
MJ_L11: 
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
	brlt MJ_L12
	ldi r25, 0
	jmp MJ_L13
MJ_L12: 
	ldi r25, hi8(-1)
MJ_L13: 
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
	brlt MJ_L14
MJ_L15: # load false
	ldi r24, 0
	jmp MJ_L16
MJ_L14: # load true
	ldi r24, 1
MJ_L16: 
	push r24 # push the result of less than
	jmp MJ_L9

MJ_L8: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L9: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L18 # if the left expr is false

MJ_L17: # if left expr is true
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
	brlt MJ_L20
	ldi r25, 0
	jmp MJ_L21
MJ_L20: 
	ldi r25, hi8(-1)
MJ_L21: 
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
	brlt MJ_L22
	ldi r25, 0
	jmp MJ_L23
MJ_L22: 
	ldi r25, hi8(-1)
MJ_L23: 
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
	brlt MJ_L24
MJ_L25: # load false
	ldi r24, 0
	jmp MJ_L26
MJ_L24: # load true
	ldi r24, 1
MJ_L26: 
	push r24 # push the result of less than
	jmp MJ_L19

MJ_L18: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L19: 
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L28 # if the left expr is false

MJ_L27: # if left expr is true
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
	brlt MJ_L30
	ldi r25, 0
	jmp MJ_L31
MJ_L30: 
	ldi r25, hi8(-1)
MJ_L31: 
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
	brlt MJ_L32
	ldi r25, 0
	jmp MJ_L33
MJ_L32: 
	ldi r25, hi8(-1)
MJ_L33: 
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
	brlt MJ_L34
MJ_L35: # load false
	ldi r24, 0
	jmp MJ_L36
MJ_L34: # load true
	ldi r24, 1
MJ_L36: 
	push r24 # push the result of less than
	jmp MJ_L29

MJ_L28: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L29: 
	/* epilogue start for Solver_inBounds */
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
	.size Solver_inBounds, .-Solver_inBounds


	.text
.global Solver_isDark
	.type Solver_isDark, @function
Solver_isDark:
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
	/* done with function Solver_isDark prologue */


	#### short-circuited && operation
	# &&: left operand
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
	call class_Solver_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L38 # if the left expr is false

MJ_L37: # if left expr is true
	# &&: right operand
	# start equality check
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
	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6ReadPxhh
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.DARK
	ldi r22, 0
	# push one byte expression onto stack
	push r22


	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L43
	ldi r25, 0
	jmp MJ_L44
MJ_L43: 
	ldi r25, hi8(-1)
MJ_L44: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L45
	ldi r25, 0
	jmp MJ_L46
MJ_L45: 
	ldi r25, hi8(-1)
MJ_L46: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L40 # goto true branch
MJ_L41: # false branch
	ldi r24, 0
	jmp MJ_L42
MJ_L40: # true branch
	ldi r24, 1
MJ_L42: 
	push r24 # push the result on stack
	jmp MJ_L39

MJ_L38: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L39: 
	/* epilogue start for Solver_isDark */
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
	.size Solver_isDark, .-Solver_isDark


	.text
.global Solver_isBLUE
	.type Solver_isBLUE, @function
Solver_isBLUE:
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
	/* done with function Solver_isBLUE prologue */


	#### short-circuited && operation
	# &&: left operand
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
	call class_Solver_inBounds
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L48 # if the left expr is false

MJ_L47: # if left expr is true
	# &&: right operand
	# start equality check
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
	### Meggy.getPixel(x,y) call
	# load a one byte expression off stack
	pop r22
	# load a one byte expression off stack
	pop r24
	call _Z6ReadPxhh
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.BLUE
	ldi r22, 5
	# push one byte expression onto stack
	push r22


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
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L55
	ldi r25, 0
	jmp MJ_L56
MJ_L55: 
	ldi r25, hi8(-1)
MJ_L56: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L50 # goto true branch
MJ_L51: # false branch
	ldi r24, 0
	jmp MJ_L52
MJ_L50: # true branch
	ldi r24, 1
MJ_L52: 
	push r24 # push the result on stack
	jmp MJ_L49

MJ_L48: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L49: 
	/* epilogue start for Solver_isBLUE */
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
	.size Solver_isBLUE, .-Solver_isBLUE


	.text
.global Solver_findTargetOrMove
	.type Solver_findTargetOrMove, @function
Solver_findTargetOrMove:
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
	std Y + 3, r22
	std Y + 4, r20
	std Y + 5, r18
	std Y + 6, r16
	/* done with function Solver_findTargetOrMove prologue */


	#### if statement
	#### short-circuited && operation
	# &&: left operand
	# start equality check
	# IdExp
	# load value for variable nextX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L66
	ldi r25, 0
	jmp MJ_L67
MJ_L66: 
	ldi r25, hi8(-1)
MJ_L67: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L68
	ldi r25, 0
	jmp MJ_L69
MJ_L68: 
	ldi r25, hi8(-1)
MJ_L69: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L63 # goto true branch
MJ_L64: # false branch
	ldi r24, 0
	jmp MJ_L65
MJ_L63: # true branch
	ldi r24, 1
MJ_L65: 
	push r24 # push the result on stack
	ldi r24, 1
	pop r25
	cp r24, r25
	brne MJ_L71 # if the left expr is false

MJ_L70: # if left expr is true
	# &&: right operand
	# start equality check
	# IdExp
	# load value for variable nextY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L76
	ldi r25, 0
	jmp MJ_L77
MJ_L76: 
	ldi r25, hi8(-1)
MJ_L77: 
	push r25
	push r24
	# right operand of ==
	pop r18
	pop r19

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L78
	ldi r25, 0
	jmp MJ_L79
MJ_L78: 
	ldi r25, hi8(-1)
MJ_L79: 
	push r25
	push r24
	# left operand of ==
	pop r24
	pop r25
	# compare the operands
	cp r24, r18
	cpc r25, r19
	breq MJ_L73 # goto true branch
MJ_L74: # false branch
	ldi r24, 0
	jmp MJ_L75
MJ_L73: # true branch
	ldi r24, 1
MJ_L75: 
	push r24 # push the result on stack
	jmp MJ_L72

MJ_L71: # false branch
	ldi r24, 0
	push r24 # push false on stack

MJ_L72: 
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L57

MJ_L58: # false branch
	ldi r24, 0
	jmp MJ_L59

MJ_L57: # true branch
	ldi r24, 1

MJ_L59: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L60
	jmp MJ_L61

MJ_L60: # then branch
	# IdExp
	# load value for variable nextX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
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

	jmp MJ_L62 # jump over the else branch

MJ_L61: # else branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable nextX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable nextY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_move
MJ_L62: 
	/* epilogue start for Solver_findTargetOrMove */
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
	.size Solver_findTargetOrMove, .-Solver_findTargetOrMove


	.text
.global Solver_move
	.type Solver_move, @function
Solver_move:
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
	std Y + 3, r22
	std Y + 4, r20
	std Y + 5, r18
	std Y + 6, r16
	/* done with function Solver_move prologue */


	# Load constant int 256
	ldi r24, lo8(256)
	ldi r25, hi8(256)
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
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
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
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L86
	ldi r25, 0
	jmp MJ_L87
MJ_L86: 
	ldi r25, hi8(-1)
MJ_L87: 
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
	brlt MJ_L88
	ldi r25, 0
	jmp MJ_L89
MJ_L88: 
	ldi r25, hi8(-1)
MJ_L89: 
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
	call class_Solver_isDark
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L80

MJ_L81: # false branch
	ldi r24, 0
	jmp MJ_L82

MJ_L80: # true branch
	ldi r24, 1

MJ_L82: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L83
	jmp MJ_L84

MJ_L83: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L90
	ldi r25, 0
	jmp MJ_L91
MJ_L90: 
	ldi r25, hi8(-1)
MJ_L91: 
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
	brlt MJ_L92
	ldi r25, 0
	jmp MJ_L93
MJ_L92: 
	ldi r25, hi8(-1)
MJ_L93: 
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
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_findTargetOrMove
	jmp MJ_L85 # jump over the else branch

MJ_L84: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L100
	ldi r25, 0
	jmp MJ_L101
MJ_L100: 
	ldi r25, hi8(-1)
MJ_L101: 
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
	brlt MJ_L102
	ldi r25, 0
	jmp MJ_L103
MJ_L102: 
	ldi r25, hi8(-1)
MJ_L103: 
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
	# load value for variable currentY
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
	call class_Solver_isDark
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L94

MJ_L95: # false branch
	ldi r24, 0
	jmp MJ_L96

MJ_L94: # true branch
	ldi r24, 1

MJ_L96: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L97
	jmp MJ_L98

MJ_L97: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L104
	ldi r25, 0
	jmp MJ_L105
MJ_L104: 
	ldi r25, hi8(-1)
MJ_L105: 
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
	brlt MJ_L106
	ldi r25, 0
	jmp MJ_L107
MJ_L106: 
	ldi r25, hi8(-1)
MJ_L107: 
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
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_findTargetOrMove
	jmp MJ_L99 # jump over the else branch

MJ_L98: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L114
	ldi r25, 0
	jmp MJ_L115
MJ_L114: 
	ldi r25, hi8(-1)
MJ_L115: 
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
	brlt MJ_L116
	ldi r25, 0
	jmp MJ_L117
MJ_L116: 
	ldi r25, hi8(-1)
MJ_L117: 
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
	call class_Solver_isDark
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L108

MJ_L109: # false branch
	ldi r24, 0
	jmp MJ_L110

MJ_L108: # true branch
	ldi r24, 1

MJ_L110: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L111
	jmp MJ_L112

MJ_L111: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L118
	ldi r25, 0
	jmp MJ_L119
MJ_L118: 
	ldi r25, hi8(-1)
MJ_L119: 
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
	brlt MJ_L120
	ldi r25, 0
	jmp MJ_L121
MJ_L120: 
	ldi r25, hi8(-1)
MJ_L121: 
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
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_findTargetOrMove
	jmp MJ_L113 # jump over the else branch

MJ_L112: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L128
	ldi r25, 0
	jmp MJ_L129
MJ_L128: 
	ldi r25, hi8(-1)
MJ_L129: 
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
	brlt MJ_L130
	ldi r25, 0
	jmp MJ_L131
MJ_L130: 
	ldi r25, hi8(-1)
MJ_L131: 
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
	# load value for variable currentY
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
	call class_Solver_isDark
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L122

MJ_L123: # false branch
	ldi r24, 0
	jmp MJ_L124

MJ_L122: # true branch
	ldi r24, 1

MJ_L124: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L125
	jmp MJ_L126

MJ_L125: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L132
	ldi r25, 0
	jmp MJ_L133
MJ_L132: 
	ldi r25, hi8(-1)
MJ_L133: 
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
	brlt MJ_L134
	ldi r25, 0
	jmp MJ_L135
MJ_L134: 
	ldi r25, hi8(-1)
MJ_L135: 
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
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_findTargetOrMove
	jmp MJ_L127 # jump over the else branch

MJ_L126: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L142
	ldi r25, 0
	jmp MJ_L143
MJ_L142: 
	ldi r25, hi8(-1)
MJ_L143: 
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
	brlt MJ_L144
	ldi r25, 0
	jmp MJ_L145
MJ_L144: 
	ldi r25, hi8(-1)
MJ_L145: 
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
	call class_Solver_isBLUE
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L136

MJ_L137: # false branch
	ldi r24, 0
	jmp MJ_L138

MJ_L136: # true branch
	ldi r24, 1

MJ_L138: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L139
	jmp MJ_L140

MJ_L139: # then branch
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.YELLOW
	ldi r22, 3
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

	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L146
	ldi r25, 0
	jmp MJ_L147
MJ_L146: 
	ldi r25, hi8(-1)
MJ_L147: 
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
	brlt MJ_L148
	ldi r25, 0
	jmp MJ_L149
MJ_L148: 
	ldi r25, hi8(-1)
MJ_L149: 
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
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_move
	jmp MJ_L141 # jump over the else branch

MJ_L140: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L156
	ldi r25, 0
	jmp MJ_L157
MJ_L156: 
	ldi r25, hi8(-1)
MJ_L157: 
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
	brlt MJ_L158
	ldi r25, 0
	jmp MJ_L159
MJ_L158: 
	ldi r25, hi8(-1)
MJ_L159: 
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
	# load value for variable currentY
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
	call class_Solver_isBLUE
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L150

MJ_L151: # false branch
	ldi r24, 0
	jmp MJ_L152

MJ_L150: # true branch
	ldi r24, 1

MJ_L152: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L153
	jmp MJ_L154

MJ_L153: # then branch
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.YELLOW
	ldi r22, 3
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

	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L160
	ldi r25, 0
	jmp MJ_L161
MJ_L160: 
	ldi r25, hi8(-1)
MJ_L161: 
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
	brlt MJ_L162
	ldi r25, 0
	jmp MJ_L163
MJ_L162: 
	ldi r25, hi8(-1)
MJ_L163: 
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
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_move
	jmp MJ_L155 # jump over the else branch

MJ_L154: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L170
	ldi r25, 0
	jmp MJ_L171
MJ_L170: 
	ldi r25, hi8(-1)
MJ_L171: 
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
	brlt MJ_L172
	ldi r25, 0
	jmp MJ_L173
MJ_L172: 
	ldi r25, hi8(-1)
MJ_L173: 
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
	call class_Solver_isBLUE
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L164

MJ_L165: # false branch
	ldi r24, 0
	jmp MJ_L166

MJ_L164: # true branch
	ldi r24, 1

MJ_L166: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L167
	jmp MJ_L168

MJ_L167: # then branch
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.YELLOW
	ldi r22, 3
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

	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L174
	ldi r25, 0
	jmp MJ_L175
MJ_L174: 
	ldi r25, hi8(-1)
MJ_L175: 
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
	brlt MJ_L176
	ldi r25, 0
	jmp MJ_L177
MJ_L176: 
	ldi r25, hi8(-1)
MJ_L177: 
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
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_move
	jmp MJ_L169 # jump over the else branch

MJ_L168: # else branch
	#### if statement
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L184
	ldi r25, 0
	jmp MJ_L185
MJ_L184: 
	ldi r25, hi8(-1)
MJ_L185: 
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
	brlt MJ_L186
	ldi r25, 0
	jmp MJ_L187
MJ_L186: 
	ldi r25, hi8(-1)
MJ_L187: 
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
	# load value for variable currentY
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
	call class_Solver_isBLUE
	# handle return value
	# push one byte expression onto stack
	push r24

	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L178

MJ_L179: # false branch
	ldi r24, 0
	jmp MJ_L180

MJ_L178: # true branch
	ldi r24, 1

MJ_L180: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L181
	jmp MJ_L182

MJ_L181: # then branch
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.YELLOW
	ldi r22, 3
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

	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable currentX
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L188
	ldi r25, 0
	jmp MJ_L189
MJ_L188: 
	ldi r25, hi8(-1)
MJ_L189: 
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
	brlt MJ_L190
	ldi r25, 0
	jmp MJ_L191
MJ_L190: 
	ldi r25, hi8(-1)
MJ_L191: 
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
	# load value for variable currentY
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetX
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable targetY
	# load a one byte variable from base+offset
	ldd r24, Y + 6
	# push one byte expression onto stack
	push r24

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
	call class_Solver_move
	jmp MJ_L183 # jump over the else branch

MJ_L182: # else branch
MJ_L183: 
MJ_L169: 
MJ_L155: 
MJ_L141: 
MJ_L127: 
MJ_L113: 
MJ_L99: 
MJ_L85: 
	/* epilogue start for Solver_move */
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
	.size Solver_move, .-Solver_move


	.text
.global Solver_mazeRow
	.type Solver_mazeRow, @function
Solver_mazeRow:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
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
	/* done with function Solver_mazeRow prologue */


	# IdExp
	# load value for variable startcol
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable row
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
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
	# IdExp
	# load value for variable startcol
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L198
	ldi r25, 0
	jmp MJ_L199
MJ_L198: 
	ldi r25, hi8(-1)
MJ_L199: 
	push r25
	push r24
	# IdExp
	# load value for variable endcol
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L200
	ldi r25, 0
	jmp MJ_L201
MJ_L200: 
	ldi r25, hi8(-1)
MJ_L201: 
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
	brlt MJ_L202
MJ_L203: # load false
	ldi r24, 0
	jmp MJ_L204
MJ_L202: # load true
	ldi r24, 1
MJ_L204: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L192

MJ_L193: # false branch
	ldi r24, 0
	jmp MJ_L194

MJ_L192: # true branch
	ldi r24, 1

MJ_L194: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L195
	jmp MJ_L196

MJ_L195: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# start a add operation
	# IdExp
	# load value for variable startcol
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L205
	ldi r25, 0
	jmp MJ_L206
MJ_L205: 
	ldi r25, hi8(-1)
MJ_L206: 
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
	brlt MJ_L207
	ldi r25, 0
	jmp MJ_L208
MJ_L207: 
	ldi r25, hi8(-1)
MJ_L208: 
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
	# load value for variable endcol
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable row
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
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
	call class_Solver_mazeRow
	jmp MJ_L197 # jump over the else branch

MJ_L196: # else branch
MJ_L197: 
	/* epilogue start for Solver_mazeRow */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_mazeRow, .-Solver_mazeRow


	.text
.global Solver_mazeCol
	.type Solver_mazeCol, @function
Solver_mazeCol:
	push r29
	push r28
	# make space for locals and params
	ldi r30, 0
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
	/* done with function Solver_mazeCol prologue */


	# IdExp
	# load value for variable col
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# IdExp
	# load value for variable startrow
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24
	# Color expression Meggy.Color.VIOLET
	ldi r22, 6
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
	# IdExp
	# load value for variable startrow
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L215
	ldi r25, 0
	jmp MJ_L216
MJ_L215: 
	ldi r25, hi8(-1)
MJ_L216: 
	push r25
	push r24
	# IdExp
	# load value for variable endrow
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L217
	ldi r25, 0
	jmp MJ_L218
MJ_L217: 
	ldi r25, hi8(-1)
MJ_L218: 
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
	brlt MJ_L219
MJ_L220: # load false
	ldi r24, 0
	jmp MJ_L221
MJ_L219: # load true
	ldi r24, 1
MJ_L221: 
	push r24 # push the result of less than
	ldi r24, 1
	pop r25
	cp r24, r25
	breq MJ_L209

MJ_L210: # false branch
	ldi r24, 0
	jmp MJ_L211

MJ_L209: # true branch
	ldi r24, 1

MJ_L211: # get comparison result
	# push comparison result onto stack
	push r24
	# load condition and branch if false
	# load a one byte expression off stack
	pop r24
	# load one into reg
	ldi r25, 1
	# use cp to set SREG
	cp r24, r25
	breq MJ_L212
	jmp MJ_L213

MJ_L212: # then branch
	# loading the implicit "this"
	# load a two byte variable from base+offset
	ldd r31, Y + 2
	ldd r30, Y + 1
	# push two byte expression onto stack
	push r31
	push r30
	# IdExp
	# load value for variable col
	# load a one byte variable from base+offset
	ldd r24, Y + 3
	# push one byte expression onto stack
	push r24
	# start a add operation
	# IdExp
	# load value for variable startrow
	# load a one byte variable from base+offset
	ldd r24, Y + 4
	# push one byte expression onto stack
	push r24

	## This is a auto typecast: promote Byte to Int
	pop r24 # pop byte as the lower bits
	tst r24
	brlt MJ_L222
	ldi r25, 0
	jmp MJ_L223
MJ_L222: 
	ldi r25, hi8(-1)
MJ_L223: 
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
	brlt MJ_L224
	ldi r25, 0
	jmp MJ_L225
MJ_L224: 
	ldi r25, hi8(-1)
MJ_L225: 
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
	# load value for variable endrow
	# load a one byte variable from base+offset
	ldd r24, Y + 5
	# push one byte expression onto stack
	push r24

	#### function call
	# put parameter values into appropriate registers
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
	call class_Solver_mazeCol
	jmp MJ_L214 # jump over the else branch

MJ_L213: # else branch
MJ_L214: 
	/* epilogue start for Solver_mazeCol */
	# handle return value
	# no return value
	# pop space off stack for parameters and locals
	pop r30
	pop r30
	pop r30
	pop r30
	pop r30
	# restoring the frame pointer
	pop r28
	pop r29
	ret
	.size Solver_mazeCol, .-Solver_mazeCol

