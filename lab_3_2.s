.data
word1: .word 0b11001010110100101100101011010010  # First 32-bit word
word2: .word 0b11010010110100101100101011001010  # Second 32-bit word
hamming_distance: .word 0  # Variable to store the Hamming distance

.text
.globl main

main:
    lw $t0, word1    # Load first word into $t0
    lw $t1, word2    # Load second word into $t1

    # Initialize counter for Hamming distance
    li $t2, 0

calculate_hamming_distance:
    # Check if both words are zero (end of calculation)
    beq $t0, $zero, end_calculation

    # Extract the least significant bit of each word and XOR them
    andi $t3, $t0, 1      # Extract the least significant bit of $t0
    andi $t4, $t1, 1      # Extract the least significant bit of $t1
    xor $t3, $t3, $t4     # XOR the LSBs

    # Update Hamming distance counter if the result of XOR is 1
    bne $t3, $zero, increment_hamming_distance

    # Shift right both words to process the next bit
    srl $t0, $t0, 1       # Shift right $t0 by 1 bit
    srl $t1, $t1, 1       # Shift right $t1 by 1 bit

    # Repeat the process for the next bit
    j calculate_hamming_distance

increment_hamming_distance:
    # Increment the Hamming distance counter
    addi $t2, $t2, 1

    # Shift right both words to process the next bit
    srl $t0, $t0, 1       # Shift right $t0 by 1 bit
    srl $t1, $t1, 1       # Shift right $t1 by 1 bit

    # Repeat the process for the next bit
    j calculate_hamming_distance

end_calculation:
    # Store the result in memory
    sw $t2, hamming_distance

    # Exit program
    li $v0, 10
    syscall
