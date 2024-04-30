.data
input_word: .word 0x12345678      # Input in big-endian format
output_word: .word 0               # Empty register for output in little-endian format

.text
.globl main

main:
    lw $t0, input_word           # Load the input into register $t0
    srl $t1, $t0, 24             # Move the first 8 bits of $t0 to the last 8 bits of $t1
    sll $t2, $t0, 24             # Move the last 8 bits of $t0 to the first 8 bits of $t2
    srl $t3, $t0, 8              # Move the second 8 bits of $t0 to the last 8 bits of $t3
    sll $t4, $t0, 8              # Move the last 8 bits of $t0 to the second 8 bits of $t4
    or $t5, $t1, $t2             # Merge the bits of $t1 and $t2
    or $t6, $t3, $t4             # Merge the bits of $t3 and $t4
    or $t7, $t5, $t6             # Merge the bits of $t5 and $t6
    sw $t7, output_word          # Store the output into register output_word

    # End of program
    li $v0, 10                   # Exit code for program termination
    syscall
