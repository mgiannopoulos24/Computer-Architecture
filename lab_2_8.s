#################################################
# 
# lab2_8a.s 
# 32 / 32 bit division 
# 
################################################# 

#############################
#       Text Segment        #
#############################

.text 
.globl main 
main: 
    # Input dividend
    la $a0, dividend        # Load address of "Enter dividend:" string
    li $v0, 4               # Load print string syscall code
    syscall                 # Prompt for dividend 
    li $v0, 5               # Load read integer syscall code
    syscall                 # Read dividend 
    move $t0, $v0           # Move dividend to $t0 

    # Input divisor
    la $a0, divisor         # Load address of "Enter divisor:" string
    li $v0, 4               # Load print string syscall code
    syscall                 # Prompt for divisor 
    li $v0, 5               # Load read integer syscall code
    syscall                 # Read divisor 
    move $t1, $v0           # Move divisor to $t1 

    # Perform division
    div $t0, $t1            # Divide dividend by divisor

    # Output quotient
    la $a0, quotient        # Load address of "Quotient is: " string
    li $v0, 4               # Load print string syscall code
    syscall                 # Display "quotient is :" 
    move $a0, $t0           # Move quotient to $a0
    li $v0, 1               # Load print integer syscall code
    syscall                 # Display quotient 

    # Output remainder
    la $a0, remainder       # Load address of "Remainder is: " string
    li $v0, 4               # Load print string syscall code
    syscall                 # Display "remainder is :" 
    move $a0, $t1           # Move remainder to $a0
    li $v0, 1               # Load print integer syscall code
    syscall                 # Display remainder 

    # Output newline
    la $a0, endl            # Load address of newline string
    li $v0, 4               # Load print string syscall code
    syscall                 # Print newline 

    # Exit
    li $v0, 10              # Load exit syscall code
    syscall                 # Exit 

#############################
#          Data Segment     #
#############################

.data 
dividend: .asciiz "Enter dividend:" 
divisor: .asciiz "Enter divisor:" 
endl: .asciiz "\n" 
quotient: .asciiz "Quotient is: " 
remainder: .asciiz "Remainder is: " 
