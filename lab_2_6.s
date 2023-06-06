################
# Text Segment #
################

	.text
	.globl __start
__start:

	lw $s0, w1 #high A
	lw $s1, w2 #high B
	lw $s2, w3 #low A
	lw $s3, w4 #low B


	addu $s4, $s0,$s2

	srl $s0,$s0,31
	srl $s2,$s2,31


################
# Data Segment #
################


.data
