################
# Text Segment #
################

	.text
	.globl main
	
main:

## Part (a): Loading bytes from memory at addresses Addr11 and Addr12

	# Load address of Addr11 into $s1
	la $s1, Addr11
	# Load byte at offset 10 from Addr11 into $t0
	lb $t0, 10($s1)
	# Load byte at offset 11 from Addr11 into $t1
	lb $t1, 11($s1)
	# Load byte at offset 12 from Addr11 into $t2
	lb $t2, 12($s1)
		
## Part (b): Storing half-word 0x6677 at the current address

	# Store half-word 0x6677 at the current address
	.half 0x6677
		
	# Load address of Addr13 into $s2
	la $s2, Addr13
	# Load word from Addr13 into $t9
	lw $t9, ($s2)
		
	# Exit the program
	li $v0, 10         # syscall code for exit
	syscall
		
################
# Data Segment #
################

	.data
	# Define memory addresses and data
	
	# Addr11: Bytes 0x01, 0x02, 0x03, 0x04, 0x05 (Address 0x10010000 - 0x10010003)
	Addr11: .byte 0x01, 0x02, 0x03, 0x04, 0x05
	# Addr12: Bytes 0x81, 0x82, 0x83, 0x84 (Address 0x10010004 - 0x10010007)
	Addr12: .byte 0x81, 0x82, 0x83, 0x84
	# Addr13: Word 0x12345678 (Address 0x10010008)
	Addr13: .word 0x12345678
	# Addr14: Word 0x87654321 (Address 0x1001000C)
	Addr14: .word 0x87654321
		
	.align 0

################
# Text Segment #
################

## Part (c): Loading half-word and word from unaligned addresses

	ulh $t3, 3($s1)    # Load half-word from unaligned address 0x1001000B
	ulw $t4, 3($s1)    # Load word from unaligned address 0x10010008
