.data
prompt1: .asciiz "Enter the first integer: "
prompt2: .asciiz "Enter the second integer: "
sum_msg: .asciiz "Sum: "
newline: .asciiz "\n"  # Newline character
diff_msg: .asciiz "Difference: "

.text
.globl main

main:
    # Print prompt for first integer
    li $v0, 4
    la $a0, prompt1
    syscall
    
    # Read first integer
    li $v0, 5
    syscall
    move $s0, $v0 # Save the first integer
    
    # Print prompt for second integer
    li $v0, 4
    la $a0, prompt2
    syscall
    
    # Read second integer
    li $v0, 5
    syscall
    move $s1, $v0 # Save the second integer
    
    # Calculate sum
    add $t0, $s0, $s1
    
    # Calculate difference
    sub $t1, $s0, $s1
    
    # Print sum
    li $v0, 4
    la $a0, sum_msg
    syscall
    li $v0, 1
    move $a0, $t0
    syscall
    
    # Print newline
    li $v0, 4
    la $a0, newline
    syscall

    # Print difference
    li $v0, 4
    la $a0, diff_msg
    syscall
    li $v0, 1
    move $a0, $t1
    syscall
    
    # Exit
    li $v0, 10
    syscall
