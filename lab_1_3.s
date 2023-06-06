################
# Text Segment #
################

	.text
	.globl __start
__start:

##part (a)

		la $s1, Addr11
		lb $t0, 10($s1)
		lb $t1, 11($s1)
		lb $t2, 12($s1)
		
##part (b)
		.half 0x6677
		
		la 
		
		
		##la$s0, Addr13
		##lw $t9,($s2)
		
		li $v0,10
		syscall
		
	.data
		Addr11: .byte 0x01, 0x02, 0x03, 0x04,0x05 #Address 0x10010000  - 0x10010003
		Addr12: .byte 0x81, 0x82, 0x83, 0x84 #Address 0x10010004  - 0x10010007
		Addr13: .word 0x12345678 #Address 0x10010008
		Addr14: .word 0x87654321 #Address 0x1001000C
		
	.align 0

	