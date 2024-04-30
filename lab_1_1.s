###################################################
# 
# lab1_1.s 
# Pseudoinstruction examples - System calls 
# t0 - holds each byte from string in turn 
# t1 - contains count of characters 
# t2 - points to the string 
# 
###################################################
#############################
#       Text Segment        #
#############################

.text
.globl main

# The main function starts here
main:
    # t2 points to the beginning of the string
    la $t2, str
    # Initialize t1 to hold the count of characters
    li $t1, 0

# Loop to iterate through each character of the string
nextCh:
    # Load a byte from the string into t0
    lb $t0, ($t2)
    # Check if the byte is zero, indicating the end of the string
    beqz $t0, strEnd
    # Increment the character count
    addi $t1, $t1, 1
    # Move the pointer to the next character
    addi $t2, $t2, 1
    # Continue to the next iteration of the loop
    j nextCh

# Code execution reaches here when the end of the string is encountered
strEnd:
    # System call to print a message
    la $a0, ans
    li $v0, 4
    syscall

    # System call to print the length of the string
    move $a0, $t1
    li $v0, 1
    syscall

    # System call to print a newline
    la $a0, endl
    li $v0, 4
    syscall

    # Exit the program
    li $v0, 10
    syscall

#############################
#          Data Segment     #
#############################
.data
# Define the string "hello world"
str: .asciiz "hello world"
# Define a message to indicate the length of the string
ans: .asciiz "Length is "
# Define a newline character
endl: .asciiz "\n"

