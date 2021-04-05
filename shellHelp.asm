.data
.text
.globl main

main:
	
	#CreateProcess syscall
	li $v0,18
	lw $a0, 4($a1)
	syscall

	li $v0,10
	syscall

	