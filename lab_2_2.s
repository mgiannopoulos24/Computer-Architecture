################
# Text Segment #
################



	.text
	.globl __start
__start:


	li $t0, 0x12345678 ##load big endian word

	sll $t1,$t0,8
	li $t2, 0x00FF00FF
	and $t3,$t1,$t2
	srl $t1,$t0,8
	not $t2,$t2
	and $t1,$t1,$t2
	or $t3,$t3,$t1
	
	li $v0,10
	syscall   
















###############
# Data Segment #
###############

	.data
