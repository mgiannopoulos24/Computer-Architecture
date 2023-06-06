################
# Text Segment #
################

	.text
	.globl __start
__start:

main:
		la $a0, ask_msg
		li $v0,4
		syscall
	
		li $v0, 5       
		syscall          
	
		li $v0 


check_2_3_or_5: 








.data
	ask_msg: .asciiz "\n Enter integer: "
	even_msg: .asciiz "\n The number is  even. \n"
