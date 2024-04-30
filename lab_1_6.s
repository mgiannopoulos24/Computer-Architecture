.data
prompt1: .asciiz "Enter the first integer: "   # Prompt for the first integer
prompt2: .asciiz "Enter the second integer: "  # Prompt for the second integer
sum_msg: .asciiz "Sum: "                        # Message for sum
newline: .asciiz "\n"                          # Newline character
diff_msg: .asciiz "Difference: "                # Message for difference

.text
.globl main

main:
    # Print prompt for first integer
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, prompt1  # Load address of prompt1 into $a0
    syscall           # Execute syscall to print prompt1
    
    # Read first integer
    li $v0, 5         # Load immediate value 5 to $v0 (syscall code for reading integer)
    syscall           # Execute syscall to read first integer
    move $s0, $v0     # Move the first integer read to register $s0
    
    # Print prompt for second integer
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, prompt2  # Load address of prompt2 into $a0
    syscall           # Execute syscall to print prompt2
    
    # Read second integer
    li $v0, 5         # Load immediate value 5 to $v0 (syscall code for reading integer)
    syscall           # Execute syscall to read second integer
    move $s1, $v0     # Move the second integer read to register $s1
    
    # Calculate sum
    add $t0, $s0, $s1 # Add the first and second integers and store the result in $t0
    
    # Calculate difference
    sub $t1, $s0, $s1 # Subtract the second integer from the first integer and store the result in $t1
    
    # Print sum message
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, sum_msg   # Load address of sum_msg into $a0
    syscall           # Execute syscall to print sum_msg
    
    # Print sum
    li $v0, 1         # Load immediate value 1 to $v0 (syscall code for printing integer)
    move $a0, $t0     # Move the sum stored in $t0 to $a0 for printing
    syscall           # Execute syscall to print the sum
    
    # Print newline
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, newline   # Load address of newline into $a0
    syscall           # Execute syscall to print newline
    
    # Print difference message
    li $v0, 4         # Load immediate value 4 to $v0 (syscall code for printing string)
    la $a0, diff_msg  # Load address of diff_msg into $a0
    syscall           # Execute syscall to print diff_msg
    
    # Print difference
    li $v0, 1         # Load immediate value 1 to $v0 (syscall code for printing integer)
    move $a0, $t1     # Move the difference stored in $t1 to $a0 for printing
    syscall           # Execute syscall to print the difference
    
    # Exit
    li $v0, 10        # Load immediate value 10 to $v0 (syscall code for exit)
    syscall           # Execute syscall to exit
