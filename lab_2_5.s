################
# Text Segment #
################

	.text
	.globl __start
__start:

	lw $s1,words
	lw $s0, words1
	
	addu $s5, $s1, $s0
	not $s2, $s5
	
	and $s3,$s1,$s2
	and $s4,$s0, $s2
	and $s6, $s1, $s0
	
	or $s0, $s3, $s4
	or $s0, $s0, $s6
	
	li $v0,0xA
	syscall
	

################
# Data Segment #
################

	.data
words: .word 0x00
words1: .word 0x01
