.data
prompt: .asciiz "Enter an integer: "
divisible_by_2: .asciiz "The number is divisible by 2. "
divisible_by_3: .asciiz "The number is divisible by 3. "
divisible_by_5: .asciiz "The number is divisible by 5. "
newline: .asciiz "\n"

.text
.globl main

main:
    # Prompt user for input
    li $v0, 4         # System call code for printing string
    la $a0, prompt    # Load address of the prompt string
    syscall           # Print the prompt
    
    # Read integer from user
    li $v0, 5         # System call code for reading integer
    syscall           # Read integer from user
    move $t0, $v0     # Save the input integer in $t0
    
    # Check divisibility by 2
    li $t1, 2         # Load divisor 2
    div $t0, $t1      # Divide input by 2
    mfhi $t2          # Get remainder
    bne $t2, $zero, divisible_by_2_case  # Branch if remainder is not zero
    
    # Check divisibility by 3
    li $t1, 3         # Load divisor 3
    div $t0, $t1      # Divide input by 3
    mfhi $t2          # Get remainder
    bne $t2, $zero, divisible_by_3_case  # Branch if remainder is not zero
    
    # Check divisibility by 5
    li $t1, 5         # Load divisor 5
    div $t0, $t1      # Divide input by 5
    mfhi $t2          # Get remainder
    bne $t2, $zero, divisible_by_5_case  # Branch if remainder is not zero
    
    # If none of the above conditions met, end program
    j end

divisible_by_2_case:
    # Print message for divisibility by 2
    li $v0, 4
    la $a0, divisible_by_2
    syscall
    j end  # Jump to end

divisible_by_3_case:
    # Print message for divisibility by 3
    li $v0, 4
    la $a0, divisible_by_3
    syscall
    j end  # Jump to end

divisible_by_5_case:
    # Print message for divisibility by 5
    li $v0, 4
    la $a0, divisible_by_5
    syscall
    j end  # Jump to end

end:
    # Exit program
    li $v0, 10
    syscall
