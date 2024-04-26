.data
buffer: .space 256    # Χώρος για αποθήκευση της συμβολοσειράς
prompt: .asciiz "Enter a string: " 
output_prompt: .asciiz "First five characters: "

.text
.globl main

main:
    # Print input prompt
    li $v0, 4
    la $a0, prompt
    syscall
    
    # Read string from console
    li $v0, 8
    la $a0, buffer
    li $a1, 256
    syscall
    
    # Print output prompt
    li $v0, 4
    la $a0, output_prompt
    syscall
    
    # Load address of the buffer to $a0
    la $a0, buffer
    
    # Print first five characters of the string
    li $v0, 4        # Κωδικός κλήσης για εκτύπωση συμβολοσειράς
    syscall
    
    # Exit
    li $v0, 10
    syscall
