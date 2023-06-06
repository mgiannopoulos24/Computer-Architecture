 ################
  # Text Segment #
 ################


	.text
	.globl __start
__start:

		li $v0, 8
		la $a0, string
		li $a1, 6
		syscall
		
		li $v0, 4
		syscall
		
		li $v0, 10
		syscall
		
	
	
	.data 
	 
		string:
			.asciiz
			.space 6
			
	