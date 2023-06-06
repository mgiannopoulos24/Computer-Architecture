################
# Text Segment #
################


	.text
	.globl __start
__start:


	lw $s0,w0
	lw $s1,w1
	
	mult $s0, $s1
	
	mfhi $s2
	
	sw $s2 , 8 ($s0)
	
	mflo $s3
	
	
	












################
# Data Segment #
################


.data




