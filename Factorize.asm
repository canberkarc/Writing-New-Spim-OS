.data
	enterance: .asciiz "\nPlease enter an integer to see its factors\n"
.text
	li $v0 4	# print string
	la $a0 enterance
	syscall

	li $v0 5
	syscall
	move $t0 $v0	# $t0: entered integer	
	li $t1, 1
	loop:
		div $t0, $t1
		mfhi $t2
		addi $t1, $t1, 1
		bgt $t1, $t0, exit
		bne $t2, $zero, loop
		# print integer if remainder is zero
		li $v0 1	
		addi $a0, $t1, -1	
		syscall
		li $a0, 32	# 32 is the ascii of space character
		li $v0, 11    
		syscall
		bne $t1, $t0, loop
	exit:	
		li $v0 1	
		move $a0, $t0	
		syscall
		li $v0 10
		syscall

