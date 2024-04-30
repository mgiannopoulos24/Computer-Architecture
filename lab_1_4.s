.data
buffer: .space 256    # Space to store the string
prompt: .asciiz "Enter a string: " 
output_prompt: .asciiz "First five characters: "

.text
.globl main

main:
    # Print input prompt
    li $v0, 4        # System call code for printing a string
    la $a0, prompt   # Load the address of the prompt into $a0
    syscall          # Invoke the syscall to print the prompt
    
    # Read string from console
    li $v0, 8        # System call code for reading a string
    la $a0, buffer   # Load the address of the buffer into $a0
    li $a1, 256      # Load the maximum number of characters to read into $a1
    syscall          # Invoke the syscall to read the string
    
    # Print output prompt
    li $v0, 4            # System call code for printing a string
    la $a0, output_prompt   # Load the address of the output prompt into $a0
    syscall              # Invoke the syscall to print the output prompt
    
    # Load address of the buffer to $a0
    la $a0, buffer      # Load the address of the buffer into $a0
    
    # Print first five characters of the string
    li $v0, 4           # System call code for printing a string
    syscall             # Invoke the syscall to print the string
    
    # Exit
    li $v0, 10          # System call code for exit
    syscall             # Invoke the syscall to exit
