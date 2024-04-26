### Part (a)

.data
    # Define variables
    num1:   .word 32767      # First number (max positive value)
    num2:   .word 1          # Second number
    result: .word 0          # Result of addition
    overflow: .space 4       # Overflow flag

.text
.globl main

main:
    lw $t0, num1            # Load first number into $t0
    lw $t1, num2            # Load second number into $t1
    
    add $t2, $t0, $t1       # Add the two numbers without checking overflow
    
    # Check overflow using XOR operation
    xor $t3, $t0, $t2       # If signs of $t0 and $t2 differ, then overflow occurred
    xor $t4, $t1, $t2       # If signs of $t1 and $t2 differ, then overflow occurred
    and $t5, $t3, $t4       # If both signs differ, then overflow occurred
    slt $t6, $zero, $t5     # Set $t6 to 1 if overflow occurred, 0 otherwise
    
    sw $t6, overflow        # Store overflow flag
    
    # Exit program
    li $v0, 10              # Load exit syscall number
    syscall                 # Perform exit syscall
