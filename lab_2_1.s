.data
    input:  .word 0x12345678     # The initial binary number here

.text
    # Execute the main part of the program
    main:
        lw $t0, input           # Load the number from memory
        jal binary_to_gray      # Call the function to convert to Gray code
        li $v0, 10              # Exit code for the syscall
        syscall                 # Terminate the program

    # Function to convert a binary number to Gray code
    binary_to_gray:
        li $t1, 0               # Initialize a register for the Gray code number
        li $t2, 1               # Initialize a register for the change mask
        li $t3, 32              # Initialize a register for the number of bits

    loop:
        and $t4, $t0, $t2      # Logical AND operation to get the last bit
        xor $t1, $t1, $t4      # XOR operation to obtain the Gray code
        srl $t0, $t0, 1        # Right shift the binary number
        srl $t2, $t2, 1        # Right shift the mask
        addi $t3, $t3, -1      # Decrease the bit counter
        bnez $t3, loop         # Repeat until all bits are exhausted

        # Return the Gray code
        jr $ra
