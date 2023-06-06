 ################
  # Text Segment #
 ################


	.text
	.globl __start
__start:


		li $v0, 5
		la $a0, int1
		syscall
		
		li $v0, 1
		syscall
		
		li $v0, 10
		syscall
		
		.data
			int1