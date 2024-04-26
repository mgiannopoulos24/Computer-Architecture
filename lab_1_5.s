.data
input_prompt: .asciiz "Enter an integer: "
output_prompt: .asciiz "You entered: "

.text
.globl main

main:
    # Print input prompt
    li $v0, 4
    la $a0, input_prompt
    syscall
    
    # Read integer from console
    li $v0, 5
    syscall
    move $t0, $v0 # Save the integer
    
    # Print output prompt
    li $v0, 4
    la $a0, output_prompt
    syscall
    
    # Print the integer
    move $a0, $t0
    li $v0, 1
    syscall
    
    # Exit
    li $v0, 10
    syscall
