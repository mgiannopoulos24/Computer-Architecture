################
# Text Segment #
################

    .text
    .globl main
main:

    lw $t0, number1     # Load the first number from memory
    lw $t1, number2     # Load the second number from memory

    addu $t2, $t0, $t1  # Perform the addition
    
    li $t3, 0x80000000  # Set $t3 with the 33rd bit (MSB)
    and $t4, $t2, $t3   # Extract the 33rd bit of the sum
    
    srl $t4, $t4, 31    # Move the 33rd bit to the LSB position
    sw $t4, result      # Store the 33rd bit result into memory
    
    # Exit the program
    li $v0, 10          # syscall code for exit
    syscall

################
# Data Segment #
################

    .data
number1: .word 0x7FFFFFFF  # First number (positive)
number2: .word 0x00000001  # Second number (positive)
result:  .word 0           # Result bit (initialize to 0)
