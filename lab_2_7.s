    .text
    .globl main
	main:

    lw $s0, number1     # Load the first number from memory
    lw $s1, number2     # Load the second number from memory
    
    # Multiply the two numbers with sign
    mult $s0, $s1       # Multiply the numbers

    mfhi $s2            # Get the high part of the result (signed)
    mflo $s3            # Get the low part of the result
    
    # Store the signed result in memory
    sw $s2, result_signed_hi   # Store the high part of the signed result
    sw $s3, result_signed_lo   # Store the low part of the signed result

    # Multiply the two numbers unsigned
    multu $s0, $s1      # Multiply the numbers unsigned

    mfhi $s4            # Get the high part of the result (unsigned)
    mflo $s5            # Get the low part of the result
    
    # Store the unsigned result in memory
    sw $s4, result_unsigned_hi   # Store the high part of the unsigned result
    sw $s5, result_unsigned_lo   # Store the low part of the unsigned result
    
    # Exit the program
    li $v0, 10          # syscall code for exit
    syscall

	.data
	number1: .word 0xFFFFFFFF  # First number (-1 in two's complement)
	number2: .word 0x00000002  # Second number (2)
	result_signed_hi:  .word 0 # Result (high part) of signed multiplication
	result_signed_lo:  .word 0 # Result (low part) of signed multiplication
	result_unsigned_hi:  .word 0 # Result (high part) of unsigned multiplication
	result_unsigned_lo:  .word 0 # Result (low part) of unsigned multiplication
