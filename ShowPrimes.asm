.globl main
.data
STRING:			.asciiz "\n "
PRIME:			.asciiz " PRIME"

.align 4
PRIME_NUMBERS_BUFFER:	.space 4000

.text
main:
	la $t0 PRIME_NUMBERS_BUFFER		# t0 is used to move left and right through the PRIME_NUMBERS_BUFFER
	move $s0, $t0				# s0 is used to always the place of last prime number
	li $t1, 2
	sw $t1, ($s0)				# First element of PRIME_NUMBERS_BUFFER is set as 2
	addi $s0, $s0, 4			# s0 is set as the place of next prime number
	
	# print 0
	li $v0 1	
	li $a0, 0	# print integer
	syscall
	
	# print \n 
	li $v0 4	# print string
	la $a0 STRING
	syscall
	
	# print 1
	li $v0 1	
	li $a0, 1	# print integer
	syscall
	
	# print \n 
	li $v0 4	# print string
	la $a0 STRING
	syscall
	
	# print 2
	li $v0 1	
	li $a0, 2	# print integer
	syscall
	
	# print \PRIME
	li $v0 4	# print string
	la $a0 PRIME
	syscall

	Loop_Range_3_to_1000:
	addi $t1, $t1, 1
	beq $t1 1001 exit				# For loop from 3 to 1000
	
	# print \n 
	li $v0 4	# print string
	la $a0 STRING
	syscall
	
	# print t1
	li $v0 1	
	move $a0, $t1	# print integer
	syscall

	la $t0, PRIME_NUMBERS_BUFFER
		Prime_Numbers_Division_Loop:
		lw $t2, ($t0)					
		beq $t2, $zero, Prime_Number_Found  	# Second for loop for to control whether the number can be divided by a prime number smaller than itself or not
		div $t1, $t2
		mfhi $t3				# t3 is the t1 % t2
		beq $t3, $zero, Loop_Range_3_to_1000	# If the number can be divided by a prime number smaller than itself then it is not a prime number
		addi $t0, $t0, 4			# The place of next prime number
		b Prime_Numbers_Division_Loop		# If mod is not zero (not divided by current prime number), then continoue to second loop to check if the number can be divided by next prime number or not
			Prime_Number_Found:
			sw $t1, ($t0)
			# print \PRIME
			li $v0 4
			la $a0 PRIME
			syscall
			b Loop_Range_3_to_1000
	
	exit:	
		li $v0 10 	# exit
		syscall
	
