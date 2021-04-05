.data 
	enterance: .asciiz "Welcome to New SpimOs\n"
    choice:  .asciiz "\nPlease enter the name of asm file you want to execute\n1-BubbleSort.asm\n2-Factorize.asm\n3-ShowPrimes.asm\n"
	bubbleSortBuffer: .asciiz "BubbleSort.asm\n"
	factorizeBuffer:  .asciiz "Factorize.asm\n"
	ShowPrimesBuffer:  .asciiz "ShowPrimes.asm\n"
	err: .asciiz"Not a valid choice!\n\n"

	line:.asciiz "\n"
	buffer: .space 256
.text
	.globl main
main:
	#printing enterance message
	la $a0, enterance
	li $v0, 4
	syscall

loop: 
		
	#printing choice message
	la $a0, choice    
	li $v0, 4
	syscall

	#getting choice from user
	li $v0, 5
	syscall
	
	beq $v0, 1, executeBubble
	beq $v0, 2, executeFactorize
	beq $v0, 3, executePrimes

	#printing err message
	la $a0, err    
	li $v0, 4
	syscall
	j loop

executeBubble:
	li $v0,18 #CreateProcess syscall
	la $a0, bubbleSortBuffer
	syscall
	b continue

executeFactorize:
	li $v0,18 #CreateProcess syscall
	la $a0, factorizeBuffer
	syscall
	b continue

executePrimes:
	li $v0,18 #CreateProcess syscall
	la $a0, ShowPrimesBuffer
	syscall
	b continue

continue:
	#putting new line before new usage
	la $a0, line   
	li $v0, 4
	syscall

	j loop
