.data
    # Define the input pairs of signed 32-bit binary numbers
    num1:   .word 0b01111111111111111111111111111111   # 2147483647
    num2:   .word 0b00000000000000000000000000000001   # 1
    
    # Define the input pairs of signed 32-bit decimal numbers
    dec_num1:   .word 2147483647   # Maximum positive 32-bit integer
    dec_num2:   .word 1            # 1
    
    # Define variables to store the result and overflow flag
    result: .word 0
    overflow_flag: .word 0

    # Define variables to store the result and comparison flag for decimal addition
    dec_result_add: .word 0
    dec_result_addu: .word 0
    comparison_flag: .word 0

.text
    .globl main
main:
    ### Part (a)
    # Load the first number into register $t0
    lw $t0, num1
    
    # Load the second number into register $t1
    lw $t1, num2
    
    # Perform addition
    add $t2, $t0, $t1
    
    # Store the result
    sw $t2, result
    
    # Check for overflow
    slt $t3, $t2, $t0      # Check if result is less than first operand
    slt $t4, $t2, $t1      # Check if result is less than second operand
    xor $t5, $t3, $t4      # Overflow occurs if the signs of the operands are different and the sign of the result is different from the sign of the operands
    sw $t5, overflow_flag  # Store overflow flag
    
    ### Part (b)
    # Load the first decimal number into register $t0
    lw $t0, dec_num1
    
    # Load the second decimal number into register $t1
    lw $t1, dec_num2
    
    # Perform addition
    add $t2, $t0, $t1
    
    # Store the result
    sw $t2, dec_result_add
    
    # Compare with binary result
    lw $t3, result        # Load the binary result
    sub $t4, $t3, $t2     # Subtract the decimal result from the binary result
    seq $t5, $zero, $t4   # Set t5 to 1 if the difference is zero, indicating the results are the same
    
    # Store comparison flag
    sw $t5, comparison_flag
    
    ### Part (c)
    # Perform addition with unsigned addition (addu)
    addu $t3, $t0, $t1
    # Store the result
    sw $t3, dec_result_addu
    
    # Display decimal result of add
    li $v0, 1              # Load syscall code for printing integer
    lw $a0, dec_result_add  # Load the address of decimal result of add into argument register
    syscall                # Print the decimal result of add
    
    # Display decimal result of addu
    li $v0, 1              # Load syscall code for printing integer
    lw $a0, dec_result_addu  # Load the address of decimal result of addu into argument register
    syscall                # Print the decimal result of addu
    
    # Display result
    li $v0, 1              # Load syscall code for printing integer
    lw $a0, result         # Load the address of result into argument register
    syscall                # Print the result
    
    # Display overflow flag
    li $v0, 1              # Load syscall code for printing integer
    lw $a0, overflow_flag  # Load the address of overflow flag into argument register
    syscall                # Print the overflow flag
    
    # Display comparison flag
    li $v0, 1              # Load syscall code for printing integer
    lw $a0, comparison_flag  # Load the address of comparison flag into argument register
    syscall                # Print the comparison flag
    
    # Exit program
    li $v0, 10             # Load syscall code for exit
    syscall
