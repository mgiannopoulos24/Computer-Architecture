    .text
    .globl __start
__start:

    # Load the first number from memory
    lw $t0, number1     # Load the first number from memory
    lw $t1, number1 + 4 # Load the next 4 bytes of the first number

    # Load the second number from memory
    lw $t2, number2     # Load the second number from memory
    lw $t3, number2 + 4 # Load the next 4 bytes of the second number

    # Perform addition of the lower 32 bits
    addu $t4, $t0, $t2

    # Check for overflow in lower 32 bits
    sltu $t5, $t4, $t0   # Check if addition resulted in a carry
    addu $t1, $t1, $t3   # Add the higher 32 bits
    addu $t1, $t1, $t5   # Add the carry if present
    
    # Store the result in memory
    sw $t4, result       # Store the lower 32 bits of the result
    sw $t1, result + 4   # Store the higher 32 bits of the result
    
    # Exit the program
    li $v0, 10          # syscall code for exit
    syscall

    .data
number1: .word 0x00000001  # First number (little-endian, lower 32 bits)
         .word 0x7FFFFFFF  # First number (little-endian, higher 32 bits)
number2: .word 0xFFFFFFFF  # Second number (little-endian, lower 32 bits)
         .word 0xFFFFFFFF  # Second number (little-endian, higher 32 bits)
result:  .word 0           # Result (initialize to 0)
