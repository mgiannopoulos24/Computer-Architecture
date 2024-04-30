#############################
#       Text Segment        #
#############################

.text
.globl main

main:

### Part (b)
# Load data from Addr11
	la $a0, Addr11          # Load address into $a0
	lbu $t0, 0($a0)         # Load unsigned byte into $t0
	lhu $t1, 0($a0)         # Load halfword into $t1
	lw $t2, 0($a0)          # Load word into $t2

### Part (c)
# Load data from Addr12
	la $a0, Addr12          # Load address into $a0
	lbu $t3, 0($a0)         # Load unsigned byte into $t3
	lhu $t4, 0($a0)         # Load halfword into $t4
	lw $t5, 0($a0)          # Load word into $t5

### Part (d)
# Load data from Addr11 using signed load instructions
	la $a0, Addr11          # Load address into $a0
	lb $t0, 0($a0)          # Load signed byte into $t0
	lh $t1, 0($a0)          # Load signed halfword into $t1
	lw $t2, 0($a0)          # Load word into $t2

# Load data from Addr12 using signed load instructions
	la $a0, Addr12          # Load address into $a0
	lb $t3, 0($a0)          # Load signed byte into $t3
	lh $t4, 0($a0)          # Load signed halfword into $t4
	lw $t5, 0($a0)          # Load word into $t5

# Set breakpoint here to observe register contents before and after this point

### Part (e)
# Load byte from Addr12 and store it to Addr12 offset by 16 bytes
	lbu $t6, 4($a0)
	sb $t6, 16($a0)

### Part (f)
# Store byte from $t6 to memory, assuming big-endian
	la $a0, Addr12          # Load address into $a0
	sb $t6, 0($a0)          # Store byte from $t6 to memory at Addr12

# Exit syscall
	li $v0, 10
	syscall

#############################
#          Data Segment     #
#############################

## Part (a)
.data
Addr11: .byte 0x01, 0x02, 0x03, 0x04  # Address 0x10010000  - 0x10010003
Addr12: .byte 0x81, 0x82, 0x83, 0x84  # Address 0x10010004  - 0x10010007
Addr13: .word 0x12345678               # Address 0x10010008
Addr14: .word 0x87654321               # Address 0x1001000C
