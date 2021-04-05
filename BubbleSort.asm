.globl main
.data
numbers: 		.word 3 8 13 6 1 37 42

##############################################################
.text	
		la $a0 numbers
		jal sortFunc

		move $a1, $a0
		lw $a0, ($a1)	 
				
Print:
		li $v0 1			
		syscall
		
		li $a0, 32				# 32 is the ascii of space character
		li $v0, 11    			# print_character
		syscall

		addi $a1, $a1, 4 		# Increment offset
		lw $a0, ($a1)	 		
		bne $a0, $zero, Print		
										
exit:		
		li $v0 10 	# exit syscall
		syscall


##############################################################
# a0 address to first value
sortFunc:
	addi $sp $sp -8
	sw $ra ($sp)   
 	sw $a0,4($sp)  
	
	li $t0, 1 		 	
	la $a0 numbers
	beqz $t0, exitSort 		
	li $t0, 0 			
loop:
	addi $a0, $a0, 4 		# Increment offset
	lw $t1, ($a0)	 		
	bne $t1, $zero, temp		
	la $a0 numbers
	beqz $t0, exitSort 		
	li $t0, 0 			
	b loop
temp:	addi $a1, $a0, -4 		
	lw $t2, ($a1)			# t2 is previous value
	lw $t3, ($a0)			# t3 is current value
	bgt $t2, $t3, swap 		
	j loop				
swap: 
	sw  $t3, ($a1)			
	sw  $t2, ($a0) 			
	li $t0, 1 			
	j loop				
exitSort: 
	lw $a0,4($sp)  			
	lw $ra ($sp)   			
	addi $sp $sp 8
	jr $ra