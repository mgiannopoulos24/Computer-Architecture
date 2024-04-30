.data
input_prompt: .asciiz "Enter an integer: "  # Prompt for user input
output_prompt: .asciiz "You entered: "       # Prompt for output

.text
.globl main

main:
    # Print input prompt
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, input_prompt  # Load address of input prompt into $a0
    syscall           # Execute syscall to print input prompt
    
    # Read integer from console
    li $v0, 5         # Load immediate value 5 to $v0 (syscall code for reading integer)
    syscall           # Execute syscall to read integer from console
    move $t0, $v0     # Move the integer read from console to temporary register $t0
    
    # Print output prompt
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, output_prompt  # Load address of output prompt into $a0
    syscall           # Execute syscall to print output prompt
    
    # Print the integer
    move $a0, $t0     # Move the integer value from temporary register $t0 to $a0 for printing
    li $v0, 1         # Load immediate value 1 to $v0 (syscall code for printing integer)
    syscall           # Execute syscall to print the integer
    
    # Exit
    li $v0, 10        # Load immediate value 10 to $v0 (syscall code for exit)
    syscall           # Execute syscall to exit
